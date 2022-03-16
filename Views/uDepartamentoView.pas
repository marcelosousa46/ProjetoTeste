unit uDepartamentoView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroBase, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, uDM, uDepartamentosController;

type
  TfrmCadastroDepartamento = class(TfrmCadastroBase)
    Label1: TLabel;
    edNome: TEdit;
    Label2: TLabel;
    edLocal: TEdit;
    btExportar: TSpeedButton;
    SaveDialog1: TSaveDialog;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btEditClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure btExportarClick(Sender: TObject);
  private
    { Private declarations }
    FController : TDepartamentoController;
  public
    { Public declarations }
  end;

var
  frmCadastroDepartamento: TfrmCadastroDepartamento;

implementation

{$R *.dfm}

procedure TfrmCadastroDepartamento.btEditClick(Sender: TObject);
begin
  inherited;
  edNome.Text  := dm.fdDepartamentos.FieldByName('nm_departamento').AsString;
  edLocal.Text := dm.fdDepartamentos.FieldByName('local').AsString;
end;

procedure TfrmCadastroDepartamento.btExcluirClick(Sender: TObject);
begin
  inherited;
  FController.Departamento.Id_departamento := dm.fdDepartamentos.FieldByName('id_departamento').AsInteger;
  FController.ExcluirDepartamento;
  FController.CarregarDados('');
end;

procedure TfrmCadastroDepartamento.btExportarClick(Sender: TObject);
begin
  inherited;
  FController.ExportarDados;
end;

procedure TfrmCadastroDepartamento.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  FController.CarregarDados(edFiltro.Text);
end;

procedure TfrmCadastroDepartamento.btSalvarClick(Sender: TObject);
begin
  if ftipoAcao = tpinsert then
  begin
    if not ValidarCampoObrigatorio(edNome.Text) then
    begin
      ShowMessage('Nome do departamento obrigatório');
      edNome.SetFocus;
      exit;
    end;
    if not ValidarCampoObrigatorio(edLocal.Text) then
    begin
      ShowMessage('Local obrigatório');
      edLocal.SetFocus;
      exit;
    end;
  end;
  inherited;
  with FController.Departamento do
  begin
    Id_departamento := dm.fdDepartamentos.FieldByName('id_departamento').AsInteger;
    Nm_departamento := edNome.Text;
    Local           := edLocal.Text;
  end;
  if ftipoAcao = tpinsert then
    FController.InserirDepartamento
  else
    FController.UpdateDepartamento;
  FController.CarregarDados('');
end;

procedure TfrmCadastroDepartamento.FormCreate(Sender: TObject);
begin
  inherited;
  FController := TDepartamentoController.Create;
end;

procedure TfrmCadastroDepartamento.FormDestroy(Sender: TObject);
begin
  FController.Free;
  inherited;
end;

procedure TfrmCadastroDepartamento.FormShow(Sender: TObject);
begin
  inherited;
  FController.CarregarDados('');
end;

end.
