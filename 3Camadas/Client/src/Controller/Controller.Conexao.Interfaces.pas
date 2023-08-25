unit Controller.Conexao.Interfaces;

interface

uses
  FireDAC.Comp.Client;
type
  iControllerConexao = interface
    ['{E361E003-A197-47E7-93C4-CE446AF15EA8}']

    function AbrirQuery(Qry: TFDQuery; sSQL: string): iControllerConexao;
    function ConfigurarConexao(): iControllerConexao;
    function EfetuarConsultaAuxiliar(aQryAux: TFDQuery; aSQL: String): Integer;
  end;

implementation

end.