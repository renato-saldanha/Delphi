unit Regra.Controller;

interface

uses
  Regra.Interfaces, System.Generics.Collections, System.Classes;
type
  TRegrasController = class(TInterfacedObject, iRegrasController)
    private
      FListaRegras : TDictionary<integer, String>;
    public
    constructor Create;
    destructor Destroy; override;
      class function New: iRegrasController;
      function RegistrarClasse(aKey: Integer; aValue: string): iRegrasController;
      function ListarRegras(aValue: TStrings): iRegrasController;

  end;

implementation

var
  RegrasController : iRegrasController;

{ TRegrasController }

constructor TRegrasController.Create;
begin
  FListaRegras := TDictionary<Integer, String>.Create;
end;

class function TRegrasController.New: iRegrasController;
begin
  if not (Assigned(RegrasController))  then
    RegrasController := Self.Create;

  Result := RegrasController;
end;

destructor TRegrasController.Destroy;
begin
  FListaRegras.Free;
  inherited;
end;

function TRegrasController.ListarRegras(aValue: TStrings): iRegrasController;
var
  Item: String;
  KeysArray: TArray<integer>;
  I: Integer;
begin
  Result      := Self;
  KeysArray   := FListaRegras.Keys.ToArray;
  TArray.Sort<Integer>(KeysArray);

  for I in KeysArray do
    aValue.Add(FListaRegras.Items[I])
end;

function TRegrasController.RegistrarClasse(aKey: Integer;
  aValue: string): iRegrasController;
begin
  Result := Self;
  FListaRegras.Add(aKey, aValue)
end;

end.
