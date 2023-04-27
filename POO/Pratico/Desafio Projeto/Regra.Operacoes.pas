unit Regra.Operacoes;

interface

uses
  Regra.Interfaces, System.SysUtils;

type
  TRegrasOperacoes = class(TInterfacedObject, iRegrasOperacoes)
  private
    [weak]
    FParent: iRegras;
  public
    constructor Create(aParent: iRegras);
    destructor Destroy; override;
    class function New(aParent: iRegras): iRegrasOperacoes;
    function CalcularPreco(aValue: String): string;
  end;

implementation

{ TRegrasOperacoes }

constructor TRegrasOperacoes.Create(aParent: iRegras);
begin
  FParent := aParent;
end;

destructor TRegrasOperacoes.Destroy;
begin

  inherited;
end;

class function TRegrasOperacoes.New(aParent: iRegras): iRegrasOperacoes;
begin
  Result := Self.Create(aParent);
end;

function TRegrasOperacoes.CalcularPreco(aValue: String): string;
begin
  Result := CurrToStr(StrToCurr(aValue) + (StrToCurr(aValue) * FParent.Parametros.PercAumento));

  if Assigned(FParent.Parametros.Display) then
  begin
    FParent.Parametros.Display()(Result);
  end;
end;

end.
