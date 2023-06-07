unit Model.Integrations;

interface

uses
  Model.Integrations.Interfaces;

type
  TModelIntegrations = class(TInterfacedObject, IModelIntegrations)
    constructor Create;
    destructor Destroy; override;
    class function New: IModelIntegrations;

    function MercadoPago: IModelIntegrationsGeneric;
    function MercadoLivre: IModelIntegrationsGeneric;
    function SiteMercado: IModelIntegrationsGeneric;
  end;

implementation

uses
  Model.Integrations.MercadoLivre, Model.Integrations.MercadoPago,
  Model.Integrations.SiteMercado;

{ TModelIntegrationsMercadoPago }

constructor TModelIntegrations.Create;
begin

end;

destructor TModelIntegrations.Destroy;
begin

  inherited;
end;

class function TModelIntegrations.New: IModelIntegrations;
begin
  Result := Self.Create;
end;

function TModelIntegrations.MercadoLivre: IModelIntegrationsGeneric;
begin
  Result := TModelIntegrationsMercadoLivre.Create;
end;

function TModelIntegrations.MercadoPago: IModelIntegrationsGeneric;
begin
  Result := TModelIntegrationsMercadoPago.Create;
end;

function TModelIntegrations.SiteMercado: IModelIntegrationsGeneric;
begin
  Result := TModelIntegrationsSiteMercado.Create;
end;

end.
