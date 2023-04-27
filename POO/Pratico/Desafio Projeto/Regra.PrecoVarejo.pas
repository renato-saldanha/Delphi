unit Regra.PrecoVarejo;

interface

uses
  Regra.Interfaces, System.SysUtils;
type
  TRegraPrecoVarejo= class(TInterfacedObject, iRegras)
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
  Regra.Controller, Regra.Tipo, Regra.Operacoes, Regra.Parametros;

{ TRegraPrecoVarejo }

constructor TRegraPrecoVarejo.Create;
begin
  FParametros := TRegrasParametros
    .New(Self)
    .PercAumento(0.2)
    .Name('Pre�o Varejo');
end;

destructor TRegraPrecoVarejo.Destroy;
begin

  inherited;
end;

class function TRegraPrecoVarejo.New: iRegras;
begin
  Result:= Self.Create;
end;

function TRegraPrecoVarejo.Operacoes: iRegrasOperacoes;
begin
  if not(Assigned(FOperacoes)) then
    FOperacoes := TRegrasOperacoes.New(Self);
  Result := FOperacoes;
end;

function TRegraPrecoVarejo.Parametros: iRegrasParametros;
begin
  if not(Assigned(FParametros)) then
    FParametros := TRegrasParametros.New(Self);
  Result := FParametros;
end;

initialization
  TRegrasController.New.RegistrarClasse(Integer(trPrecoVarejo), 'Pre�o Varejo');
end.
