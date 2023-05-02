unit Regra.Controller;

interface

uses
  System.Generics.Collections, System.Classes, Regra.Interfaces;

type
  TRegraController = class(TInterfacedObject, iRegraController)
  private
    FListaRegras: TDictionary<Integer, string>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iRegraController;

    function RegistrarClasse(aKey: Integer; aValue: string): iRegraController;
    function ListarRegras(aValue: TStrings): iRegraController;
  end;

implementation

var
  FRegraController : iRegraController;

{ iRegraController }

constructor TRegraController.Create;
begin
  FListaRegras := TDictionary<Integer, string>.Create;
end;

destructor TRegraController.Destroy;
begin
  FListaRegras.Free;
  inherited;
end;

class function TRegraController.New: iRegraController;
begin
  if not Assigned(FRegraController) then
    FRegraController := Self.Create;
  Result := FRegraController;
end;

function TRegraController.ListarRegras(aValue: TStrings): iRegraController;
var
  KeysArray: TArray<Integer>;
  I: Integer;
begin
  KeysArray := FListaRegras.Keys.ToArray;
  TArray.Sort<Integer>(KeysArray);

  for I in KeysArray do
    aValue.Add(FListaRegras.Items[I])
end;

function TRegraController.RegistrarClasse(aKey: Integer; aValue: string): iRegraController;
begin
  Result := Self;
  FListaRegras.Add(aKey, aValue);
end;

end.
