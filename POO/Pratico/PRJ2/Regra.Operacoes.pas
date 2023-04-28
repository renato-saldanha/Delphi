unit Regra.Operacoes;

interface

uses
  Regra.Interfaces, System.SysUtils;

type
  TRegraOperacoes = class(TInterfacedObject, iRegrasOperacoes)
  private
    [weak]
    FParent: iRegras;
  public
    constructor Create(aParent: iRegras);
    destructor Destroy; override;
    class function New(aParent: iRegras): iRegrasOperacoes;
    function CalcularPreco(aValue: Currency): String;
  end;

implementation

{ TRegraOperacoes }

constructor TRegraOperacoes.Create(aParent: iRegras);
begin
  FParent := aParent;
end;

destructor TRegraOperacoes.Destroy;
begin

  inherited;
end;

class function TRegraOperacoes.New(aParent: iRegras): iRegrasOperacoes;
begin
  Result := Self.Create(aParent);
end;

function TRegraOperacoes.CalcularPreco(aValue: Currency): String;
begin
  Result:= CurrToStr(aValue + (aValue * FParent.Parametros.PercAumento));
  FParent.Parametros.Display()(Result);
end;

end.
