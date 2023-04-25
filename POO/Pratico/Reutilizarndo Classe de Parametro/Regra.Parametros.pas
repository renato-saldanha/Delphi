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
    FDisplay: TProc<String>;
    FPercentImposto: Currency;
    FPercentImpostoST: Currency;
    FDataPagamento: TDate;
  public
    constructor Create(aParent: iRegras);
    destructor Destroy; override;
    class function New(aParent: iRegras): iRegrasParametros;

    function Name(): string; overload;
    function Name(aValue: String): iRegrasParametros; overload;

    function Display(aValue: TProc<string>): iRegrasParametros; overload;
    function Display: TProc<String>; overload;

    function PercentImposto(): Currency; overload;
    function PercentImposto(aValue: Currency): iRegrasParametros; overload;


    function PercentImpostoST(): Currency; overload;
    function PercentImpostoST(aValue: Currency): iRegrasParametros; overload;

    function DataPagamento(): TDate; overload;
    function DataPagamento(aValue: TDate): iRegrasParametros; overload;


    function &End: iRegras;
  end;

implementation


{ TRegraParametros }

function TRegrasParametros.&End: iRegras;
begin
  Result:= FParent;
end;

constructor TRegrasParametros.Create(aParent: iRegras);
begin
  FParent:= aParent;
end;

function TRegrasParametros.DataPagamento(aValue: TDate): iRegrasParametros;
begin
  Result:= Self;
  FDataPagamento:= aValue;
end;

function TRegrasParametros.DataPagamento: TDate;
begin
  Result:= FDataPagamento;
end;

destructor TRegrasParametros.Destroy;
begin

  inherited;
end;

function TRegrasParametros.Display(aValue: TProc<string>): iRegrasParametros;
begin
  Result:= Self;
  FDisplay:= aValue;
end;

function TRegrasParametros.Display: TProc<String>;
begin
  Result:= FDisplay;
end;

function TRegrasParametros.Name: string;
begin
  Result:= FName;
end;

function TRegrasParametros.Name(aValue: String): iRegrasParametros;
begin
  Result:= Self;
  FName:= aValue;
end;

class function TRegrasParametros.New(aParent: iRegras): iRegrasParametros;
begin
  Result:= Self.Create(aParent);
end;

function TRegrasParametros.PercentImposto: Currency;
begin
  Result:= FPercentImposto;
end;

function TRegrasParametros.PercentImposto(aValue: Currency): iRegrasParametros;
begin
  Result:= Self;
  FPercentImposto:= aValue;
end;

function TRegrasParametros.PercentImpostoST(
  aValue: Currency): iRegrasParametros;
begin
  Result:= Self;
  FPercentImpostoST:= aValue;
end;

function TRegrasParametros.PercentImpostoST: Currency;
begin
  Result:= FPercentImpostoST;
end;

end.
