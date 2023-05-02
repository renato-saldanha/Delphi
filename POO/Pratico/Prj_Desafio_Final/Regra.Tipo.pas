unit Regra.Tipo;

interface

uses
  Regra.Interfaces, Regra.PrecoFeriado, Regra.PrecoVarejo, Regra.PrecoAtacado;

type
  TEnumTIpoReceita = (trFeriado, trAtacado, trVarejo);

  TEnumTIpoReceitaHelper = record Helper for TEnumTIpoReceita
    function this: iRegra;
  end;

implementation

{ TEnumTIpoReceitaHelper }

function TEnumTIpoReceitaHelper.this: iRegra;
begin
  case (Self) of
    trFeriado: Result := TRegraPrecoFeriado.Create;
    trAtacado: Result := TRegraPrecoAtacado.Create;
    trVarejo : Result := TRegraPrecoVarejo.Create;
  end;
end;

end.
