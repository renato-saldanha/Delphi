unit Model;

interface

uses
  Model.Interfaces, Model.Validacao.Interfaces, Controller.Interfaces;

type
  TModel = class(TInterfacedObject, IModel)
  private
    FValidacao: IModelValidacao;
    function Validacao: IModelValidacao;
  public
    class function New: IModel;
    constructor Create;
    destructor Destroy; override;

    function &End: IController;
  end;

implementation

uses
  Model.Validacao;

{ TModel }

function TModel.&End: IController;
begin

end;

constructor TModel.Create;
begin
  FValidacao := TModelValidacao.New;
end;

destructor TModel.Destroy;
begin

  inherited;
end;

class function TModel.New: IModel;
begin
  Result := Self.Create;
end;

function TModel.Validacao: IModelValidacao;
begin
  Result := FValidacao;
end;

end.
