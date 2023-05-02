unit Regra.Parametros;

interface

uses
  Regra.Interfaces, System.SysUtils;

type
  TRegraParametros = class(TInterfacedObject, iRegraParametros)
  private
    [weak]
    FParent: iRegra;
    FDescricao: string;
    FPercAumento: Currency;
    FDisplay: TProc<string>;
  public
    constructor Create(aParent: iRegra);
    destructor Destroy; override;
    class function New(aParent: iRegra): iRegraParametros;

    function Descricao(aValue: String): iRegraParametros; overload;
    function Descricao: String; overload;

    function PercAumento(aValue: Currency): iRegraParametros; overload;
    function PercAumento: Currency; overload;

    function Display(aValue: TProc<string>): iRegraParametros; overload;

    function Display: TProc<string>; overload;


    function &End: iRegra;
  end;

implementation

{ TRegraParametros }

constructor TRegraParametros.Create(aParent: iRegra);
begin
  FParent := aParent;
end;

destructor TRegraParametros.Destroy;
begin

  inherited;
end;

class function TRegraParametros.New(aParent: iRegra): iRegraParametros;
begin
  Result := Self.Create(aParent);
end;

function TRegraParametros.Descricao(aValue: String): iRegraParametros;
begin
  Result     := Self;
  FDescricao := aValue;
end;

function TRegraParametros.Descricao: String;
begin
  Result := FDescricao;
end;

function TRegraParametros.Display(aValue: TProc<string>): iRegraParametros;
begin
  Result:= Self;
  FDisplay := aValue;
end;

function TRegraParametros.Display: TProc<string>;
begin
  Result := FDisplay;
end;

function TRegraParametros.&End: iRegra;
begin
  Result := FParent;
end;

function TRegraParametros.PercAumento(aValue: Currency): iRegraParametros;
begin
  Result         := Self;
  FPercAumento   := aValue;
end;

function TRegraParametros.PercAumento: Currency;
begin
  Result := FPercAumento;
end;

end.
