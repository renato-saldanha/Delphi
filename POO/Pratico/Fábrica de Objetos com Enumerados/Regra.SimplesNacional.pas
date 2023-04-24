unit Regra.SimplesNacional;

interface

uses
  Regra;
type
  TRegraSimplesNacional = class(TRegra)
  private
  public
    function Name(): string; override;
    function CalculaImposto(aValue: Currency): Currency; override;


  end;

implementation

{ TRegraSimplesNacional }

function TRegraSimplesNacional.CalculaImposto(aValue: Currency): Currency;
begin
  Result:= (aValue * 0.2) + aValue;
end;

function TRegraSimplesNacional.Name(): string;
begin
  Result:= 'Simples Nacional';
end;

end.
