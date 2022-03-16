unit uDepartamentosRepository;

interface

uses
  uDepartamentosModel, FireDAC.Comp.Client, FireDAC.Stan.Param,uDM;

type

  TDepartamentoRepository = class
  private
    FQueryAux: TFDQuery;
    FMensagem: string;
    FQuery: TFDQuery;
    FDepartamento: TDepartamentosModel;
    function GetultimoId: integer;
  public
    property Mensagem: string read FMensagem write FMensagem;
    property Query: TFDQuery read FQuery write FQuery;
    property Departamento: TDepartamentosModel read FDepartamento write FDepartamento;

    procedure Inserir;
    procedure Deletar;
    procedure Update;
    procedure GetDepartamentos(Filtro: string);

    constructor create;
    destructor Destroy; override;
end;

implementation

uses
  System.SysUtils;

{ TMyClass }

constructor TDepartamentoRepository.create;
begin
  FQueryAux := TFDQuery.Create(nil);
  FQueryAux.Connection := DM.Conexao;
end;

procedure TDepartamentoRepository.Deletar;
begin
  FQuery.SQL.Text := 'DELETE FROM public."DEPARTAMENTOS" ' +
                     '	WHERE id_departamento = :pid_departamento';
  FQuery.Close;
  FQuery.ParamByName('pid_departamento').value  := FDepartamento.Id_departamento;
  FQuery.Prepare;
  FQuery.ExecSQL;

end;

destructor TDepartamentoRepository.Destroy;
begin
  FQueryAux.Free;
  inherited;
end;

procedure TDepartamentoRepository.Update;
begin
  FQuery.SQL.Text := 'UPDATE public."DEPARTAMENTOS" '               +
                     '	SET  nm_departamento = :pNm_departamento, ' +
                     '       local = :pLocal '                      +
                     '	WHERE id_departamento = :pId_departamento;';
  FQuery.Close;
  FQuery.ParamByName('pId_departamento').Value  := FDepartamento.Id_departamento;
  FQuery.ParamByName('pNm_departamento').Value  := FDepartamento.Nm_departamento;
  FQuery.ParamByName('pLocal').Value            := FDepartamento.Local;
  FQuery.Prepare;
  FQuery.ExecSQL;
end;

procedure TDepartamentoRepository.GetDepartamentos(Filtro: string);
var
  Comando: string;
begin
  FQuery.Active := false;
  comando :=  'select            ' +
              '  id_departamento,' +
              '  nm_departamento,' +
              '  local           ' +
              'from              ' +
              '  "DEPARTAMENTOS" ';

  if not (Length(Filtro) = 0) then
  begin
    comando := Comando + 'where nm_departamento like ' + QuotedStr(Filtro);
  end;
  Comando := Comando + 'ORDER BY id_departamento ASC ';

  FQuery.SQL.Text := Comando;
  FQuery.Open;
end;

function TDepartamentoRepository.GetultimoId: integer;
begin
  Result := 1;
  FQueryAux.Close;
  FQueryAux.SQL.Text := 'Select Max(id_departamento)+1 id_departamento from public."DEPARTAMENTOS"';
  FQueryAux.Open;

  if FQueryAux.FieldByName('id_departamento').AsInteger > 1 then
    Result := FQueryAux.FieldByName('id_departamento').AsInteger;
end;

procedure TDepartamentoRepository.Inserir;
begin
  FQuery.SQL.Text := 'INSERT INTO public."DEPARTAMENTOS"( '       +
                     '	id_departamento, nm_departamento, local)' +
                     '	VALUES (:pid_departamento, :pnm_departamento, :plocal);';
  FQuery.Close;
  FQuery.ParamByName('pid_departamento').value  := GetultimoId;
  FQuery.ParamByName('pnm_departamento').Value  := FDepartamento.Nm_departamento;
  FQuery.ParamByName('plocal').Value            := FDepartamento.Local;
  FQuery.Prepare;
  FQuery.ExecSQL;
end;

end.
