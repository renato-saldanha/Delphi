program PrjAbstracao;

uses
  Vcl.Forms,
  Model.Connection.FireDac in 'Model\Connections\Model.Connection.FireDac.pas',
  Model.Connection.Interfaces in 'Model\Connections\Model.Connection.Interfaces.pas',
  View.Principal in 'View\View.Principal.pas' {FormPrincipal},
  Model.Interfaces in 'Model\Model.Interfaces.pas',
  Model in 'Model\Model.pas',
  Controller.Interfaces in 'Controller\Controller.Interfaces.pas',
  Controller in 'Controller\Controller.pas',
  Model.Connection.DBExpress in 'Model\Connections\Model.Connection.DBExpress.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.Run;
end.
