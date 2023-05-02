unit Regra.Operacoes;

interface

uses
  Regra.Interfaces, System.SysUtils;

type
  TRegraOperacoes = class(TInterfacedObject, iRegraOperacoes)
  private
    [weak]
    FParent: iRegra;
  public
    constructor Create(aParent: iRegra);
    destructor Destroy; override;
    class function New(aParent: iRegra): iRegraOperacoes;

    function CalcularPercentual(aValue: String): iRegra;
  end;

implementation

{ TRegraOperacoes }

constructor TRegraOperacoes.Create(aParent: iRegra);
begin
  FParent := aParent;
end;

destructor TRegraOperacoes.Destroy;
begin

  inherited;
end;

class function TRegraOperacoes.New(aParent: iRegra): iRegraOperacoes;
begin
  Result:= Self.Create(aParent);
end;

function TRegraOperacoes.CalcularPercentual(aValue: String): iRegra;
var
  Valor: Currency;
  Total: Currency;
begin
  Result := FParent;
  Valor := StrToCurr(aValue);
  Total := Valor + (Valor * FParent.Parametros.PercAumento());

  if Assigned(FParent.Parametros.Display) then
    FParent.Parametros.Display()(CurrToStr(Total));
end;

end.
