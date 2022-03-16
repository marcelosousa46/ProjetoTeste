unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    pnFundos: TPanel;
    pnMenuLateral: TPanel;
    btSair: TSpeedButton;
    btDepartamento: TSpeedButton;
    btEmpregados: TSpeedButton;
    btnMenu: TSpeedButton;
    btRelatorio: TSpeedButton;
    pnBarra: TPanel;
    pnCentro: TPanel;
    pnTop: TPanel;
    Image1: TImage;
    Label1: TLabel;
    pnRodape: TPanel;
    procedure btnMenuClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure btDepartamentoClick(Sender: TObject);
    procedure btEmpregadosClick(Sender: TObject);
    procedure btRelatorioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;
  bExpandido: Boolean;

implementation

uses
  uDepartamentoView, uEmpregadoView, uRelatorioView;

{$R *.dfm}

procedure TfrmPrincipal.btnMenuClick(Sender: TObject);
begin
  if bExpandido then
    pnMenuLateral.Width := 40
  else
    pnMenuLateral.Width := 160;

  bExpandido := not bExpandido;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  pnMenuLateral.Width := 40
end;

procedure TfrmPrincipal.btRelatorioClick(Sender: TObject);
begin
  try
    frmRelatorio:=TfrmRelatorio.Create(nil);
    frmRelatorio.QuickRep1.PreviewModal;
  finally
    FreeAndNil(frmRelatorio)
  end;
end;

procedure TfrmPrincipal.btSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmPrincipal.btEmpregadosClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCadastroEmpregado,frmCadastroEmpregado );
  frmCadastroEmpregado.Parent := pnCentro;
  frmCadastroEmpregado.Align := alClient;
  frmCadastroEmpregado.Show;
  pnMenuLateral.Enabled := false;

end;

procedure TfrmPrincipal.btDepartamentoClick(Sender: TObject);
begin
  Application.CreateForm( TfrmCadastroDepartamento,frmCadastroDepartamento );
  frmCadastroDepartamento.Parent := pnCentro;
  frmCadastroDepartamento.Align := alClient;
  frmCadastroDepartamento.Show;
  pnMenuLateral.Enabled := false;
end;

end.
