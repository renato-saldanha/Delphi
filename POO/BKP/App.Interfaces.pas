unit App.Interfaces;

interface

uses
  System.SysUtils, Vcl.Forms, Vcl.StdCtrls, Vcl.DBGrids, Winapi.Windows,
  Vcl.Grids, System.Generics.Collections;

type
  iBackupOperacoes = interface;
  iBackupParametros = interface;
  iClienteBackupArquivos = interface;

  iClienteBackup = interface
    ['{D1A8E49D-7812-426A-8BDC-93BC98E5FFED}']

    function ValidarCampos: iClienteBackup;
    function codigo(aValue: String): iClienteBackup; overload;
    function codigo: Integer; overload;
    function nome(aValue: String): iClienteBackup; overload;
    function nome: String; overload;
    function pasta_backup(aValue: String): iClienteBackup; overload;
    function pasta_backup: String; overload;
    function ativo(aValue: Integer): iClienteBackup; overload;
    function ativo: String; overload;
    function ClienteBackupArquivo: iClienteBackupArquivos; overload;
    function ClienteBackupArquivo(AIndex: Integer): iClienteBackupArquivos; overload;
    function ClienteBackupArquivo(aDBGrig: TDBGrid): iClienteBackupArquivos; overload;
    function ListaClienteBackupArquivos: TList<iClienteBackupArquivos>;
  end;

  iClienteBackupArquivos = interface
    ['{D1A8E49D-7812-426A-8BDC-93BC98E5FFED}']

    function id(aValue: String): iClienteBackupArquivos; overload;
    function id: Integer; overload;
    function data_ultimo_backup(aValue: String): iClienteBackupArquivos; overload;
    function data_ultimo_backup: String; overload;
    function tamanho_ultimo_backup(aValue: String): iClienteBackupArquivos; overload;
    function tamanho_ultimo_backup: Int64; overload;
    function limite_dias(aValue: Integer): iClienteBackupArquivos; overload;
    function limite_dias: Integer; overload;
    function limite_tamanho(aValue: Integer): iClienteBackupArquivos; overload;
    function limite_tamanho: Integer; overload;
    function nome_arquivo(aValue: String): iClienteBackupArquivos; overload;
    function nome_arquivo: String ; overload;
    function ativo(aValue: String): iClienteBackupArquivos; overload;
    function ativo: String ; overload;

    function &End: iClienteBackup;
  end;

  iBackupController = interface
    ['{CC5DF010-DA76-42DE-912B-EEA9F239BBFC}']

    function Operacoes: iBackupOperacoes;
    function Parametros: iBackupParametros;
  end;

  iBackupOperacoes = interface
    ['{A38B9061-171C-44BD-8865-60E0C4CA319E}']

    function FiltrarClienteBackup(ACodigo: TCustomEdit; aForm: TForm): iBackupOperacoes; overload;
    function PesquisarClientesBackup(aParent: iClienteBackup): iBackupOperacoes;
    function GravarClienteBackup(aClienteBackup: iClienteBackup): iBackupOperacoes;
    function CalcularTotais(aDBGrid: TDBGrid): iBackupOperacoes;
    function SincronizarListaClientesBackup: iBackupOperacoes;
    function InativarClienteBackup: iBackupOperacoes;
    function DesabilitarBancoDoConsultor: iBackupOperacoes;
    function PesquisarCliente(aEdtCodCliente: TCustomEdit): iBackupOperacoes;
    function CarregarBancosDataset(aCodCliente, aDiretorio : TCustomEdit): iBackupOperacoes;
    function FecharConexao(aForm: TForm): iBackupOperacoes;

    function &End: iBackupController;
  end;

  iBackupParametros = interface
    ['{A38B9061-171C-44BD-8865-60E0C4CA319E}']

    function DisplayQtdeNormal(aValue: TProc<String>): iBackupParametros; overload;
    function DisplayQtdeNormal: TProc<String>; overload;

    function DisplayQtdeAtrasado(aValue: TProc<String>): iBackupParametros; overload;
    function DisplayQtdeAtrasado: TProc<String>; overload;

    function DisplayQtdeTamanhoDiferente(aValue: TProc<String>): iBackupParametros; overload;
    function DisplayQtdeTamanhoDiferente: TProc<String>; overload;

    function DisplayTotalGeral(aValue: TProc<String>): iBackupParametros; overload;
    function DisplayTotalGeral: TProc<String>; overload;

    function QtdeNormal(aValue: Integer): iBackupParametros; overload;
    function QtdeNormal: String; overload;

    function QtdeAtrasado(aValue: Integer): iBackupParametros; overload;
    function QtdeAtrasado: String; overload;

    function QtdeTamanhoDiferente(aValue: Integer): iBackupParametros; overload;
    function QtdeTamanhoDiferente: String; overload;

    function TotalGeral(aValue: Integer): iBackupParametros; overload;
    function TotalGeral: String; overload;

    function ZerarValores: iBackupParametros;
    function DisplaysValidos :Boolean;
    function &End: iBackupController;
  end;

implementation

end.
