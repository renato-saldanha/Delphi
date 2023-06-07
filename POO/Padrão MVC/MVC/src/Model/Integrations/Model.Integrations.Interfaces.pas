unit Model.Integrations.Interfaces;

interface

type
  IModelIntegrationsGeneric = interface
    ['{3C658327-1F34-472F-9C54-5C922BC41BEA}']
  end;

  IModelIntegrations = interface
    ['{86A07E27-E44A-4471-A8CD-14E70DB828E9}']
    function MercadoPago: IModelIntegrationsGeneric;
    function MercadoLivre: IModelIntegrationsGeneric;
    function SiteMercado: IModelIntegrationsGeneric;
  end;

implementation

end.
