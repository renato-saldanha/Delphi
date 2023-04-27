unit Regra.Parametros;

interface

uses
  Regra.Interfaces, System.SysUtils;

type
  TRegrasParametros = class(TInterfacedObject, iRegrasParametros)
  private
    [weak]
    FParent: iRegras;
    FName: String;
    FDisplay: TProc<string>;
    FPercAumento: Currency;
  public
    constructor Create(aParent: iRegras);
    destructor Destroy; override;
    class function New(aParent: iRegras): iRegrasParametros;
    function Name(aValue: string): iRegrasParametros; overload;
    function Name: String; overload;

    function PercAumento(aValue: Currency): iRegrasParametros; overload;
    function PercAumento: Currency; overload;

    function Display(aValue: TProc<String>): iRegrasParametros; overload;
    function Display: TProc<String>; overload;

    function &End: iRegras;
  end;

implementation

{ TRegrasParametros }

function TRegrasParametros.&End: iRegras;
begin
  Result:= FParent;
end;

constructor TRegrasParametros.Create(aParent: iRegras);
begin
  FParent := aParent;
end;

destructor TRegrasParametros.Destroy;
begin

  inherited;
end;

class function TRegrasParametros.New(aParent: iRegras): iRegrasParametros;
begin
  Result := Self.Create(aParent)
end;

function TRegrasParametros.PercAumento: Currency;
begin
  Result := FPercAumento;
end;

function TRegrasParametros.PercAumento(aValue: Currency): iRegrasParametros;
begin
  FPercAumento := aValue;
  Result := Self;
end;

function TRegrasParametros.Name: String;
begin
  Result := FName;
end;

function TRegrasParametros.Name(aValue: string): iRegrasParametros;
begin
  FName := aValue;
  Result := Self;
end;

function TRegrasParametros.Display: TProc<string>;
begin
  Result := FDisplay
end;

function TRegrasParametros.Display(aValue: TProc<string>): iRegrasParametros;
begin
  FDisplay := aValue;
  Result := Self;
end;

end.
