unit Regra.Tipo;

interface

uses
  Regra, Regra.SimplesNacional, Regra.LucroPresumido, Regra.LucroReal;

type
  TEnumRegras = (trSimplesNacional, trLucroPresumido, trLucroReal);

  TEnumRegrasHelper = record Helper for TEnumRegras
    function this: TRegra;
  end;


implementation


{ TEnumRegrasHelper }

function TEnumRegrasHelper.this: TRegra;
begin
  case Self of
    trSimplesNacional: Result := TRegraSimplesNacional.Create;
    trLucroPresumido: Result := TRegraLucroPresumido.Create;
    trLucroReal: Result := TRegraLucroReal.Create;
  end;
end;

end.
