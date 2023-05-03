unit Produto;

interface

uses
  DAO.RTTI;

type
  [TableName('PRODUTOS')]
  TProduto = class
  private
    FNome: string;
    FMarca: string;
    FValor: Currency;
  public
    [FieldType(tpString)]
    property Nome: string read FNome write FNome;
    [FieldType(tpString)]
    property Marca: string read FMarca write FMarca;
    [FieldType(tpCurrency)]
    property Valor: Currency read FValor write FValor;
  end;

implementation

end.
