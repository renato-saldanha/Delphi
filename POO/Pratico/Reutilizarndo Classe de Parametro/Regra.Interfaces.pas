unit Regra.Interfaces;

interface

uses
  System.SysUtils, System.Classes;

type
  iRegrasController = interface ['{BC92366B-4A9C-4F27-A714-7C0DBC80D046}']
    function Registro(aKey: Integer; aValur: String) : iRegrasController;
    function ListaRegras(aValue: TStrings): iRegrasController;
  end;

  iRegrasOperacoes = interface;

  iRegras = interface ['{25C66B0E-FB18-419E-9188-0B65A74CB46B}']
    function Operacoes: iRegrasOperacoes;
  end;

  iRegrasParametros = interface ['{64BB2355-D447-4F83-9DE1-706528703EB7}']
    function Name(): string; overload;
    function Name(aValue: String): iRegrasParametros; overload;

    function Display(aValue: TProc<string>): iRegrasParametros; overload;
    function Display: TProc<String>; overload;

    function PercentImposto(): Currency; overload;
    function PercentImposto(aValue: String): iRegrasParametros; overload;
  end;

  iRegrasOperacoes = interface ['{CD43D187-92AB-4E9F-9FFB-E3378F15E97E}']
    function CalcularImposto(aValue: Currency): Currency; overload;
    function CalcularImposto(aValue: String): Currency; overload;
    function CalcularImpostoST(aValue: Currency): Currency; overload;
    function CalcularImpostoST(aValue: String): Currency; overload;
  end;

implementation

end.
