unit Regra.Interfaces;

interface

type
  iRegras = interface ['{25C66B0E-FB18-419E-9188-0B65A74CB46B}']
    function Name(): string;
    function CalcularImposto(aValue: Currency): Currency; overload;
    function CalcularImposto(aValue: String): Currency; overload;
  end;

implementation

end.
