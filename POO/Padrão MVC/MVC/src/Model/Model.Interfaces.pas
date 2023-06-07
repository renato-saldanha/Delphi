unit Model.Interfaces;

interface

uses
  Model.Integrations.Interfaces, Model.Services.Interfaces;

type
  IModel = interface
    ['{ECC721FB-3F83-44ED-91F7-8DC6DE0B96C7}']
    function Integrations: IModelIntegrations;
    function Services: IModelServices;
  end;

implementation

end.
