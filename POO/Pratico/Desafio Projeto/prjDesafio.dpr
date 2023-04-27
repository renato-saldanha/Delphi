program prjDesafio;

uses
  Vcl.Forms,
  uFrmPrincipal in 'uFrmPrincipal.pas' {Form1},
  Regra.Interfaces in 'Regra.Interfaces.pas',
  Regra.PrecoFeriado in 'Regra.PrecoFeriado.pas',
  Regra.PrecoVarejo in 'Regra.PrecoVarejo.pas',
  Regra.PrecoAtacado in 'Regra.PrecoAtacado.pas',
  Regra.Parametros in 'Regra.Parametros.pas',
  Regra.Operacoes in 'Regra.Operacoes.pas',
  Regra.Tipo in 'Regra.Tipo.pas',
  Regra.Controller in 'Regra.Controller.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
