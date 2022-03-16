program Teste;

uses
  Vcl.Forms,
  Principal in '..\ProjetoTeste\Principal.pas' {frmPrincipal},
  uCadastroBase in '..\ProjetoTeste\Views\uCadastroBase.pas' {frmCadastroBase},
  uDM in '..\ProjetoTeste\DM\uDM.pas' {DM: TDataModule},
  uDadosConexaoModel in '..\ProjetoTeste\Models\uDadosConexaoModel.pas',
  uDepartamentosModel in '..\ProjetoTeste\Models\uDepartamentosModel.pas',
  uDepartamentoView in '..\ProjetoTeste\Views\uDepartamentoView.pas' {frmCadastroDepartamento},
  uDepartamentosRepository in '..\ProjetoTeste\Repositories\uDepartamentosRepository.pas',
  uDepartamentosController in '..\ProjetoTeste\Controllers\uDepartamentosController.pas',
  uEmpregadosModel in '..\ProjetoTeste\Models\uEmpregadosModel.pas',
  uEmpregadosRepository in '..\ProjetoTeste\Repositories\uEmpregadosRepository.pas',
  uEmpregadoView in '..\ProjetoTeste\Views\uEmpregadoView.pas' {frmCadastroEmpregado},
  uEmpregadosController in '..\ProjetoTeste\Controllers\uEmpregadosController.pas',
  uRelatorioView in '..\ProjetoTeste\Views\uRelatorioView.pas' {frmRelatorio};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
