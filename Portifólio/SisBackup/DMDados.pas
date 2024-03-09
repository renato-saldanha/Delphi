unit DMDados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db, DateUtils,
  DBClient, Provider, StdCtrls, MidasLib, IniFiles, Registry, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.PG, FireDAC.Phys.PGDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TDataModuleDados = class(TDataModule)
    DBConnection: TFDConnection;
    QryCadClienteBackup: TFDQuery;
    QryConsClienteBackup: TFDQuery;
    QrySincClienteBackupArquivo: TFDQuery;
    QryCadClienteBackupArquivo: TFDQuery;
    QryConsClienteBackupArquivos: TFDQuery;
    QryGeral: TFDQuery;
    WaitCursor: TFDGUIxWaitCursor;
    PGDriver: TFDPhysPgDriverLink;
    procedure QrySincClienteBackupArquivoAfterOpen(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure QryCadClienteBackupArquivoAfterOpen(DataSet: TDataSet);
    procedure QryConsClienteBackupAfterOpen(DataSet: TDataSet);
  private
    procedure QueryError(aForm, AInitiator: TObject; var AException: Exception);
    { Private declarations }
  public
    { Public declarations }
    function DataServidor(ASomenteData: Boolean): TDateTime;
    function ConfiguraConexao: Boolean;

    procedure ConfigurarQueries;
    procedure CarregarEncodingBancoDados(ABancoDados: String);
    procedure QryConsClienteBackupCodClienteGetText(ASender: TField; var AText: string; ADisplayText: Boolean);
    procedure QryConsClienteBackupTamanhoUltimoBackupGetText(ASender: TField; var AText: string; ADisplayText: Boolean);
  end;

var
  DataModuleDados: TDataModuleDados;

implementation

uses BibVariavel, App.Util;

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

procedure TDataModuleDados.DataModuleCreate(Sender: TObject);
begin
  DBConnection.Connected := False;
end;

function TDataModuleDados.DataServidor(ASomenteData: Boolean): TDateTime;
begin
  Result := DBConnection.ExecSQLScalar('SELECT current_timestamp');
  Result := StrToDateTime(FormatDateTime('dd/MM/yyyy HH:mm:ss', Result));
  if ASomenteData then
    Result := DateOf(Result);
end;

function TDataModuleDados.ConfiguraConexao: Boolean;
var
  LSecao: String;
  LServidor: String;
  LPorta: Integer;
  LBancoDados: String;
  LUsuario: String;
  LSenha: String;
begin
  try
    Result      := False;
    LSecao      := 'GerBkp - ' + '127.0.0.1' + '/' + GetEnvironmentVariable('SESSIONNAME').ToUpper;
    LServidor   := 'localhost';
    LPorta      := 5432;
    LBancoDados := '';
    LUsuario    := 'postgres';
    LSenha      := '123123';
    CarregarConfigsIni(LServidor, LPorta, LBancoDados, LUsuario, LSenha);

    DBConnection.Params.Clear;
    DBConnection.Params.Add('DriverID=PG');
    DBConnection.Params.Add('Server=' + LServidor);
    DBConnection.Params.Add('Port=' + LPorta.ToString);
    DBConnection.Params.Add('Database=' + LBancoDados);
    DBConnection.Params.Add('User_Name=' + LUsuario);
    DBConnection.Params.Add('Password=' + LSenha);
    DBConnection.Params.Add('ApplicationName=' + LSecao);
    DBConnection.Params.Add('MonitorBy=mbRemote');
    DBConnection.Params.Add('MonitorByInitial=True');
    DBConnection.Connected := True;
    DBConnection.ConnectionIntf.Tracing := True;
    Self.CarregarEncodingBancoDados(LBancoDados);
    Self.ConfigurarQueries;
    Result := True;
  except on E: Exception do
    begin
      Result := False;
      ShowMessage('Favor verificar as configurações de Rede!');
    end;
  end;
end;

procedure TDataModuleDados.ConfigurarQueries;
begin
  for var I := 0 to Pred(Self.ComponentCount) do
  begin
    if Self.Components[I] is TFDQuery then
      TFDQuery(Self.Components[I]).Connection := DBConnection;
  end;
end;

procedure TDataModuleDados.QueryError(aForm, AInitiator: TObject; var AException: Exception);
begin
  ShowMessage(AException.Message);
end;

procedure TDataModuleDados.CarregarEncodingBancoDados(ABancoDados: String);
begin
  VPEncodingBancoDados := DBConnection.ExecSQLScalar(
    'SELECT pg_encoding_to_char(encoding) FROM pg_database WHERE datname = :nome_banco',
    [ABancoDados],
    [ftString]
  );
end;


procedure TDataModuleDados.QryCadClienteBackupArquivoAfterOpen(DataSet: TDataSet);
begin
  DataSet.FieldByName('nome_arquivo').ReadOnly := False;
  DataSet.FieldByName('ordem').ReadOnly        := False;
end;

procedure TDataModuleDados.QryConsClienteBackupAfterOpen(DataSet: TDataSet);
begin
  DataSet.FieldByName('cod_cliente').OnGetText           := Self.QryConsClienteBackupCodClienteGetText;
  DataSet.FieldByName('tamanho_ultimo_backup').OnGetText := Self.QryConsClienteBackupTamanhoUltimoBackupGetText;
end;

procedure TDataModuleDados.QryConsClienteBackupCodClienteGetText(ASender: TField; var AText: string;
  ADisplayText: Boolean);
begin
  AText := Format('%6.6d', [ASender.AsInteger]);
end;

procedure TDataModuleDados.QryConsClienteBackupTamanhoUltimoBackupGetText(ASender: TField; var AText: string;
  ADisplayText: Boolean);
const
  TAMANHO_KB = 1024;
  TAMANHO_MB = TAMANHO_KB * TAMANHO_KB;
  TAMANHO_GB = TAMANHO_KB * TAMANHO_MB;
  TAMANHO_TB = Int64(TAMANHO_KB) * TAMANHO_GB;
begin
  if ASender.AsLargeInt < TAMANHO_KB then
    AText := Format('%d bytes', [ASender.AsLargeInt])
  else if ASender.AsLargeInt < TAMANHO_MB then
    AText := Format('%.2n KB', [ASender.AsLargeInt / TAMANHO_KB])
  else if ASender.AsLargeInt < TAMANHO_GB then
    AText := Format('%.2n MB', [ASender.AsLargeInt / TAMANHO_MB])
  else if ASender.AsLargeInt < TAMANHO_TB then
    AText := Format('%.2n GB', [ASender.AsLargeInt / TAMANHO_GB])
  else
    AText := Format('%.2n TB', [ASender.AsLargeInt / TAMANHO_TB]);
end;

procedure TDataModuleDados.QrySincClienteBackupArquivoAfterOpen(DataSet: TDataSet);
begin
  DataSet.FieldByName('nome_arquivo').ReadOnly := False;
end;

end.
