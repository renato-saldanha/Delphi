unit Regra.LucroPresumido;

interface

uses
  Regra;
type
  TRegraLucroPresumido = class(TRegra)
  private
  public
    function Name(): string; override;


  end;

implementation

{ TRegraSimplesNacional }

function TRegraLucroPresumido.Name(): string;
begin
  Result:= 'Lucro Presumido';
end;

end.
