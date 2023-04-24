unit Conexao;

interface
type
  TConexao= class abstract
    public
      procedure CriarConexao(NomeBanco: String); virtual; abstract;
  end;


implementation

end.
