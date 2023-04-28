unit Regra.Parametros;

interface

uses
  Regra.Interfaces, System.SysUtils;

type
  TRegraParametros = class(TInterfacedObject, iRegrasParametros)
  private
    [weak]
    FParent: iRegras;
    FDescricao: String;
    FPercAumento: Currency;
    FDisplay: TProc<String>;
  public
    constructor Create(aParent: iRegras);
    destructor Destroy; override;
    class function New(aParent: iRegras): iRegrasParametros;

    function Descricao(aValue: String): iRegrasParametros; overload;
    function Descricao: String; overload;

    function PercAumento(aValue: Currency): iRegrasParametros; overload;
    function PercAumento: Currency; overload;

    function Display(aValue: TProc<String>): iRegrasParametros; overload;
    function Display: TProc<String>; overload;
  end;

implementation

{ TRegraParametros }

constructor TRegraParametros.Create(aParent: iRegras);
begin
  FParent := aParent;
end;

destructor TRegraParametros.Destroy;
begin

  inherited;
end;

class function TRegraParametros.New(aParent: iRegras): iRegrasParametros;
begin
  Result := Self.Create(aParent);
end;

function TRegraParametros.Descricao: String;
begin
  Result := FDescricao;
end;

function TRegraParametros.Descricao(aValue: String): iRegrasParametros;
begin
  Result := Self;
  FDescricao := aValue;
end;

function TRegraParametros.Display: TProc<String>;
begin
  Result := FDisplay;
end;

function TRegraParametros.Display(aValue: TProc<String>): iRegrasParametros;
begin
  Result := Self;
  FDisplay := aValue;
end;

function TRegraParametros.PercAumento: Currency;
begin
  Result := FPercAumento;
end;

function TRegraParametros.PercAumento(aValue: Currency): iRegrasParametros;
begin
  Result := Self;
  FPercAumento := aValue;
end;

end.
