program PrjMVC;

uses
  Vcl.Forms,
  View.Principal in 'View\View.Principal.pas' {Form2},
  Model.Services.Boletos in 'Model\Services\Model.Services.Boletos.pas',
  Model.Services.Interfaces in 'Model\Services\Model.Services.Interfaces.pas',
  Model.Services.NFe in 'Model\Services\Model.Services.NFe.pas',
  Model.Services.NFSe in 'Model\Services\Model.Services.NFSe.pas',
  Model.Integrations.Interfaces in 'Model\Integrations\Model.Integrations.Interfaces.pas',
  Model.Integrations.MercadoPago in 'Model\Integrations\Model.Integrations.MercadoPago.pas',
  Model.Integrations.MercadoLivre in 'Model\Integrations\Model.Integrations.MercadoLivre.pas',
  Model.Integrations.SiteMercado in 'Model\Integrations\Model.Integrations.SiteMercado.pas',
  Model.Services in 'Model\Services\Model.Services.pas',
  Model.Integrations in 'Model\Integrations\Model.Integrations.pas',
  Model.Interfaces in 'Model\Model.Interfaces.pas',
  Model in 'Model\Model.pas',
  Controller.Interfaces in 'Controller\Controller.Interfaces.pas',
  Controller in 'Controller\Controller.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
