unit Regra.Tipo;

interface

uses
  Regra.Interfaces, Regra.PrecoAtacado, Regra.PrecoFeriado, Regra.PrecoVarejo;

type
  TEnumTipoPreco = (trPrecoFeriado, trPrecoAtacado, trPrecoVarejo);

  TEnumTipoPrecoHelper = record Helper for TEnumTipoPreco
    function this: iRegras;
  end;

implementation

{ TEnumTipoPrecoHelper }

function TEnumTipoPrecoHelper.this: iRegras;
begin
  case (Self) of
    trPrecoFeriado : Result:= TRegraPrecoFeriado.Create;
    trPrecoAtacado : Result:= TRegraPrecoAtacado.Create;
    trPrecoVarejo  : Result:= TRegraPrecoVarejo.Create;
  end;
end;

end.
