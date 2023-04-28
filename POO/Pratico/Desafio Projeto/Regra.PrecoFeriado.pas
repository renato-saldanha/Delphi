unit Regra.PrecoFeriado;

interface

uses
  Regra.Interfaces, System.SysUtils, Regra.Controller;

type
  TRegraPrecoFeriado = class(TInterfacedObject, iRegras)
  private
    FParametros: iRegrasParametros;
    FOperacoes: iRegrasOperacoes;
  public
    constructor Create();
    destructor Destroy; override;
    function Operacoes: iRegrasOperacoes;
    function Parametros: iRegrasParametros;
  end;

implementation

uses
  Regra.Tipo, Regra.Operacoes, Regra.Parametros;

{ TRegraPrecoFeriado }

constructor TRegraPrecoFeriado.Create;
begin
  FParametros := TRegrasParametros
    .New(Self)
    .PercAumento(0.4)
    .Name('Pre�o Feriado');
end;

destructor TRegraPrecoFeriado.Destroy;
begin

  inherited;
end;

function TRegraPrecoFeriado.Operacoes: iRegrasOperacoes;
begin
  if not(Assigned(FOperacoes)) then
    FOperacoes := TRegrasOperacoes.New(Self);
  Result := FOperacoes;
end;

function TRegraPrecoFeriado.Parametros: iRegrasParametros;
begin
  if not(Assigned(FParametros)) then
    FParametros := TRegrasParametros.New(Self);
  Result := FParametros;
end;

initialization

TRegrasController.New.RegistrarClasse(Integer(trPrecoFeriado), 'Pre�o Feriado');

end.
