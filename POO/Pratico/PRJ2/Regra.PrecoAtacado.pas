unit Regra.PrecoAtacado;

interface
uses
  Regra.Controller, Regra.Interfaces, System.SysUtils, Regra.Operacoes,
  Regra.Parametros;

type
  TRegrasPrecoAtacado= class(TInterfacedObject, iRegras)
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

{ TRegrasPrecoAtacado }

function TRegrasPrecoAtacado.Operacoes: iRegrasOperacoes;
begin
  if not (Assigned(FOperacoes)) then
    FOperacoes:= TRegraOperacoes.New(Self);
  Result:= FOperacoes;
end;

function TRegrasPrecoAtacado.Parametros: iRegrasParametros;
begin
  if not (Assigned(FParametros)) then
    FParametros:= TRegraParametros.New(Self);
  Result:= FParametros;
end;

initialization
  TRegraController.New.RegistrarClasse(Integer(tpAtacado), 'Preço Atacado');
end.
