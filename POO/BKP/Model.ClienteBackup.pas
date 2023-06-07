unit Model.ClienteBackup;

interface

uses
  System.SysUtils, System.Generics.Collections, App.Enums,
  System.TypInfo, Vcl.DBGrids,
  App.Interfaces,
  App.Util;

type
  TClienteBackupArquivos = class;

  TClienteBackup = class(TInterfacedObject, iClienteBackup)
  private
    Fcodigo: Integer;
    Fnome: String;
    Fpasta_backup: String;
    Fativo: Integer;
    FListaClienteBackupArquivos: TList<iClienteBackupArquivos>;
    FClienteBackupArquivos : iClienteBackupArquivos;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iClienteBackup;
    function ValidarCampos: iClienteBackup;

    function codigo(aValue: String ): iClienteBackup; overload;
    function codigo: Integer; overload;
    function nome(aValue: String ): iClienteBackup; overload;
    function nome: String; overload;
    function pasta_backup(aValue: String ): iClienteBackup; overload;
    function pasta_backup: String; overload;
    function ativo(aValue: Integer): iClienteBackup; overload;
    function ativo: String ; overload;
    function ClienteBackupArquivo: iClienteBackupArquivos; overload;
    function ClienteBackupArquivo(AIndex: Integer): iClienteBackupArquivos; overload;
    function ClienteBackupArquivo(aDBGrig: TDBGrid): iClienteBackupArquivos; overload;
    function ListaClienteBackupArquivos: TList<iClienteBackupArquivos>;
  end;

  TClienteBackupArquivos = class(TInterfacedObject, iClienteBackupArquivos)
  private
    [weak]
    FParent : iClienteBackup;
    Fid: Integer;
    Fdata_ultimo_backup: TDateTime;
    Ftamanho_ultimo_backup: Int64;
    Flimite_tamanho: Integer;
    Flimite_dias: Integer;
    Fnome_arquivo: String;
    Fativo: String;
  public
    constructor Create(aParent: iClienteBackup);
    destructor Destroy; override;
    function id(aValue: String ): iClienteBackupArquivos; overload;
    function id: Integer; overload;
    function data_ultimo_backup(aValue: String ): iClienteBackupArquivos; overload;
    function data_ultimo_backup: String; overload;
    function tamanho_ultimo_backup(aValue: String ): iClienteBackupArquivos; overload;
    function tamanho_ultimo_backup: Int64; overload;
    function limite_dias(aValue: Integer): iClienteBackupArquivos; overload;
    function limite_dias: Integer ; overload;
    function limite_tamanho(aValue: Integer): iClienteBackupArquivos; overload;
    function limite_tamanho: Integer; overload;
    function nome_arquivo(aValue: String): iClienteBackupArquivos; overload;
    function nome_arquivo: String; overload;
    function ativo(aValue: String): iClienteBackupArquivos; overload;
    function ativo: String ; overload;

    function &End: iClienteBackup;
  end;

implementation

{ TClienteBackup }

constructor TClienteBackup.Create;
begin
  if (not Assigned(FListaClienteBackupArquivos)) then
    FListaClienteBackupArquivos := TList<iClienteBackupArquivos>.Create;
end;

destructor TClienteBackup.Destroy;
begin
  FreeAndNil(FListaClienteBackupArquivos);
  inherited;
end;

function TClienteBackup.ListaClienteBackupArquivos: TList<iClienteBackupArquivos>;
begin
  Result := FListaClienteBackupArquivos;
end;

class function TClienteBackup.New: iClienteBackup;
begin
  Result := Self.Create;
end;

function TClienteBackup.codigo: Integer;
begin
  Result := Fcodigo;
end;

function TClienteBackup.codigo(aValue: String): iClienteBackup;
begin
  Result := Self;
  Fcodigo := StrToIntDef(aValue, 0);
end;

function TClienteBackup.ativo(aValue: Integer): iClienteBackup;
begin
  Result := Self;
  Fativo := aValue;
end;

function TClienteBackup.ativo: String;
begin
  Result := '';
  if (Fativo = 1)  then
    Result := 'S'
  else if (Fativo = 2)  then
    Result := 'N';
end;

function TClienteBackup.nome(aValue: String): iClienteBackup;
begin
  Result := Self;
  Fnome := aValue;
end;

function TClienteBackup.nome: String;
begin
  Result := Fnome;
end;

function TClienteBackup.pasta_backup(aValue: String): iClienteBackup;
begin
  Result := Self;
  Fpasta_backup := aValue;
end;

function TClienteBackup.pasta_backup: String;
begin
  Result := Fpasta_backup;
end;

