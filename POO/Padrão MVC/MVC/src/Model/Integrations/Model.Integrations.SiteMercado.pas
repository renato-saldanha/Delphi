unit Model.Integrations.SiteMercado;

interface

uses
  Model.Integrations.Interfaces;
type
  TModelIntegrationsSiteMercado = class(TInterfacedObject, IModelIntegrationsGeneric)
    constructor Create;
    destructor Destroy;override;
    class function New: IModelIntegrationsGeneric;
  end;
implementation

{ TModelIntegrationsMercadoPago }

constructor TModelIntegrationsSiteMercado.Create;
begin

end;

destructor TModelIntegrationsSiteMercado.Destroy;
begin

  inherited;
end;

class function TModelIntegrationsSiteMercado.New: IModelIntegrationsGeneric;
begin
  Result := Self.Create;
end;

end.
