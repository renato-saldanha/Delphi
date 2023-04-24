unit Regra.Interfaces;

interface

type
  iRegras = interface ['{02AC91DA-3728-4E81-8318-C29639483C9F}']
    function Name(): string;
    function CalculaImposto(aValue: Currency): Currency;
  end;

implementation

end.
