unit uEmpregadosController;

interface

uses
  uEmpregadosRepository, uEmpregadosModel;

type

  TEmpregadoController = class
  private
    FEmpregadoRepository: TEmpregadoRepository;
    FEmpregado: TEmpregadosModel;
  public
    property Empregado: TEmpregadosModel read FEmpregado write FEmpregado;
    procedure InserirEmpregado;
    procedure CarregarDados(aFiltro: string);
    procedure ExcluirEmpregado;
    procedure UpdateEmpregado;
    procedure ExportarDados;

    constructor create; virtual;
    destructor Destroy; override;

  end;

implementation

uses
  uDM, ComObj;

{ EmpregadoController }

procedure TEmpregadoController.CarregarDados(aFiltro: string);
begin
  FEmpregadoRepository.GetEmpregados(aFiltro);
end;

constructor TEmpregadoController.create;
begin
  FEmpregado := TEmpregadosModel.Create;
  FEmpregadoRepository              := TEmpregadoRepository.create;
  FEmpregadoRepository.Query        := dm.fdEmpregados;
  FEmpregadoRepository.Empregado    := FEmpregado;

end;

destructor TEmpregadoController.Destroy;
begin
  FEmpregado.Free;
  FEmpregadoRepository.Free;
  inherited;
end;

procedure TEmpregadoController.ExcluirEmpregado;
begin
  FEmpregadoRepository.Deletar;
end;

procedure TEmpregadoController.ExportarDados;
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

  Sheet.Cells.Columns[3].ColumnWidth := 25;
  Sheet.Cells[L, 3].Value := 'Função';
  Sheet.Cells[L, 3].Font.Bold := True;

  Sheet.Cells.Columns[4].ColumnWidth := 12;
  Sheet.Cells[L, 4].Value := 'Admissão';
  Sheet.Cells[L, 4].Font.Bold := True;

  Sheet.Cells.Columns[5].ColumnWidth := 15;
  Sheet.Cells[L, 5].Value := 'Salário';
  Sheet.Cells[L, 5].Font.Bold := True;

  Sheet.Cells.Columns[6].ColumnWidth := 20;
  Sheet.Cells[L, 6].Value := 'Departamento';
  Sheet.Cells[L, 6].Font.Bold := True;

  with DM.fdEmpregados do
  begin
    First;
    Inc(L);
    while not Eof do
    begin
      Sheet.Cells[L, 1].Value := FieldByName('id_empregado').AsInteger;
      Sheet.Cells[L, 2].Value := FieldByName('nm_empregado').AsString;
      Sheet.Cells[L, 3].Value := FieldByName('nm_funcao').AsString;
      Sheet.Cells[L, 4].Value := FieldByName('data_admissao').AsDateTime;
      Sheet.Cells[L, 5].Value := FieldByName('salario').AsCurrency;
      Sheet.Cells[L, 6].Value := FieldByName('nm_departamento').AsString;
      Inc(L);
      Next;
    end;
  end;

  Excel.Visible := True;
end;

procedure TEmpregadoController.InserirEmpregado;
begin
  FEmpregadoRepository.Inserir;
end;

procedure TEmpregadoController.UpdateEmpregado;
begin
  FEmpregadoRepository.Update;
end;

end.
