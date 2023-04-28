unit Regra.PrecoFeriado;

interface

uses
  Regra.Controller, Regra.Interfaces, System.Classes, System.SysUtils,
  Regra.Operacoes;

type
  TRegrasPrecoFeriado = class(TInterfacedObject, iRegras)
  private
    FOperacoes: iRegrasOperacoes;
    FParametros: iRegrasParametros;
  public

    function Operacoes: iRegrasOperacoes;
    function Parametros: iRegrasParametros;
  end;

implementation

uses
  Regra.Parametros, Regra.Tipo;

{ TRegrasPrecoFeriado }

{ TRegrasPrecoFeriado }

function TRegrasPrecoFeriado.Operacoes: iRegrasOperacoes;
begin
  if not (Assigned(FOperacoes)) then
    FOperacoes:= TRegraOperacoes.New(Self);
  Result:= FOperacoes;
end;

function TRegrasPrecoFeriado.Parametros: iRegrasParametros;
begin
  if not (Assigned(FParametros)) then
    FParametros:= TRegraParametros.New(Self);
  Result:= FParametros;
end;

initialization

TRegraController.New.RegistrarClasse(Integer(tpFeriado), 'Preço Feriado');

end.
