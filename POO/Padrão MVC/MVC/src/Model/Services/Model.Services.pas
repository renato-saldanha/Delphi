unit Model.Services;

interface

uses
  Model.Services.Interfaces, Winapi.Windows;

type
  TModelServices = class(TInterfacedObject, IModelServices)
    constructor Create;
    destructor Destroy; override;
    class function New: IModelServices;

    function Boletos: IModelServicesGeneric;
    function NFe: IModelServicesGeneric;
    function NFSe: IModelServicesGeneric;
  end;

implementation

uses
  Model.Services.Boletos, Model.Services.NFSe, Model.Services.NFe;

{ TModelServicesBoletos }

constructor TModelServices.Create;
begin

end;

destructor TModelServices.Destroy;
begin

  inherited;
end;

class function TModelServices.New: IModelServices;
begin
  Result := Self.Create;
end;

function TModelServices.NFe: IModelServicesGeneric;
begin
  Result := TModelServicesNFe.New;
end;

function TModelServices.NFSe: IModelServicesGeneric;
begin
  Result := TModelServicesNFSe.New;
end;

function TModelServices.Boletos: IModelServicesGeneric;
begin
  Result := TModelServicesBoletos.New;
end;

end.