function TClienteBackup.ValidarCampos: iClienteBackup;
begin
  Result:= Self;

  if (Fcodigo < 1) then
    raise EPropertyError.Create('Favor selecionar o Cliente!');
  if (Trim(Fpasta_backup) = '') then
    raise EPropertyError.Create('Favor selecione a pasta de backup!');

  for var I := 0 to Self.FListaClienteBackupArquivos.Count -1 do
  begin
    if (Self.FListaClienteBackupArquivos[I].limite_dias < 0) and
       (Self.FListaClienteBackupArquivos[I].ativo = 'S') then
      raise EPropertyError.Create('Favor selecionar o Limite de Dias do Item: ' + IntToStr(I+1) + '!');
    if (Self.FListaClienteBackupArquivos[I].limite_tamanho < 0) and
       (Self.FListaClienteBackupArquivos[I].ativo = 'S') then
      raise EPropertyError.Create('Favor selecionar o Limite de Tamanho do Item: ' + IntToStr(I+1) + '!');
  end;
end;

function TClienteBackup.ClienteBackupArquivo(aDBGrig: TDBGrid): iClienteBackupArquivos;
begin
  if (not aDBGrig.DataSource.DataSet.IsEmpty) then
  begin
    if (not Assigned(FClienteBackupArquivos)) then
      FClienteBackupArquivos := TClienteBackupArquivos.Create(Self);

    aDBGrig.DataSource.DataSet.First;
    while (not aDBGrig.DataSource.DataSet.Eof) do
    begin
      FClienteBackupArquivos
        .limite_dias(GetPickListIndex(aDBGrig, 'limite_dias'))
        .limite_tamanho(GetPickListIndex(aDBGrig, 'limite_tamanho'));
      FListaClienteBackupArquivos.Add(FClienteBackupArquivos);
      aDBGrig.DataSource.DataSet.Next;
    end;

    Result := FListaClienteBackupArquivos.Last;
  end;
end;

function TClienteBackup.ClienteBackupArquivo(AIndex: Integer): iClienteBackupArquivos;
begin
  Result := FListaClienteBackupArquivos[AIndex];
end;

function TClienteBackup.ClienteBackupArquivo: iClienteBackupArquivos;
begin
  if (not Assigned(FClienteBackupArquivos)) then
    FClienteBackupArquivos := TClienteBackupArquivos.Create(Self);
  FListaClienteBackupArquivos.Add(FClienteBackupArquivos);
  Result := FListaClienteBackupArquivos.Last;
end;

{ TClienteBackupArquivo }

function TClienteBackupArquivos.&End: iClienteBackup;
begin
  Result := FParent;
end;

function TClienteBackupArquivos.ativo: String;
begin
  Result := Fativo;
end;

function TClienteBackupArquivos.ativo(aValue: String): iClienteBackupArquivos;
begin
  Result := Self;
  Fativo := aValue;
end;

constructor TClienteBackupArquivos.Create(aParent: iClienteBackup);
begin
  FParent := aParent;
end;

destructor TClienteBackupArquivos.Destroy;
begin

  inherited;
end;

function TClienteBackupArquivos.data_ultimo_backup(aValue: String): iClienteBackupArquivos;
begin
  Result := Self;
  Fdata_ultimo_backup := StrToDateTime(aValue);
end;

function TClienteBackupArquivos.limite_dias(aValue: Integer): iClienteBackupArquivos;
begin
  Result := Self;
  Flimite_dias := aValue;
end;

function TClienteBackupArquivos.limite_tamanho(aValue: Integer): iClienteBackupArquivos;
begin
  Result := Self;
  Flimite_tamanho := aValue;
end;

function TClienteBackupArquivos.tamanho_ultimo_backup(aValue: String): iClienteBackupArquivos;
begin
  Result := Self;
  Ftamanho_ultimo_backup := StrToInt(aValue);
end;

function TClienteBackupArquivos.data_ultimo_backup: String;
begin
  Result := DateToStr(Fdata_ultimo_backup);
end;

function TClienteBackupArquivos.id(aValue: String): iClienteBackupArquivos;
begin
  Result := Self;
  Fid := StrToInt(aValue);
end;

function TClienteBackupArquivos.id: Integer;
begin
  Result := Fid;
end;

function TClienteBackupArquivos.tamanho_ultimo_backup: Int64;
begin
  Result := Ftamanho_ultimo_backup;
end;

function TClienteBackupArquivos.limite_dias: Integer;
begin
  Result := Flimite_dias;
end;

function TClienteBackupArquivos.limite_tamanho: Integer;
begin
  Result := Flimite_tamanho;
end;

function TClienteBackupArquivos.nome_arquivo: String;
begin
  Result := Fnome_arquivo;
end;

function TClienteBackupArquivos.nome_arquivo(aValue: String): iClienteBackupArquivos;
begin
  Result := Self;
  Fnome_arquivo := aValue;
end;

end.
