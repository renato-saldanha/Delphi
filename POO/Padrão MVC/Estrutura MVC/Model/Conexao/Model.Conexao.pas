unit Model.Conexao;

interface

uses
  Model.Conexao.Interfaces;
type
  TModelConexao = class(TInterfacedObject, IModelConexao)
  private
  public
    class function New: IModelConexao;
    constructor Create;
    destructor Destroy; override;
  end;
implementation

{ TModelConexao }

constructor TModelConexao.Create;
begin

end;

destructor TModelConexao.Destroy;
begin

  inherited;
end;

class function TModelConexao.New: IModelConexao;
begin
  Result := Self.Create;
end;

end.
