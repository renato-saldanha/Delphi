unit Regra.Controller;

interface

uses
  Regra.Interfaces, System.Classes, System.Generics.Collections;

type
  TRegraController = class(TInterfacedObject, iRegrasController)
  private
    FListaRegras: TDictionary<Integer, String>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iRegrasController;
    function ListarRegras(aValue: TStrings): iRegrasController;
    function RegistrarClasse(aKey: Integer; aValue: String): iRegrasController;
  end;

implementation

var
  RegrasController: iRegrasController;

  { TRegraController }

class function TRegraController.New: iRegrasController;
begin
  if not (Assigned(RegrasController)) then
    RegrasController := Self.Create;
  Result := RegrasController
end;

constructor TRegraController.Create;
begin
  FListaRegras := TDictionary<Integer, String>.Create;
end;

destructor TRegraController.Destroy;
begin
  FListaRegras.Free;
  inherited;
end;

function TRegraController.ListarRegras(aValue: TStrings): iRegrasController;
var
  KeysArray: TArray<Integer>;
  I: Integer;
begin
  Result := Self;
  KeysArray := FListaRegras.Keys.ToArray;
  TArray.Sort<Integer>(KeysArray);

  for I in KeysArray do
    aValue.Add(FListaRegras.Items[I]);
end;

function TRegraController.RegistrarClasse(aKey: Integer; aValue: String): iRegrasController;
begin
  Result := Self;
  FListaRegras.Add(aKey, aValue);
end;

end.
