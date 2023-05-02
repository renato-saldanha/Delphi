unit Regra.PrecoFeriado;

interface

uses
  Regra.Interfaces, Regra.Controller, Regra.Operacoes, Regra.Parametros;

type
  TRegraPrecoFeriado = class(TInterfacedObject, iRegra)
    private
      FOperacoes: iRegraOperacoes;
      FParametros: iRegraParametros;
    public
    constructor Create;
    destructor Destroy; override;

    function Operacoes  : iRegraOperacoes;
    function Parametros : iRegraParametros;
  end;

implementation
uses
  Regra.Tipo;

constructor TRegraPrecoFeriado.Create;
begin
  FParametros := TRegraParametros
    .New(Self)
    .Descricao('Preço Feriado')
    .PercAumento(0.4);
end;

destructor TRegraPrecoFeriado.Destroy;
begin

  inherited;
end;

function TRegraPrecoFeriado.Operacoes: iRegraOperacoes;
begin
  if not Assigned(FOperacoes) then
    FOperacoes := TRegraOperacoes.New(Self);
  Result:= FOperacoes;
end;

function TRegraPrecoFeriado.Parametros: iRegraParametros;
begin
 if not Assigned(FParametros) then
    FParametros := TRegraParametros.New(Self);
  Result:= FParametros;
end;

initialization
  TRegraController.New.RegistrarClasse(Integer(trFeriado), 'Preço Feriado');

end.
