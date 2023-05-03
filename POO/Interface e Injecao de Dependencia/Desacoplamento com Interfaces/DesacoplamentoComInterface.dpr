program DesacoplamentoComInterface;

uses
  Vcl.Forms,
  Form.Principal in 'Form.Principal.pas' {Form1},
  Pessoa in 'Pessoa.pas',
  Produto in 'Produto.pas',
  Interfaces in 'Interfaces.pas',
  PessoaDAO in 'PessoaDAO.pas',
  ProdutoDAO in 'ProdutoDAO.pas',
  DAO.Generic in 'DAO.Generic.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
