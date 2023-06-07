unit Model.Integrations.MercadoPago;

interface

uses
  Model.Integrations.Interfaces;
type
  TModelIntegrationsMercadoPago = class(TInterfacedObject, IModelIntegrationsGeneric)
    constructor Create;
    destructor Destroy;override;
    class function New: IModelIntegrationsGeneric;
  end;
implementation

{ TModelIntegrationsMercadoPago }

constructor TModelIntegrationsMercadoPago.Create;
begin

end;

destructor TModelIntegrationsMercadoPago.Destroy;
begin

  inherited;
end;

class function TModelIntegrationsMercadoPago.New: IModelIntegrationsGeneric;
begin
  Result := Self.Create;
end;

end.
