program LayoutResponsivoVCL;

uses
  Vcl.Forms,
  Form.Principal in 'Form.Principal.pas' {Form4};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
