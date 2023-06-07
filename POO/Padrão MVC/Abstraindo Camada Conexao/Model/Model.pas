unit Model;

interface

uses
  Model.Interfaces, Model.Connections.Interfaces, Model.Connections;

type
  TModel = class(TInterfacedObject, IModel)
  private
    FConnections: IModelConnections;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IModel;

    function Connections: IModelConnections;
  end;

implementation


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

function TModel.Connections: IModelConnections;
begin
  if (not Assigned(FConnections)) then
    FConnections := TModelConnections.New;
  Result := FConnections;
end;

end.
