unit Venda.Actions.Aberta;

interface

uses
  Venda.Interfaces;

type
  TVendaActionsAberta = class(TInterfacedObject, iVendaActions)
    private
      [weak]
      FParent : iVenda;
    public
      constructor Create(Parent : iVenda);
      destructor Destroy; override;
      class function New(Parent : iVenda) : iVendaActions;
      function Vender : iVendaActions;
      function Desconto : iVendaActions;
      function &End : iVenda;
  end;

implementation

uses
  System.SysUtils;

{ TVendaActions<T> }

function TVendaActionsAberta.&End: iVenda;
begin
  Result := FParent;
end;

constructor TVendaActionsAberta.Create(Parent : iVenda);
begin
  FParent := Parent;
end;

function TVendaActionsAberta.Desconto: iVendaActions;
begin
  Result := Self;

  if FParent.Attributes.GetListItens.Count <= 0 then
    raise Exception.Create('N�o existe item para aplicar o desconto');

  FParent.Attributes.Display()('Desconto Aplicado com Sucesso');
end;

destructor TVendaActionsAberta.Destroy;
begin

  inherited;
end;

class function TVendaActionsAberta.New(Parent : iVenda): iVendaActions;
begin
  Result := Self.Create(Parent);
end;

function TVendaActionsAberta.Vender: iVendaActions;
var
  Msg : String;
begin
  Result := Self;
  Msg := '';
  for var I := 0 to Pred(FParent.Attributes.GetListItens.Count) do
  begin
    Msg := Msg +
      Format('Produto %d - Pre�o Unit R$ %f - Qnt %f - Total %f',
      [
        FParent.Attributes.GetListItens[I].Codigo,
        FParent.Attributes.GetListItens[I].PrecoUnitario,
        FParent.Attributes.GetListItens[I].Qnt,
        (FParent.Attributes.GetListItens[I].PrecoUnitario * FParent.Attributes.GetListItens[I].Qnt)
      ]) + #13 + #10;
  end;
  FParent.Attributes.Display()(Msg);
end;

end.
