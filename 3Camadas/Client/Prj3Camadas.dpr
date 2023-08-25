program Prj3Camadas;

uses
  Vcl.Forms,
  View.Principal in 'src\View\View.Principal.pas' {FormPrincipal},
  Controller.Conexao in 'src\Controller\Controller.Conexao.pas' {ControllerConexao},
  Controller.Conexao.Interfaces in 'src\Controller\Controller.Conexao.Interfaces.pas',
  View.Cadastro in 'src\View\View.Cadastro.pas' {FormCadastro},
  App.Util in '..\Uteis\App.Util.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.Run;
end.