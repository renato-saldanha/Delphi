program PrjAbstracao;

uses
  Vcl.Forms,
  Model.Connections.FireDac in 'Model\Connections\Model.Connections.FireDac.pas',
  Model.Connections.Interfaces in 'Model\Connections\Model.Connections.Interfaces.pas',
  View.Principal in 'View\View.Principal.pas' {FormPrincipal},
  Model.Interfaces in 'Model\Model.Interfaces.pas',
  Model in 'Model\Model.pas',
  Controller.Interfaces in 'Controller\Controller.Interfaces.pas',
  Controller in 'Controller\Controller.pas',
  Model.Connections.DBExpress in 'Model\Connections\Model.Connections.DBExpress.pas',
  Model.Connections in 'Model\Connections\Model.Connections.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.Run;
end.
