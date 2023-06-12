unit Controller;

interface

uses
  Model.Connections.Interfaces, Controller.Interfaces, Model;

type
  TController = class(TInterfacedObject, IController)
  private
    FConnections: IModelConnections;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IController;
    function Connections: IModelConnections;
  end;

implementation

{ TController }


constructor TController.Create;
begin
  if (not Assigned(FConnections)) then
    FConnections := TModel.New.Connections;
end;

destructor TController.Destroy;
begin

  inherited;
end;

class function TController.New: IController;
begin
  Result := Self.Create;
end;

function TController.Connections: IModelConnections;
begin
  Result := FConnections;
end;

end.
