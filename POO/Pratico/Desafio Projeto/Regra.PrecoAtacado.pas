unit Regra.PrecoAtacado;

interface

uses
  Regra.Interfaces, System.SysUtils, Regra.Controller;
type
  TRegraPrecoAtacado= class(TInterfacedObject, iRegras)
    private
      FOperacoes: iRegrasOperacoes;
      FParametros: iRegrasParametros;
    public
      constructor Create;
      destructor Destroy; override;
      class function New: iRegras;
      function Operacoes: iRegrasOperacoes;
      function Parametros: iRegrasParametros;
  end;
implementation

uses
  Regra.Tipo, Regra.Parametros, Regra.Operacoes;


{ TRegraPrecoAtacado }

constructor TRegraPrecoAtacado.Create;
begin
  FParametros := TRegrasParametros
    .New(Self)
    .PercAumento(0.3)
    .Name('Preço Atacado');
end;

destructor TRegraPrecoAtacado.Destroy;
begin

  inherited;
end;

class function TRegraPrecoAtacado.New: iRegras;
begin
  Result:= Self.Create;
end;

function TRegraPrecoAtacado.Operacoes: iRegrasOperacoes;
begin
  if not(Assigned(FOperacoes)) then
    FOperacoes := TRegrasOperacoes.New(Self);
  Result := FOperacoes;
end;

function TRegraPrecoAtacado.Parametros: iRegrasParametros;
begin
  if not(Assigned(FParametros)) then
    FParametros := TRegrasParametros.New(Self);
  Result := FParametros;
end;

initialization
  TRegrasController.New.RegistrarClasse(Integer(trPrecoAtacado), 'Preço Atacado');
end.
