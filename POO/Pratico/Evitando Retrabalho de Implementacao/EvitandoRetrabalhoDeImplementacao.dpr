program EvitandoRetrabalhoDeImplementacao;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Regra.LucroReal in 'Regra.LucroReal.pas',
  Regra.LucroPresumido in 'Regra.LucroPresumido.pas',
  Regra.SimplesNacional in 'Regra.SimplesNacional.pas',
  Regra.Tipo in 'Regra.Tipo.pas',
  Regra.Interfaces in 'Regra.Interfaces.pas',
  Regra.Controller in 'Regra.Controller.pas',
  Regra.Operacoes in 'Regra.Operacoes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
