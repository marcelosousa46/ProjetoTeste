unit uEmpregadoView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,  Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, uEmpregadosController, uCadastroBase, Vcl.DBCtrls, Vcl.Mask;

type
  TfrmCadastroEmpregado = class(TfrmCadastroBase)
    Label1: TLabel;
    edNome: TEdit;
    dblDepartamento: TDBLookupComboBox;
    Label2: TLabel;
    Label3: TLabel;
    edFuncao: TEdit;
    Label4: TLabel;
    dtDataAdimissao: TDateTimePicker;
    Label5: TLabel;
    edSalario: TEdit;
    Label6: TLabel;
    edComissao: TEdit;
    btExportar: TSpeedButton;
    procedure btSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btInsertClick(Sender: TObject);
    procedure edSalarioExit(Sender: TObject);
    procedure edComissaoExit(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btEditClick(Sender: TObject);
    procedure btExportarClick(Sender: TObject);
  private
    FController : TEmpregadoController;
    function formataCampo(fonte: string):string;
    function fcStrToFloatDolarReal(valor: string): Currency;
    function fcStrToFloatRealDolar(valor: string): Currency;
    procedure limparCampos;
  public
    { Public declarations }
  end;

var
  frmCadastroEmpregado: TfrmCadastroEmpregado;

implementation

{$R *.dfm}

uses uDM;

procedure TfrmCadastroEmpregado.btEditClick(Sender: TObject);
begin
  inherited;
  dm.fdDepartamentos.Active := true;
  edNome.Text          := dm.fdEmpregados.FieldByName('nm_empregado').AsString;
  edFuncao.Text        := dm.fdEmpregados.FieldByName('nm_funcao').AsString;
  dtDataAdimissao.Date := dm.fdEmpregados.FieldByName('data_admissao').AsDateTime;
  edSalario.Text       := FormatFloat('##,##0.00', dm.fdEmpregados.FieldByName('salario').AsFloat);
  edComissao.Text      := FormatFloat('##,##0.00', dm.fdEmpregados.FieldByName('comissao').AsFloat);
end;

procedure TfrmCadastroEmpregado.btExcluirClick(Sender: TObject);
begin
  inherited;
  FController.Empregado.Id_empregado := dm.fdEmpregados.FieldByName('id_empregado').AsInteger;
  FController.ExcluirEmpregado;
  FController.CarregarDados('');

end;

procedure TfrmCadastroEmpregado.btExportarClick(Sender: TObject);
begin
  inherited;
  FController.ExportarDados;
end;

procedure TfrmCadastroEmpregado.btInsertClick(Sender: TObject);
begin
  inherited;
  limparCampos;
  dm.fdDepartamentos.Active := true;
end;

procedure TfrmCadastroEmpregado.btSalvarClick(Sender: TObject);
begin
  inherited;
  with FController.Empregado do
  begin
    Id_empregado     := dm.fdEmpregados.FieldByName('id_empregado').AsInteger;
    Nm_empregado     := edNome.Text;
    Nm_funcao        := edFuncao.Text;
    Data_admissao    := dtDataAdimissao.Date;
    Salario          := fcStrToFloatRealDolar(edSalario.Text);
    Comissao         := fcStrToFloatRealDolar(edComissao.Text);
    Cod_departamento := dblDepartamento.KeyValue;
  end;
  if ftipoAcao = tpinsert then
    FController.InserirEmpregado
  else
    FController.UpdateEmpregado;
  FController.CarregarDados('');

end;

procedure TfrmCadastroEmpregado.edComissaoExit(Sender: TObject);
begin
  inherited;
  edComissao.text := formataCampo(edComissao.Text);
end;

procedure TfrmCadastroEmpregado.edSalarioExit(Sender: TObject);
begin
  inherited;
  edSalario.text := formataCampo(edSalario.Text);
end;

function TfrmCadastroEmpregado.fcStrToFloatDolarReal(valor: string): Currency;
begin
 try
   FormatSettings.DecimalSeparator := ',';
   Result := StrToFloat(StringReplace(valor,'.',',',[rfReplaceAll]));
 except
   Result := 0;
 end;
end;

function TfrmCadastroEmpregado.fcStrToFloatRealDolar(valor: string): Currency;
begin
  try
    FormatSettings.DecimalSeparator := ',';
    Result := StrToFloat(StringReplace(valor,'.','',[rfReplaceAll]));
  except
    Result := 0;
  end;

end;

function TfrmCadastroEmpregado.formataCampo(fonte: string): string;
var
  Valor : real;
begin
  valor := 0;
  if Length(fonte) > 0 then
  begin
    if pos('.', fonte) > 0 then
      fonte := StringReplace(fonte, '.','',[rfReplaceAll, rfIgnoreCase]);
    valor  := StrToCurr(fonte);
  end;
  Result := FormatFloat('#,0.00',(Valor));
end;

procedure TfrmCadastroEmpregado.FormCreate(Sender: TObject);
begin
  inherited;
  FController := TEmpregadoController.Create;
end;

procedure TfrmCadastroEmpregado.FormDestroy(Sender: TObject);
begin
  FController.Free;
  inherited;
end;

procedure TfrmCadastroEmpregado.FormShow(Sender: TObject);
begin
  inherited;
  FController.CarregarDados('');
end;

procedure TfrmCadastroEmpregado.limparCampos;
begin
  edNome.Clear;
  edFuncao.Clear;
  edSalario.Clear;
  edComissao.Clear;
end;

end.
