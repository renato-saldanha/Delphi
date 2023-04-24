unit Regra.LucroReal;

interface

uses
  Regra;
type
  TRegraLucroReal = class(TRegra)
  private
  public
    function Name(): string; override;
    function CalculaImposto(aValue: Currency): Currency; override;

  end;

implementation

{ TRegraSimplesNacional }

function TRegraLucroReal.CalculaImposto(aValue: Currency): Currency;
begin
  Result:= (aValue * 0.4) + aValue;
end;

function TRegraLucroReal.Name(): string;
begin
  Result:= 'Lucro Real';
end;

end.
