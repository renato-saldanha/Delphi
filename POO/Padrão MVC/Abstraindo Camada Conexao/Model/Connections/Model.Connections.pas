unit Model.Connections;

interface

uses
  Model.Connections.Interfaces, Model.Connections.FireDac;

type
  TModelConnections = class(TInterfacedObject, IModelConnections)
  private
    FFireDac: IModelConnectionsGeneric;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IModelConnections;

    function FireDac: IModelConnectionsGeneric;
  end;

implementation

{ TModelConnections }

constructor TModelConnections.Create;
begin

end;

destructor TModelConnections.Destroy;
begin

  inherited;
end;

function TModelConnections.FireDac: IModelConnectionsGeneric;
begin
  if (not Assigned(FFireDac)) then
    FFireDac := TModelConnectionsFireDac.New;
  Result := FFireDac;
end;

class function TModelConnections.New: IModelConnections;
begin
  Result := Self.Create;
end;

end.
