unit Regra.SimplesNacional;

interface

uses
  Regra;
type
  TRegraSimplesNacional = class(TRegra)
  private
  public
    function Name(): string; override;


  end;

implementation

{ TRegraSimplesNacional }

function TRegraSimplesNacional.Name(): string;
begin
  Result:= 'Simples Nacional';
end;

end.
