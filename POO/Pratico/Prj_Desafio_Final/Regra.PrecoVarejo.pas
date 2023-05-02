unit Regra.PrecoVarejo;

interface

uses
  Regra.Interfaces, Regra.Controller, Regra.Operacoes, Regra.Parametros;

type
  TRegraPrecoVarejo= class(TInterfacedObject, iRegra)
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

constructor TRegraPrecoVarejo.Create;
begin
  FParametros := TRegraParametros
    .New(Self)
    .Descricao('Preço Varejo')
    .PercAumento(0.2);
end;

destructor TRegraPrecoVarejo.Destroy;
begin

  inherited;
end;

function TRegraPrecoVarejo.Operacoes: iRegraOperacoes;
begin
  if not Assigned(FOperacoes) then
    FOperacoes := TRegraOperacoes.New(Self);
  Result:= FOperacoes;
end;

function TRegraPrecoVarejo.Parametros: iRegraParametros;
begin
 if not Assigned(FParametros) then
    FParametros := TRegraParametros.New(Self);
  Result:= FParametros;
end;

initialization
  TRegraController.New.RegistrarClasse(Integer(trVarejo), 'Preço Varejo');

end.
