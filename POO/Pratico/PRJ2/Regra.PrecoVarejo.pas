unit Regra.PrecoVarejo;

interface

uses
  Regra.Controller, Regra.Interfaces, System.SysUtils, Regra.Operacoes,
  Regra.Parametros;

type
  TRegrasPrecoVarejo= class(TInterfacedObject, iRegras)
  private
    FOperacoes: iRegrasOperacoes;
    FParametros: iRegrasParametros;
  public
    function Operacoes: iRegrasOperacoes;
    function Parametros: iRegrasParametros;
  end;

implementation

uses
  Regra.Tipo;

{ TRegrasPrecoVarejo }

function TRegrasPrecoVarejo.Operacoes: iRegrasOperacoes;
begin
  if not (Assigned(FOperacoes)) then
    FOperacoes:= TRegraOperacoes.New(Self);
  Result:= FOperacoes;
end;

function TRegrasPrecoVarejo.Parametros: iRegrasParametros;
begin
  if not (Assigned(FParametros)) then
    FParametros:= TRegraParametros.New(Self);
  Result:= FParametros;
end;

initialization
  TRegraController.New.RegistrarClasse(Integer(tpVarejo), 'Preço Varejo');
end.
