unit Model.Integrations.MercadoLivre;

interface

uses
  Model.Integrations.Interfaces;
type
  TModelIntegrationsMercadoLivre = class(TInterfacedObject, IModelIntegrationsGeneric)
    constructor Create;
    destructor Destroy;override;
    class function New: IModelIntegrationsGeneric;
  end;
implementation

{ TModelIntegrationsMercadoPago }

constructor TModelIntegrationsMercadoLivre.Create;
begin

end;

destructor TModelIntegrationsMercadoLivre.Destroy;
begin

  inherited;
end;

class function TModelIntegrationsMercadoLivre.New: IModelIntegrationsGeneric;
begin
  Result := Self.Create;
end;

end.
