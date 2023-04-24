unit Conexao.FirebirdSQL;

interface

uses
  Conexao, Vcl.Dialogs;
type
  TConexaoFirebirdSQL = class(TConexao)
    procedure CriarConexao(NomeBanco: String); override;
  end;

implementation


{ TConexaoFirebirdSQL }

procedure TConexaoFirebirdSQL.CriarConexao(NomeBanco: String);
begin
  inherited;
  ShowMessage(Nomebanco + ' conectado no FirebirdSQL!');
end;

end.
