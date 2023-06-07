unit Controller;

interface

uses
  Model.Connections.Interfaces, Controller.Interfaces;

type
  TController = class(TInterfacedObject, IController)
  private
    FConnection: IModelConnectionsGeneric;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IController;
    function Connection: IModelConnectionsGeneric;
  end;

implementation

uses
  Model;

{ TCotnroller }


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

function TController.Connection: IModelConnectionsGeneric;
begin
  if (not Assigned(FConnection)) then
    FConnection := TModel.New.Connections.FireDac;
  Result := FConnection;
end;

end.
