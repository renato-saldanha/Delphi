unit Model.Produto;

interface

uses
  System.Generics.Collections, Model.Produto.Interfaces;

type
  TModelProdutoItem = class;

  TModelProduto = class(TInterfacedObject, IModelProduto)
  private
    FId: Integer;
    FDescricao: String;
    FItens: TList<IModelProdutoItem>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IModelProduto;
    function Itens: TList<IModelProdutoItem>;
    function Id: String; overload;
    function Id(AValue: Integer): IModelProduto; overload;
    function Descricao: String; overload;
    function Descricao(AValue: String): IModelProduto; overload;
  end;

  TModelProdutoItem = class(TInterfacedObject, IModelProdutoItem)
  private
    FValor: Currency;
    FQuantidade: Integer;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IModelProdutoItem;
    function Valor: String; overload;
    function Valor(AValue: Currency): IModelProdutoItem; overload;
    function Quantidade: String; overload;
    function Quantidade(AValue: Integer): IModelProdutoItem; overload;
  end;

var
  FLista: TList<IModelProdutoItem>;
  FModelProdutoItem: IModelProdutoItem;

implementation

uses
  System.SysUtils;

{ TModelProduto }

constructor TModelProduto.Create;
begin

end;

destructor TModelProduto.Destroy;
begin

  inherited;
end;

function TModelProduto.Descricao: String;
begin
  Result := FDescricao;
end;

function TModelProduto.Descricao(AValue: String): IModelProduto;
begin
  FDescricao := AValue;
  Result := Self;
end;

function TModelProduto.Id: String;
begin
  Result := IntToStr(FId);
end;

function TModelProduto.Id(AValue: Integer): IModelProduto;
begin
  FId := AValue;
  Result := Self;
end;

function TModelProduto.Itens: TList<IModelProdutoItem>;
begin
  if not Assigned(FLista) then
    FLista := TList<IModelProdutoItem>.Create;
  Result := FLista;
end;

class function TModelProduto.New: IModelProduto;
begin
  Result := Self.Create;
end;

{ TModelProdutoItem }

constructor TModelProdutoItem.Create;
begin

end;

destructor TModelProdutoItem.Destroy;
begin
  FLista.Free;
  inherited;
end;

class function TModelProdutoItem.New: IModelProdutoItem;
begin
  FModelProdutoItem := Self.Create;
  Result := FModelProdutoItem;
end;

function TModelProdutoItem.Quantidade: String;
begin
  Result := IntToStr(FQuantidade);
end;

function TModelProdutoItem.Quantidade(AValue: Integer): IModelProdutoItem;
begin
  FQuantidade := AValue;
  Result := Self;
end;

function TModelProdutoItem.Valor: String;
begin
  Result := CurrToStr(FValor);
end;

function TModelProdutoItem.Valor(AValue: Currency): IModelProdutoItem;
begin
  FValor := AValue;
  Result := Self;
end;

end.