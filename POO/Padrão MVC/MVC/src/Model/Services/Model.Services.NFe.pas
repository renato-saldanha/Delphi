unit Model.Services.NFe;

interface

uses
  Model.Services.Interfaces;
type
  TModelServicesNFe = class (TInterfacedObject, IModelServicesGeneric)
    constructor Create;
    destructor Destroy;override;
    class function New: IModelServicesGeneric;
  end;

implementation

{ TModelServicesBoletos }

constructor TModelServicesNFe.Create;
begin

end;

destructor TModelServicesNFe.Destroy;
begin

  inherited;
end;

class function TModelServicesNFe.New: IModelServicesGeneric;
begin

end;

end.

