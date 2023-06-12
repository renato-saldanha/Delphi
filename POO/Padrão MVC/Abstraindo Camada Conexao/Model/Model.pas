unit Model;

interface

uses
  Model.Connections.Interfaces, Model.Interfaces, Model.Connections;



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
  FConnections := TModelConnections.New;
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
  Result :=  FConnections;
end;

end.
