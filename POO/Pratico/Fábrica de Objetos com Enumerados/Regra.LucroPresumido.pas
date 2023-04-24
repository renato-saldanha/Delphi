unit Regra.LucroPresumido;

interface

uses
  Regra;
type
  TRegraLucroPresumido = class(TRegra)
  private
  public
    function Name(): string; override;
    function CalculaImposto(aValue: Currency): Currency; override;


  end;

implementation

{ TRegraSimplesNacional }

function TRegraLucroPresumido.CalculaImposto(aValue: Currency): Currency;
begin
  Result:= (aValue * 0.3) + aValue;
end;

function TRegraLucroPresumido.Name(): string;
begin
  Result:= 'Lucro Presumido';
end;

end.
