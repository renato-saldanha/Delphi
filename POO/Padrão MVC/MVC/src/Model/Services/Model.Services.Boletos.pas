unit Model.Services.Boletos;

interface

uses
  Model.Services.Interfaces;
type
  TModelServicesBoletos = class (TInterfacedObject, IModelServicesGeneric)
    constructor Create;
    destructor Destroy;override;
    class function New: IModelServicesGeneric;
  end;

implementation

{ TModelServicesBoletos }

constructor TModelServicesBoletos.Create;
begin

end;

destructor TModelServicesBoletos.Destroy;
begin

  inherited;
end;

class function TModelServicesBoletos.New: IModelServicesGeneric;
begin

end;

end.
