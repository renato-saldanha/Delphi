unit Regra.Tipo;

interface

uses
  Regra.Interfaces, Regra.PrecoAtacado, Regra.PrecoVarejo, Regra.PrecoFeriado;

  type
  TEnumTipoPreco = (tpFeriado, tpVarejo, tpAtacado);

  TEnumTipoPrecoHelper = record Helper for TEnumTipoPreco
    function this: iRegras;
  end;


implementation

{ TEnumTipoPrecoHelper }

function TEnumTipoPrecoHelper.this: iRegras;
begin
  case (Self) of
    tpFeriado : Result := TRegrasPrecoFeriado.Create;
    tpVarejo  : Result := TRegrasPrecoVarejo.Create;
    tpAtacado : Result := TRegrasPrecoAtacado.Create;
  end;
end;

end.
