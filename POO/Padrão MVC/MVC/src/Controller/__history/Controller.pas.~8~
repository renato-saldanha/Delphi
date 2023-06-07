unit Controller;

interface

uses
  Controller.Interfaces, Model.Integrations.Interfaces,
  Model.Services.Interfaces;
type
  TController = class(TInterfacedObject, IController)
    private
    public
    constructor Create;
    destructor Destroy;override;
    class function New: IController;

    function Integrations: IModelIntegrations;
    function Services: IModelServices;
  end;

implementation

uses
  Model;

{ TController }

constructor TController.Create;
begin

end;

destructor TController.Destroy;
begin

  inherited;
end;

class function TController.New: IController;
begin
  Result := Self.Create;
end;

function TController.Services: IModelServices;
begin
  Result := TModel.New.Services;
end;

function TController.Integrations: IModelIntegrations;
begin
  Result := TModel.New.Integrations;
end;

end.
