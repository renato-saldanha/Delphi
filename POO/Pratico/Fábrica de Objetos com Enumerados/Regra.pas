unit Regra;

interface


type
  TRegra = class
  private
  public
    function Name(): string; virtual; abstract;
    function CalculaImposto(aValue: Currency): Currency; virtual; abstract;

  end;

implementation

{ TRegra }

end.

