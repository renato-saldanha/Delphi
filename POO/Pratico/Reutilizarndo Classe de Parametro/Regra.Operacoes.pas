unit Regra.Operacoes;

interface

uses
  Regra.Interfaces, System.SysUtils;
type
  TRegrasOperacoes = class(TInterfacedObject, iRegrasOperacoes)
    private
      FDisplay: TProc<String>;

      [weak]
      FParent: iRegras;
    function Display(aValue: TProc<string>): iRegrasOperacoes;
    public
      constructor Create(aParent: iRegras);
      destructor Destroy; override;
      class function  New(aParent: iRegras): iRegrasOperacoes;

      function CalcularImposto(aValue: Currency): Currency; overload;
      function CalcularImposto(aValue: String): Currency; overload;
      function CalcularImpostoST(aValue: Currency): Currency; overload;
      function CalcularImpostoST(aValue: String): Currency; overload;
  end;


implementation

{ TRegrasOperacoes }

class function TRegrasOperacoes.New(aParent: iRegras): iRegrasOperacoes;
begin
  Result:= Self.Create(aParent);
end;

constructor TRegrasOperacoes.Create(aParent: iRegras);
begin
  FParent:= aParent;
end;

destructor TRegrasOperacoes.Destroy;
begin
  inherited;
end;

function TRegrasOperacoes.CalcularImposto(aValue: Currency): Currency;
begin
  Result:= (aValue * FParent.PercentImposto) + aValue;

  if (Assigned(FParent.Display)) then
    FParent.Display()(CurrToStr(Result));
end;

function TRegrasOperacoes.CalcularImposto(aValue: String): Currency;
begin
  Result:= 0;

  if (TryStrToCurr(aValue, Result)) then
    Result:= CalcularImposto(StrToCurr(aValue));
end;

function TRegrasOperacoes.CalcularImpostoST(aValue: String): Currency;
begin
  Result:= 0;

  if (TryStrToCurr(aValue, Result)) then
    Result:= CalcularImpostoST(StrToCurr(aValue));
end;

function TRegrasOperacoes.CalcularImpostoST(aValue: Currency): Currency;
begin
  Result:= (aValue * FParent.PercentImposto - (aValue * 0.75)) + aValue;

  if (Assigned(FParent.Display)) then
    FParent.Display()(CurrToStr(Result));
end;

function TRegrasOperacoes.Display(aValue: TProc<string>): iRegrasOperacoes;
begin
  Result    := Self;
  FDisplay  := aValue;
end;

end.
