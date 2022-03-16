unit uRelatorioView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDM, QRCtrls, QuickRpt, Vcl.ExtCtrls;

type
  TfrmRelatorio = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorio: TfrmRelatorio;

implementation

{$R *.dfm}

uses Principal;

procedure TfrmRelatorio.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmPrincipal.pnMenuLateral.Enabled := true;

end;

procedure TfrmRelatorio.FormCreate(Sender: TObject);
begin
  dm.fdEmpregados.Active := true;
  QuickRep1.Preview;
end;

end.
