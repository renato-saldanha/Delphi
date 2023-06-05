program DesacoplamentoInterfaceComExemplo;

uses
  Vcl.Forms,
  Form.Principal in 'Form.Principal.pas' {Form1},
  Pessoa in 'Pessoa.pas',
  Produto in 'Produto.pas',
  Log.Interfaces in 'Log.Interfaces.pas',
  DAO.Generic in 'DAO.Generic.pas',
  DAO.RTTI in 'DAO.RTTI.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
