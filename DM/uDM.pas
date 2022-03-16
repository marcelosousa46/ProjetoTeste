unit uDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, Data.DB,
  FireDAC.Comp.Client, uDadosConexaoModel, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TDM = class(TDataModule)
    Conexao: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    fdDados: TFDQuery;
    dsDados: TDataSource;
    fdDepartamentos: TFDQuery;
    dsDepartamentos: TDataSource;
    fdEmpregados: TFDQuery;
    dsEmpregados: TDataSource;
    fdEmpregadosid_empregado: TIntegerField;
    fdEmpregadoscod_departamento: TIntegerField;
    fdEmpregadoscod_emp_funcao: TIntegerField;
    fdEmpregadosnm_empregado: TWideStringField;
    fdEmpregadosnm_funcao: TWideStringField;
    fdEmpregadosdata_admissao: TDateField;
    fdEmpregadossalario: TFMTBCDField;
    fdEmpregadoscomissao: TFMTBCDField;
    fdEmpregadosid_departamento: TIntegerField;
    fdEmpregadosnm_departamento: TWideStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure ConexaoBeforeConnect(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FDadosConexao : TDadosConexao;
  public
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM.ConexaoBeforeConnect(Sender: TObject);
begin

  FDadosConexao.CarregarInformacoes;

  with FDadosConexao do
  begin
    Conexao.Params.Values['Server'] := Servidor;
    conexao.Params.Values['Port']   := Porta;
    Conexao.Params.Database         := Banco;
    Conexao.Params.UserName         := Usuario;
    Conexao.Params.Password         := Senha;
  end;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  FDPhysPgDriverLink1.VendorHome := '.\';
  FDadosConexao := TDadosConexao.Create;
  Conexao.Connected := true;
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
  FDadosConexao.Free;
end;

end.
