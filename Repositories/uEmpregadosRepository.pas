unit uEmpregadosRepository;

interface

uses
  uEmpregadosModel, FireDAC.Comp.Client, FireDAC.Stan.Param,uDM;

type

  TEmpregadoRepository = class
  private
    FQueryAux: TFDQuery;
    FMensagem: string;
    FQuery: TFDQuery;
    FEmpregado: TEmpregadosModel;
    function GetultimoId: integer;
  public
    property Mensagem: string read FMensagem write FMensagem;
    property Query: TFDQuery read FQuery write FQuery;
    property Empregado: TEmpregadosModel read FEmpregado write FEmpregado;

    procedure Inserir;
    procedure Deletar;
    procedure Update;
    procedure GetEmpregados(Filtro: string);

    constructor create;
    destructor Destroy; override;
  end;

implementation

uses
  System.SysUtils;

{ TEmpregadoRepository }

constructor TEmpregadoRepository.create;
begin
  FQueryAux := TFDQuery.Create(nil);
  FQueryAux.Connection := DM.Conexao;
end;

procedure TEmpregadoRepository.Deletar;
begin
  FQuery.SQL.Text := 'DELETE FROM public."EMPREGADOS" ' +
                     '	WHERE id_empregado = :pid_empregado';
  FQuery.Close;
  FQuery.ParamByName('pid_empregado').value  := FEmpregado.Id_empregado;
  FQuery.Prepare;
  FQuery.ExecSQL;

end;

destructor TEmpregadoRepository.Destroy;
begin
  FQueryAux.Free;
  inherited;
end;

procedure TEmpregadoRepository.GetEmpregados(Filtro: string);
var
  Comando: string;
begin
  FQuery.Active := false;
  comando :=  'select                                     ' +
              '  e.id_empregado,                          ' +
              '  e.cod_departamento,                      ' +
              '  e.cod_emp_funcao,                        ' +
              '  e.nm_empregado,                          ' +
              '  e.nm_funcao,                             ' +
              '  e.data_admissao,                         ' +
              '  e.salario,                               ' +
              '  e.comissao,                              ' +
              '  d.id_departamento,                       ' +
              '  d.nm_departamento                        ' +
              'from                                       ' +
              '  "EMPREGADOS" e                           ' +
              '  inner join "DEPARTAMENTOS" d on (        ' +
              '    e.cod_departamento = d.id_departamento ' +
              '  )';

  if not (Length(Filtro) = 0) then
  begin
    comando := Comando + 'where nm_empregado like ' + QuotedStr(Filtro);
  end;
  Comando := Comando + 'ORDER BY id_empregado ASC ';

  FQuery.SQL.Text := Comando;
  FQuery.Open;
end;

function TEmpregadoRepository.GetultimoId: integer;
begin
  Result := 1;
  FQueryAux.Close;
  FQueryAux.SQL.Text := 'Select Max(id_empregado)+1 id_empregado from public."EMPREGADOS"';
  FQueryAux.Open;

  if FQueryAux.FieldByName('id_empregado').AsInteger > 1 then
    Result := FQueryAux.FieldByName('id_empregado').AsInteger;

end;

procedure TEmpregadoRepository.Inserir;
begin
  FQuery.SQL.Text := 'INSERT INTO public."EMPREGADOS"(                      ' +
                     '  id_empregado, cod_departamento, cod_emp_funcao,     ' +
                     '  nm_empregado, nm_funcao, data_admissao,             ' +
                     '  salario, comissao                                   ' +
                     ')                                                     ' +
                     'VALUES                                                ' +
                     '  (                                                   ' +
                     '    :pid_empregado,   :pcod_departamento,             ' +
                     '    :pcod_emp_funcao, :pnm_empregado,                 ' +
                     '    :pnm_funcao, :pdata_admissao, :psalario,          ' +
                     '    :pcomissao                                        ' +
                     '  );';
  FQuery.Close;
  FQuery.ParamByName('pid_empregado').value     := GetultimoId;
  FQuery.ParamByName('pcod_departamento').Value := FEmpregado.Cod_departamento;
  FQuery.ParamByName('pcod_emp_funcao').Value   := FEmpregado.Cod_emp_funcao;
  FQuery.ParamByName('pnm_empregado').Value     := FEmpregado.Nm_empregado;
  FQuery.ParamByName('pnm_funcao').Value        := FEmpregado.Nm_funcao;
  FQuery.ParamByName('pdata_admissao').AsDate   := FEmpregado.Data_admissao;
  FQuery.ParamByName('psalario').Value          := FEmpregado.Salario;
  FQuery.ParamByName('pcomissao').Value         := FEmpregado.Comissao;
  FQuery.Prepare;
  FQuery.ExecSQL;
end;

procedure TEmpregadoRepository.Update;
begin
  FQuery.SQL.Text := 'UPDATE              ' +
                  '  public."EMPREGADOS"  ' +
                  'SET                    ' +
                  '  id_empregado     = :pid_empregado,    ' +
                  '  cod_departamento = :pcod_departamento,' +
                  '  cod_emp_funcao   = :pcod_emp_funcao,  ' +
                  '  nm_empregado     = :pnm_empregado,    ' +
                  '  nm_funcao        = :pnm_funcao,       ' +
                  '  data_admissao    = :pdata_admissao,   ' +
                  '  salario          = :psalario,         ' +
                  '  comissao         = :pcomissao         ' +
                  'WHERE                                   ' +
                  '  id_empregado     = :pid_empregado     ';
  FQuery.Close;
  FQuery.ParamByName('pid_empregado').Value       := FEmpregado.Id_empregado;
  FQuery.ParamByName('pcod_departamento').Value   := FEmpregado.Cod_departamento;
  FQuery.ParamByName('pcod_emp_funcao').Value     := FEmpregado.Cod_emp_funcao;
  FQuery.ParamByName('pnm_empregado').Value       := FEmpregado.Nm_empregado;
  FQuery.ParamByName('pnm_funcao').Value          := FEmpregado.Nm_funcao;
  FQuery.ParamByName('pdata_admissao').AsDate     := FEmpregado.Data_admissao;
  FQuery.ParamByName('psalario').AsFloat          := FEmpregado.Salario;
  FQuery.ParamByName('pcomissao').AsFloat         := FEmpregado.Comissao;
  FQuery.Prepare;
  FQuery.ExecSQL;
end;

end.
