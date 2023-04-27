unit Regra.LucroReal;

interface

uses
  Regra.Interfaces, System.SysUtils, Regra.Controller, Regra.Parametros;

type
  TRegraLucroReal = class(TInterfacedObject, iRegras)
  private
    FOperacoes: iRegrasOperacoes;
    FParametros: iRegrasParametros;
  public
    constructor Create();
    destructor Destroy; override;
    class function New: iRegras;
    function Operacoes: iRegrasOperacoes;
    function Parametros: iRegrasParametros;
  end;

implementation

uses
  Regra.Tipo, Regra.Operacoes;

{ TRegraSimplesNacional }

constructor TRegraLucroReal.Create;
begin
  FParametros:= TRegrasParametros.New(Self);
  FParametros
    .Name('Lucro Real')
    .PercentImposto(0.4)
    .PercentImpostoST(0.75)
    .DataPagamento(Now + 150);
end;

destructor TRegraLucroReal.Destroy;
begin
  inherited;
end;

class function TRegraLucroReal.New: iRegras;
begin
  Result:= Self.Create;
end;

function TRegraLucroReal.Operacoes: iRegrasOperacoes;
begin
  if not (Assigned(FOperacoes)) then
    FOperacoes:= TRegrasOperacoes.New(Self);

  Result:= FOperacoes;
end;

function TRegraLucroReal.Parametros: iRegrasParametros;
begin
  if not (Assigned(FParametros)) then
    FParametros:= TRegrasParametros.New(Self);

  Result:= FParametros;
end;


initialization
  TRegraController.New.Registro(Integer(TRegraLucroReal), 'Lucro Real');

end.
