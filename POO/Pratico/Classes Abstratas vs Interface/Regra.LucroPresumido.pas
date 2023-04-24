unit Regra.LucroPresumido;

interface

uses
  Regra.Interfaces;

type
  TRegraLucroPresumido = class(TInterfacedObject, iRegras)
  private
  public
    class function New: iRegras;
    function Name(): string;
    function CalcularImposto(aValue: Currency): Currency; 
  end;

implementation

{ TRegraSimplesNacional }

function TRegraLucroPresumido.CalcularImposto(aValue: Currency): Currency;
begin
  Result:= (aValue * 0.3) + aValue;
end;


function TRegraLucroPresumido.Name(): string;
begin
  Result:= 'Lucro Presumido';
end;

class function TRegraLucroPresumido.New: iRegras;
begin
  Result:= Self.Create;
end;

end.
