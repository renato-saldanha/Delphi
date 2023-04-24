unit Regra.Interfaces;

interface

uses
  System.SysUtils, System.Classes;

type
  iRegrasController = interface ['{BC92366B-4A9C-4F27-A714-7C0DBC80D046}']
    function Registro(aKey: Integer; aValur: String) : iRegrasController;
    function ListaRegras(aValue: TStrings): iRegrasController;
  end;

  iRegras = interface ['{25C66B0E-FB18-419E-9188-0B65A74CB46B}']
    function Name(): string;
    function CalcularImposto(aValue: Currency): Currency; overload;
    function CalcularImposto(aValue: String): Currency; overload;
    function Display(aValue: TProc<string>): iRegras;
  end;

implementation

end.
