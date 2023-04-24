unit Regra.Controller;

interface

uses
  Regra.Interfaces, System.Generics.Collections, System.Classes;

type
  TRegraController = class(TInterfacedObject, iRegrasController)
  private
    FListRegras: TDictionary<Integer, string>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iRegrasController;
    function Registro(aKey: Integer; aValue: string): iRegrasController;
    function ListaRegras(aValue: TStrings): iRegrasController;
  end;

implementation

var
  RegraController: iRegrasController;


{ TRegraController }

constructor TRegraController.Create;
begin
  FListRegras := TDictionary<Integer, string>.Create;
end;

destructor TRegraController.Destroy;
begin
  inherited;
  FListRegras.Free;
end;

function TRegraController.ListaRegras( aValue: TStrings): iRegrasController;
var
  I: Integer;
  KeysArray: TArray<Integer>;
begin
  aValue.Clear;
  KeysArray:= FListRegras.Keys.ToArray;
  TArray.Sort<Integer>(KeysArray);

  for I in KeysArray do
    aValue.Add(FListRegras.Items[I]);
end;

class function TRegraController.New: iRegrasController;
begin
  if not (Assigned(RegraController)) then
    RegraController:= Self.Create;

  Result:= RegraController;
end;

function TRegraController.Registro(aKey: Integer; aValue: string): iRegrasController;
begin
  Result:= Self;
  FListRegras.Add(aKey, aValue);
end;

end.

