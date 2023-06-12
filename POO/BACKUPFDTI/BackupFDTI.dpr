program BackupFDTI;

uses
  Vcl.Forms,
  Form.Principal in 'Form.Principal.pas' {FormPrincipal},
  DMDados in 'DMDados.pas' {DataModuleDados: TDataModule},
  Form.Cadastro.BackupCliente in 'Form.Cadastro.BackupCliente.pas' {FormCadastroBackupCliente},
  BibPesquisa in '..\..\Maximus\BibPesquisa\BibPesquisa.pas',
  Pesquisa in '..\..\Maximus\Fontes\Pesquisa.pas' {FormPesquisa},
  BibVariavel in 'BibVariavel.pas',
  App.Util in 'App.Util.pas',
  Model.ClienteBackup in 'Model.ClienteBackup.pas',
  App.Enums in 'App.Enums.pas',
  App.Interfaces in 'App.Interfaces.pas',
  App.Parametros in 'App.Parametros.pas',
  App.Operacoes in 'App.Operacoes.pas',
  App.Controller in 'App.Controller.pas',
  BibMarco in '..\..\..\Bibliotecas\BibsXE10.1\BibMarco.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.Run;
end.