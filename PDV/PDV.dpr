program PDV;

uses
  Vcl.Forms,
  Form.Principal in 'src\View\Form.Principal.pas' {FormPrincipal},
  Form.Login in 'src\View\Form.Login.pas' {FormLogin};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.Run;
end.
