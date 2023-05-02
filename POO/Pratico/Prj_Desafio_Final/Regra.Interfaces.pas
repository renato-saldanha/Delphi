unit Regra.Interfaces;

interface

uses
  System.Classes, System.SysUtils;
type
  iRegraOperacoes  = interface;
  iRegraParametros = interface;

  iRegra = interface
    ['{A32EF832-570F-42B7-8D19-0D7CAAAB54CE}']

    function Operacoes  : iRegraOperacoes;
    function Parametros : iRegraParametros;
  end;

  iRegraController = interface
    ['{CA2A9345-03D0-4E4A-967E-DBDC8E384C9E}']

    function RegistrarClasse(aKey: Integer; aValue: string): iRegraController;
    function ListarRegras(aValue: TStrings): iRegraController;
  end;

  iRegraOperacoes = interface
    ['{A32545CC-31A4-4F95-B508-DAB7155DF1B4}']

    function CalcularPercentual(aValue: String): iRegra;
  end;

  iRegraParametros = interface
    ['{7A2E11BF-3511-4A29-9243-8D61312A088C}']

    function Descricao(aValue: String): iRegraParametros; overload;
    function Descricao: String; overload;

    function PercAumento(aValue: Currency): iRegraParametros; overload;
    function PercAumento: Currency; overload;

    function Display(aValue: TProc<string>): iRegraParametros; overload;
    function Display: TProc<string>; overload;

    function &End: iRegra;
  end;

implementation

end.

