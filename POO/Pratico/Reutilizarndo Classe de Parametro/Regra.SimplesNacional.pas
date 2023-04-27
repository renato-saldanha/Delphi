unit Regra.SimplesNacional;

interface

uses
  Regra.Interfaces, System.SysUtils, Regra.Controller, Regra.Parametros;

type
  TRegraSimplesNacional = class(TInterfacedObject, iRegras)
  private
    FOperacoes: iRegrasOperacoes;
    FParametros: iRegrasParametros;
  public
    constructor Create();
    destructor Destroy; override;
    class function New(): iRegras;
    function Operacoes: iRegrasOperacoes;
    function Parametros: iRegrasParametros;
  end;

implementation

uses
  Regra.Tipo, Regra.Operacoes;


{ TRegraSimplesNacional }

constructor TRegraSimplesNacional.Create;
begin
  FParametros:= TRegrasParametros.New(Self);
  FParametros
    .Name('Simples Nacional')
    .PercentImposto(0.2)
    .PercentImpostoST(0.75)
    .DataPagamento(Now + 250);
end;

destructor TRegraSimplesNacional.Destroy;
begin
  inherited;
end;

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

function TRegraSimplesNacional.Parametros: iRegrasParametros;
begin
  if not (Assigned(FParametros)) then
    FParametros:= TRegrasParametros.New(Self);

  Result:= FParametros;
end;

initialization
  TRegraController.New.Registro(Integer(trSimplesNacional), 'Simples Nacional');

end.
