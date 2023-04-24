program DominioAnemico;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Model.Pessoa in 'Model.Pessoa.pas',
  Model.Cliente in 'Model.Cliente.pas',
  Model.Pedido in 'Model.Pedido.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
