unit Regra.PrecoAtacado;

interface

uses
  Regra.Interfaces, Regra.Controller, Regra.Operacoes, Regra.Parametros;

type
  TRegraPrecoAtacado= class(TInterfacedObject, iRegra)
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

{ TRegraPrecoAtacado }

constructor TRegraPrecoAtacado.Create;
begin
  FParametros := TRegraParametros
    .New(Self)
    .Descricao('Preço Atacado')
    .PercAumento(0.3);
end;

destructor TRegraPrecoAtacado.Destroy;
begin

  inherited;
end;

function TRegraPrecoAtacado.Operacoes: iRegraOperacoes;
begin
  if not Assigned(FOperacoes) then
    FOperacoes := TRegraOperacoes.New(Self);
  Result:= FOperacoes;
end;

function TRegraPrecoAtacado.Parametros: iRegraParametros;
begin
 if not Assigned(FParametros) then
    FParametros := TRegraParametros.New(Self);
  Result:= FParametros;
end;

initialization
  TRegraController.New.RegistrarClasse(Integer(trAtacado), 'Preço Atacado');

end.
