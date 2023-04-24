program ClasseAbstrata;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Model.Pessoa in 'Model.Pessoa.pas',
  Model.Cliente in 'Model.Cliente.pas',
  Model.Pedido in 'Model.Pedido.pas',
  Model.Fornecedor in 'Model.Fornecedor.pas',
  Model.Endereco in 'Model.Endereco.pas',
  Model.Entregador in 'Model.Entregador.pas',
  Conexao in 'Conexao.pas',
  Conexao.Postgre in 'Conexao.Postgre.pas',
  Conexao.FirebirdSQL in 'Conexao.FirebirdSQL.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
