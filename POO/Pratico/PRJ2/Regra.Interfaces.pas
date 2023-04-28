unit Regra.Interfaces;

interface

uses
  System.SysUtils, System.Classes;

type
  iRegrasOperacoes = interface;
  iRegrasParametros = interface;

  iRegras = interface
    ['{604F4574-BA82-401A-9AE5-996C7B984B6D}']

    function Operacoes: iRegrasOperacoes;
    function Parametros: iRegrasParametros;
  end;

  iRegrasController = interface
    ['{76006634-235B-401A-A308-64FFA88321A0}']

    function ListarRegras(aValue: TStrings): iRegrasController;
    function RegistrarClasse(aKey: Integer; aValue: String): iRegrasController;
  end;

  iRegrasOperacoes = interface
    ['{423483B7-E83A-40C1-B0CA-8195D22EBA28}']

    function CalcularPreco(aValue: Currency): String;
  end;

  iRegrasParametros = interface
    ['{DE9E0FDC-5AC9-4557-BEE5-917347600118}']

    function Descricao(aValue: String): iRegrasParametros; overload;
    function Descricao: String; overload;

    function PercAumento(aValue: Currency): iRegrasParametros; overload;
    function PercAumento: Currency; overload;

    function Display(aValue: TProc<String>): iRegrasParametros; overload;
    function Display: TProc<String>; overload;
  end;

implementation

end.
