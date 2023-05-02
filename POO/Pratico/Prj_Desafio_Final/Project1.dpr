program Project1;

uses
  Vcl.Forms,
  Form.Principal in 'Form.Principal.pas' {Form1},
  Regra.PrecoFeriado in 'Regra.PrecoFeriado.pas',
  Regra.PrecoVarejo in 'Regra.PrecoVarejo.pas',
  Regra.PrecoAtacado in 'Regra.PrecoAtacado.pas',
  Regra.Interfaces in 'Regra.Interfaces.pas',
  Regra.Controller in 'Regra.Controller.pas',
  Regra.Tipo in 'Regra.Tipo.pas',
  Regra.Operacoes in 'Regra.Operacoes.pas',
  Regra.Parametros in 'Regra.Parametros.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
