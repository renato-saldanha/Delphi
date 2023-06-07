unit Controller.Interfaces;

interface

uses
  Model.Integrations.Interfaces, Model.Services.Interfaces;

type
  IController = interface
    ['{4CFA8CB1-91F1-4C74-A8C7-17057103B3B4}']
    function Integrations: IModelIntegrations;
    function Services: IModelServices;
  end;

implementation

end.
