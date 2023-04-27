unit Regra.LucroPresumido;

interface

uses
  Regra.Interfaces, System.SysUtils, Regra.Controller, Regra.Parametros;

type
  TRegraLucroPresumido = class(TInterfacedObject, iRegras)
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

constructor TRegraLucroPresumido.Create;
begin
  FParametros:= TRegrasParametros.New(Self);
  FParametros
    .Name('Lucro Presumido')
    .PercentImposto(0.3)
    .PercentImpostoST(0.75)
                              
end;

destructor TRegraLucroPresumido.Destroy;
begin
  inherited;
end;

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

function TRegraLucroPresumido.Parametros: iRegrasParametros;
begin
  if not (Assigned(FParametros)) then
    FParametros:= TRegrasParametros.New(Self);

  Result:= FParametros;
end;

initialization
  TRegraController.New.Registro(Integer(trLucroPresumido), 'Lucro Presumido');

end.
