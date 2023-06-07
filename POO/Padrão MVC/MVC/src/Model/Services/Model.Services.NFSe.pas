unit Model.Services.NFSe;

interface

uses
  Model.Services.Interfaces;
type
  TModelServicesNFSe = class (TInterfacedObject, IModelServicesGeneric)
    constructor Create;
    destructor Destroy;override;
    class function New: IModelServicesGeneric;
  end;

implementation

{ TModelServicesBoletos }

constructor TModelServicesNFSe.Create;
begin

end;

destructor TModelServicesNFSe.Destroy;
begin

  inherited;
end;

class function TModelServicesNFSe.New: IModelServicesGeneric;
begin

end;

end.

