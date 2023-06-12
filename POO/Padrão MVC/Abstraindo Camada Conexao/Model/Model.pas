unit Model;

interface

uses
  Model.Interfaces, Model.Connection.Interfaces, Model.Connection.FireDac, Model.Connection.DBExpress, Data.DB;

type
  TModel<T: class> = class(TInterfacedObject, IModel)
  private
    FDataSet: IModelConnectionsGeneric;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IModel;

    function DataSet: IModelConnectionsGeneric;
  end;

implementation


{ TModel }

constructor TModel<T>.Create;
begin
  if (T = TModelConnectionFireDac) then
    FDataSet := TModelConnectionFireDac.New;

  if (T = TModelConnectionDBExpress) then
    FDataSet := TModelConnectionDBExpress.New;
end;

destructor TModel<T>.Destroy;
begin

  inherited;
end;

class function TModel<T>.New: IModel;
begin
  Result := Self.Create;
end;

function TModel<T>.DataSet: IModelConnectionsGeneric;
begin
  Result :=  FDataSet;
end;

end.
