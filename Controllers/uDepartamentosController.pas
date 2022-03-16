unit uDepartamentosController;

interface

uses
  uDepartamentosModel, uDepartamentosRepository, Vcl.DBGrids, uDM;

type

  TDepartamentoController = class
  private
    FDepartamento: TDepartamentosModel;
    FDepartamentoRepository: TDepartamentoRepository;
  public
    property Departamento: TDepartamentosModel read FDepartamento write FDepartamento;
    procedure InserirDepartamento;
    procedure CarregarDados(aFiltro: string);
    procedure ExcluirDepartamento;
    procedure UpdateDepartamento;
    procedure ExportarDados;

    constructor create; virtual;
    destructor Destroy; override;

  end;

implementation

uses
  ComObj;

{ TDepartamentoController }

procedure TDepartamentoController.CarregarDados(aFiltro: string);
begin
  FDepartamentoRepository.GetDepartamentos(aFiltro);
end;

constructor TDepartamentoController.Create;
begin
  FDepartamento := TDepartamentosModel.Create;
  FDepartamentoRepository              := TDepartamentoRepository.create;
  FDepartamentoRepository.Query        := dm.fdDepartamentos;
  FDepartamentoRepository.Departamento := FDepartamento;
  FDepartamentoRepository.Departamento := FDepartamento;
end;

destructor TDepartamentoController.Destroy;
begin
  FDepartamento.Free;
  FDepartamentoRepository.Free;
  inherited;
end;

procedure TDepartamentoController.UpdateDepartamento;
begin
  FDepartamentoRepository.Update;
end;

procedure TDepartamentoController.ExcluirDepartamento;
begin
  FDepartamentoRepository.Deletar;
end;

procedure TDepartamentoController.ExportarDados;
var
  Excel: Variant;
  Sheet: Variant;
  L: Integer;
begin
  L := 1;
  Excel := CreateOleObject('Excel.application');
  Excel.WorkBooks.Add;
  Sheet := Excel.Workbooks[1].WorkSheets[1];

  Sheet.Cells.Columns[1].ColumnWidth := 8;
  Sheet.Cells[L, 1].Value := 'ID';
  Sheet.Cells[L, 1].Font.Bold := True;

  Sheet.Cells.Columns[2].ColumnWidth := 30;
  Sheet.Cells[L, 2].Value := 'Nome';
  Sheet.Cells[L, 2].Font.Bold := True;

  Sheet.Cells.Columns[3].ColumnWidth := 20;
  Sheet.Cells[L, 3].Value := 'Local';
  Sheet.Cells[L, 3].Font.Bold := True;

  with DM.fdDepartamentos do
  begin
    First;
    Inc(L);
    while not Eof do
    begin
      Sheet.Cells[L, 1].Value := FieldByName('id_departamento').AsInteger;
      Sheet.Cells[L, 2].Value := FieldByName('nm_departamento').AsString;
      Sheet.Cells[L, 3].Value := FieldByName('local').AsString;
      Inc(L);
      Next;
    end;
  end;

  Excel.Visible := True;
end;

procedure TDepartamentoController.InserirDepartamento;
begin
  FDepartamentoRepository.Inserir;
end;

end.
