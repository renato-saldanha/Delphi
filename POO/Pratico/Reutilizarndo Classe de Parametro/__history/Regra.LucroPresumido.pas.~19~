unit Regra.LucroPresumido;

interface

uses
  Regra.Interfaces, System.SysUtils, Regra.Controller;

type
  TRegraLucroPresumido = class(TInterfacedObject, iRegras)
  private
    FDisplay: TProc<String>;
  public
    class function New: iRegras;
    function Name(): string;
    function CalcularImposto(aValue: Currency): Currency; overload;
    function CalcularImposto(aValue: String): Currency; overload;
    function Display(aValue: TProc<string>): iRegras;
  end;

implementation

uses
  Regra.Tipo;

{ TRegraSimplesNacional }

class function TRegraLucroPresumido.New: iRegras;
begin
  Result:= Self.Create;
end;

function TRegraLucroPresumido.CalcularImposto(aValue: Currency): Currency;
begin
  Result:= (aValue * 0.3) + aValue;

  if (Assigned(FDisplay)) then
    FDisplay(CurrToStr(Result));
end;

function TRegraLucroPresumido.CalcularImposto(aValue: String): Currency;
begin
  Result:= 0;

  if (TryStrToCurr(aValue, Result)) then
    Result:= CalcularImposto(StrToCurr(aValue));
end;

function TRegraLucroPresumido.Name(): string;
begin
  Result:= 'Lucro Presumido';
end;

function TRegraLucroPresumido.Display(aValue: TProc<string>): iRegras;
begin
  Result    := Self;
  FDisplay  := aValue;
end;

initialization
  TRegraController.New.Registro(Integer(trLucroPresumido), 'Lucro Presumido');

end.
