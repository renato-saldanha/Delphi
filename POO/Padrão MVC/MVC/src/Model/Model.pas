unit Model;

interface

uses
  Model.Interfaces, Model.Integrations.Interfaces, Model.Services.Interfaces;

type
  TModel = class(TInterfacedObject, IModel)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IModel;

    function Integrations: IModelIntegrations;
    function Services: IModelServices;
  end;

implementation

uses
  Model.Integrations, Model.Services;

{ TModel }

constructor TModel.Create;
begin

end;

destructor TModel.Destroy;
begin

  inherited;
end;

class function TModel.New: IModel;
begin
  Result := Self.Create;
end;

function TModel.Integrations: IModelIntegrations;
begin
  Result:= TModelIntegrations.New;
end;

function TModel.Services: IModelServices;
begin
  Result:= TModelServices.New;
end;

end.
