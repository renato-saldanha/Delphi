unit Venda.Interfaces;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  Venda.Types;

type
  iItemAttributes<T: IInterface> = interface;
  iVendaActions = interface;
  iVendaAttributes<T: IInterface> = interface;

  iVenda = interface
    ['{6888BF2E-F7ED-4096-BA4D-370CDA773CE4}']
    function Attributes: iVendaAttributes<iVenda>;
    function Actions: iVendaActions;
  end;

  iVendaActions = interface
    ['{F9DE7E01-9FFA-4F04-B0BE-6F3E9C943F46}']
    function Vender: iVendaActions;
    function Desconto: iVendaActions;
    function &End: iVenda;
  end;

  iVendaAttributes<T: IInterface> = interface
    ['{15C4A2EE-C22D-4C32-A743-009D1F1E36BA}']
    function State(aValue: TEnumVendaTypes): iVendaAttributes<iVenda>; overload;
    function State: TEnumVendaTypes; overload;
    function Display(aValue: TProc<String>): iVendaAttributes<iVenda>; overload;
    function Display: TProc<String>; overload;
    function ListItens: iItemAttributes<iVenda>;
    function GetListItens: TList<iItemAttributes<iVenda>>;
    function &End: iVenda;
  end;

  iItemAttributes<T: IInterface> = interface
    ['{DE07793A-91DD-4293-A36D-68EE368AEAAC}']
    function Codigo(aValue: Integer): iItemAttributes<T>; overload;
    function Codigo: Integer; overload;
    function Qnt(aValue: Currency): iItemAttributes<T>; overload;
    function Qnt: Currency; overload;
    function PrecoUnitario(aValue: Currency): iItemAttributes<T>; overload;
    function PrecoUnitario: Currency; overload;
    function Display(aValue: TProc<String>): iItemAttributes<T>; overload;
    function Display: TProc<String>; overload;
    function &End: T;
  end;

implementation

end.
