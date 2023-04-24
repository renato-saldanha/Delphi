unit Regra.LucroPresumido;

interface

uses
  Regra.Interfaces, System.SysUtils, Regra.Controller;

type
  TRegraLucroPresumido = class(TInterfacedObject, iRegras)
  private
    FDisplay: TProc<String>;
    FOperacoes: iRegrasOperacoes;
  public
    class function New: iRegras;
    function Name(): string;

    function Display(aValue: TProc<string>): iRegras; overload;
    function Display: TProc<String>; overload;
    function PercentImposto(): Currency;
    function Operacoes: iRegrasOperacoes;
  end;

implementation

uses
  Regra.Tipo, Regra.Operacoes;

{ TRegraSimplesNacional }

class function TRegraLucroPresumido.New: iRegras;
begin
  Result:= Self.Create;
end;

function TRegraLucroPresumido.Operacoes: iRegrasOperacoes;
begin
  if not (Assigned(FOperacoes)) then
    FOperacoes:= TRegrasOperacoes.New(Self);

  Result:= FOperacoes;
end;

function TRegraLucroPresumido.PercentImposto: Currency;
begin
  Result:= 0.3;
end;

function TRegraLucroPresumido.Display: TProc<String>;
begin
  Result:= FDisplay;
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
