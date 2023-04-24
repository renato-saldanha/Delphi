unit Regra.SimplesNacional;

interface

uses
  Regra.Interfaces, System.SysUtils, Regra.Controller;

type
  TRegraSimplesNacional = class(TInterfacedObject, iRegras)
  private
    FDisplay: TProc<String>;
    FOperacoes: iRegrasOperacoes;
  public
    class function New(): iRegras;
    function Name(): string;

    function Display(aValue: TProc<String>): iRegras;  overload;
    function Display: TProc<String>; overload;
    function PercentImposto(): Currency;
    function Operacoes: iRegrasOperacoes;
  end;

implementation

uses
  Regra.Tipo, Regra.Operacoes;


{ TRegraSimplesNacional }

class function TRegraSimplesNacional.New: iRegras;
begin
  Result:= Self.Create;
end;

function TRegraSimplesNacional.Operacoes: iRegrasOperacoes;
begin
  if not (Assigned(FOperacoes)) then
    FOperacoes:= TRegrasOperacoes.New(Self);

  Result:= FOperacoes;
end;

function TRegraSimplesNacional.PercentImposto: Currency;
begin
  Result:= 0.2;
end;

function TRegraSimplesNacional.Display: TProc<String>;
begin
  Result:= FDisplay;
end;

function TRegraSimplesNacional.Display(aValue: TProc<string>): iRegras;
begin
  Result    := Self;
  FDisplay  := aValue;
end;

function TRegraSimplesNacional.Name: string;
begin
  Result:= 'Simples Nacional';
end;

initialization
  TRegraController.New.Registro(Integer(trSimplesNacional), 'Simples Nacional');

end.
