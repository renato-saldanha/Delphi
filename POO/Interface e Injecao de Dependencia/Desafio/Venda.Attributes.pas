unit Venda.Attributes;

interface

uses
  Venda.Interfaces, Venda.Types, System.SysUtils, System.Classes,
  System.Generics.Collections, Item.Attributes;

type
  TVendaAttributes = class(TInterfacedObject, iVendaAttributes<iVenda>)
  private
    [weak]
    FParent: iVenda;
    FListItens: TList<iItemAttributes<iVenda>>;
    FDisplay: TProc<String>;
    FState: TEnumVendaTypes;
  public
    constructor Create(aParent: iVenda);
    destructor Destroy; override;
    class function New(aParent: iVenda): iVendaAttributes<iVenda>;
    function State(aValue: TEnumVendaTypes): iVendaAttributes<iVenda>; overload;
    function State: TEnumVendaTypes; overload;
    function Display(aValue: TProc<String>): iVendaAttributes<iVenda>; overload;
    function Display: TProc<String>; overload;
    function ListItens: iItemAttributes<iVenda>;
    function GetListItens: TList<iItemAttributes<iVenda>>;
    function &End: iVenda;
  end;

implementation

{ TVendaAttributes }

function TVendaAttributes.&End: iVenda;
begin
  Result := FParent;
end;

constructor TVendaAttributes.Create(aParent: iVenda);
begin
  FParent := aParent;
  FListItens := TList<iItemAttributes<iVenda>>.Create;
end;

destructor TVendaAttributes.Destroy;
begin
  FListItens.Free;
  inherited;
end;

class function TVendaAttributes.New(aParent: iVenda): iVendaAttributes<iVenda>;
begin
  Result := Self.Create(aParent);
end;

function TVendaAttributes.State: TEnumVendaTypes;
begin
  Result := FState;
end;

function TVendaAttributes.Display(aValue: TProc<String>): iVendaAttributes<iVenda>;
begin
  Result := Self;
  FDisplay := aValue;
end;

function TVendaAttributes.Display: TProc<String>;
begin
  Result := FDisplay;
end;

function TVendaAttributes.GetListItens: TList<iItemAttributes<iVenda>>;
begin
  result := FListItens;
end;

function TVendaAttributes.ListItens: iItemAttributes<iVenda>;
begin
  FListItens.Add(TItemAttributes<iVenda>.New(FParent));
  Result := FListItens.Last;
end;

function TVendaAttributes.State(aValue: TEnumVendaTypes): iVendaAttributes<iVenda>;
begin
  Result := Self;
  FState := aValue;
end;

end.
