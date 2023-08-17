unit Model.Connections;

interface

uses
  Model.Connections.Interfaces, Model.Connections.DBExpress, Model.Connections.FireDac;

type
  TModelConnections = class(TInterfacedObject, IModelConnections)
  private
    FFireDac: IModelConnectionsGeneric;
    FDBExpress: IModelConnectionsGeneric;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IModelConnections;

    function FireDac: IModelConnectionsGeneric;
    function DBExpress: IModelConnectionsGeneric;
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

class function TModelConnections.New: IModelConnections;
begin
  Result := Self.Create;
end;

function TModelConnections.FireDac: IModelConnectionsGeneric;
begin
  FFireDac  := TModelConnectionFireDac.New;
  Result    := FFireDac;
end;

function TModelConnections.DBExpress: IModelConnectionsGeneric;
begin
  FDBExpress := TModelConnectionDBExpress.New;
  Result     := FDBExpress;
end;

end.
