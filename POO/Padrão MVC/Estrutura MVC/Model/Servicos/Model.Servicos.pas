unit Model.Servicos;

interface

uses
  Model.Servicos.Interfaces;

type
  TModelServicos = class(TInterfacedObject, IModelServicos)
  private
  public
    class function New: IModelServicos;
    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TModelServicos }

constructor TModelServicos.Create;
begin

end;

destructor TModelServicos.Destroy;
begin

  inherited;
end;

class function TModelServicos.New: IModelServicos;
begin
  Result := Self.Create;
end;

end.
