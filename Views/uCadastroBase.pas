unit uCadastroBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, uDM, Vcl.Buttons,
  System.ImageList, Vcl.ImgList, Vcl.StdCtrls,  Vcl.ComCtrls,
  Principal;

type
  TConfigTipo = (tpInsert, tpUpdate);

  TfrmCadastroBase = class(TForm)
    pnPrincipal: TPanel;
    pnTop: TPanel;
    Image1: TImage;
    lbTitulo: TLabel;
    pgListagem: TPageControl;
    tbListagem: TTabSheet;
    tbCadastro: TTabSheet;
    pnMenuListagem: TPanel;
    pnBotoes: TPanel;
    btInsert: TSpeedButton;
    btExcluir: TSpeedButton;
    Panel1: TPanel;
    Panel2: TPanel;
    btCancelar: TSpeedButton;
    btSalvar: TSpeedButton;
    lbFiltro: TLabel;
    edFiltro: TEdit;
    btnPesquisar: TSpeedButton;
    pnGrid: TPanel;
    dbgDados: TDBGrid;
    SpeedButton4: TSpeedButton;
    btEdit: TSpeedButton;
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btInsertClick(Sender: TObject);
    procedure btEditClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    FTipoAcao: TConfigTipo;
    function ValidarCampoObrigatorio(aInformacao: string): Boolean;
    { Public declarations }
  end;

var
  frmCadastroBase: TfrmCadastroBase;

implementation

{$R *.dfm}

procedure TfrmCadastroBase.btEditClick(Sender: TObject);
begin
  FTipoAcao := tpUpdate;
  tbCadastro.Enabled    := true;
  pgListagem.ActivePage := tbCadastro;
end;

procedure TfrmCadastroBase.btInsertClick(Sender: TObject);
begin
  FTipoAcao := tpInsert;
  tbCadastro.Enabled    := true;
  pgListagem.ActivePage := tbCadastro;
end;

procedure TfrmCadastroBase.FormShow(Sender: TObject);
begin
  pgListagem.ActivePage := tbListagem;
  edFiltro.SetFocus;
end;

procedure TfrmCadastroBase.btCancelarClick(Sender: TObject);
begin
  pgListagem.ActivePage := tbListagem;
end;

procedure TfrmCadastroBase.btSalvarClick(Sender: TObject);
begin
  pgListagem.ActivePage := tbListagem;
end;

procedure TfrmCadastroBase.SpeedButton4Click(Sender: TObject);
begin
  frmPrincipal.pnMenuLateral.Enabled := true;
  Close;
end;

function TfrmCadastroBase.ValidarCampoObrigatorio(aInformacao: string): Boolean;
begin
  Result := Length(aInformacao) > 0;
end;

end.
