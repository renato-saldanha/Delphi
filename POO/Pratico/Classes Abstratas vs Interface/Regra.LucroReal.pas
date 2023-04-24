unit Regra.LucroReal;

interface

uses
  Regra.Interfaces;

type
  TRegraLucroReal = class(TInterfacedObject, iRegras)
  private
  public
    class function New: iRegras;
    function Name(): string;
    function CalcularImposto(aValue: Currency): Currency;
  end;

implementation

{ TRegraSimplesNacional }

function TRegraLucroReal.CalcularImposto(aValue: Currency): Currency;
begin
  Result:= (aValue * 0.4) + aValue;
end;
function TRegraLucroReal.Name: string;
begin
   Result:= 'Lucro Real';
end;

class function TRegraLucroReal.New: iRegras;
begin
  Result:= Self.Create;
end;

end.
