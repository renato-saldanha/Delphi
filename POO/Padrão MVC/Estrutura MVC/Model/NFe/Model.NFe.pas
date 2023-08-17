unit Model.NFe;

interface

uses
  Model.NFe.Interfaces;
type
  TModelNFe = class(TInterfacedObject, IModelNFe)
  private
  public
    class function New: IModelNFe;
    constructor Create;
    destructor Destroy; override;

    function Emitir: IModelNFe;
  end;
implementation

{ TModelNFe }

constructor TModelNFe.Create;
begin

end;

destructor TModelNFe.Destroy;
begin

  inherited;
end;

function TModelNFe.Emitir: IModelNFe;
begin
  Result := Self;
end;

class function TModelNFe.New: IModelNFe;
begin
  Result := Self.Create;
end;

end.
