unit Model.Produto.Interfaces;

interface

uses
  System.Generics.Collections;

type
  IModelProdutoItem = interface;

  IModelProduto = interface
    ['{58E5FDF7-5D76-47D4-968E-52E37B5AF283}']
    function Itens: TList<IModelProdutoItem>;
    function Id: String; overload;
    function Id(AValue: Integer): IModelProduto; overload;
    function Descricao: String; overload;
    function Descricao(AValue: String): IModelProduto; overload;
  end;

  IModelProdutoItem = interface
    ['{65633CB6-2C08-4D9A-A547-C3FEF1D761A4}']
    function Valor: String; overload;
    function Valor(AValue: Currency): IModelProdutoItem; overload;
    function Quantidade: String; overload;
    function Quantidade(AValue: Integer): IModelProdutoItem; overload;
  end;

implementation

end.
