unit App.Util;

interface

uses
  SysUtils, Vcl.Grids,ShlObj, Winapi.Windows, System.Classes, RTTI, Vcl.Forms, Vcl.StdCtrls, FileCtrl,
  FireDAC.Comp.Client, DateUtils, Data.DB, DMDados, Vcl.DBGrids, ShellAPI, Vcl.DBCtrls,
  Vcl.Graphics,  System.IniFiles, Vcl.Dialogs, App.Enums, Vcl.ExtCtrls;

procedure SetLegendaCorDBGridTelaPrincipal(aDBGrid: TDBGrid; const aRect: TRect; aDataCol: Integer; aColumn: TColumn; aState: TGridDrawState);
procedure SetCorDBInativado(aDBGrid: TDBGrid; const aRect: TRect; aDataCol: Integer; aColumn: TColumn; aState: TGridDrawState);
procedure LimparCampos(aForm: TForm; aPesquisa: Boolean = False);
procedure SelecionarDiretorio(aSender: TObject);
procedure AbrirLocalBancoDados(aDBGrid: TDBGrid);
procedure InserirDBCheckBoxNoGrid(aDBGrid: TDBGrid; const aRect: TRect; aColumn: TColumn);
procedure SetRegraDigitoLimites(aDBGrid : TDBGrid; var aKey: char);
procedure SetRegraDBCheckSemFoco(aDBGrid : TDBGrid; aCampo: String);
procedure SetRegraMarcarDesmarcarDBCheck(aDBGrid: TDBGrid; var aKey: Word);
procedure CarregarConfigsIni(var aServidor: String; var aPorta: Integer; var aBancoDados, aUsuario, aSenha: String);
function RemoverPrefixoComponente(aComponent: TComponent): String;
function GetQtdeBackupDiferentes(aDiretorio: String): Integer;
function GetNomeUltimoBackup(aOrdem:Integer; aDiretorio: String): String;
function GetDataUltimoBackup(aDataset: TFDQuery): TDateTime;
function GetTamanhoUltimoBackup(aDataset: TFDQuery): Int64;
function TransformarDoArquivoLidoEmDataLegivel(FileTime : TFileTime) : TDateTime;
function UltrapassouLimiteDias(aDataset: TDataset): Boolean;
function UltrapassouLimiteTamanho(aDataset: TDataset): Boolean;
function ConverterAtivoStringParaInteiro(aValue: String): Integer;
function ColumnIndexByName(aDBGrid : TDBGrid; const aName : String) : Integer;
function GetPickListIndex(aDBGrid : TDBGrid; const aName : String): Integer;

implementation

procedure SelecionarDiretorio(aSender: TObject);
var
  LDir: String;
begin
  if (SelectDirectory(LDir, [sdAllowCreate, sdPerformCreate, sdPrompt], 500)) then
    TCustomEdit(aSender).Text := LDir;
end;

procedure LimparCampos(aForm: TForm; aPesquisa: Boolean = False);
var
  LComponent: TComponent;
begin
  LComponent := nil;
  for var I := 0 to aForm.ComponentCount - 1 do
  begin
    if (aForm.Components[I] is TCustomEdit) then
    begin
      if (not aPesquisa) then
        TCustomEdit(aForm.Components[I]).Clear;
      if (RemoverPrefixoComponente(aForm.Components[I]) = 'CodCliente') then
        LComponent := aForm.Components[I];
    end;
    if (aForm.Components[I] is TCustomComboBox) then
      if (aPesquisa) then
      begin
        if (RemoverPrefixoComponente(aForm.Components[I]) = 'Ativo') then
          TCustomComboBox(aForm.Components[I]).ItemIndex := 1
        else
          TCustomComboBox(aForm.Components[I]).ItemIndex := 0;
      end
      else
        TCustomComboBox(aForm.Components[I]).ItemIndex := -1;

    if (aForm.Components[I] is TDBGrid) and
       (TDBGrid(aForm.Components[I]).DataSource <> nil) then
      TDBGrid(aForm.Components[I]).DataSource.DataSet.Close;
  end;

  if (LComponent <> nil) then
  begin
    TCustomEdit(LComponent).SetFocus;
    TCustomEdit(LComponent).SelectAll;
  end;
end;

function RemoverPrefixoComponente(aComponent: TComponent): String;
var
  LNovoValor: String;
begin
  LNovoValor := aComponent.Name;
  Delete(LNovoValor, 1, 3);
  Result := LNovoValor;
end;

function GetDataUltimoBackup(aDataset: TFDQuery): TDateTime;
var
  LF: TSearchRec;
  LRet: Integer;
begin
  try
    Result := 0;
    LRet := FindFirst(aDataset.FieldByName('pasta_backup').AsString + '\' +
                      aDataset.FieldByName('nome_arquivo').AsString, faAnyFile, LF);
    if (LRet = 0) then
      Result := TransformarDoArquivoLidoEmDataLegivel(LF.FindData.ftCreationTime);
  except
    on E: Exception do
    begin
      raise Exception.Create('Não foi possível sincronizar as datas dos ultimos backups!');
    end;
  end;
end;

function GetTamanhoUltimoBackup(aDataset: TFDQuery): Int64;
var
  LF: TSearchRec;
  LRet: Integer;
begin
  try
    Result := 0;
    LRet := FindFirst(aDataset.FieldByName('pasta_backup').AsString + '\' +
                      aDataset.FieldByName('nome_arquivo').AsString, faAnyFile, LF);
    if (LRet = 0) then
      Result := (Int64(LF.FindData.nFileSizeHigh) shl Int64(32) + Int64(LF.FindData.nFileSizeLow));
  except
    on E: Exception do
    begin
      raise Exception.Create('Não foi possível sincronizar os tamanhos dos ultimos backups!');
    end;
  end;
end;

function GetNomeUltimoBackup(aOrdem:Integer; aDiretorio: String): String;
var
  LF: TSearchRec;
  LRet: Integer;
begin
  try
    LRet := FindFirst(aDiretorio+'\\*.backup', faAnyFile, LF);
    Result := '';

    if (LRet = 0) then
    begin
      if (aOrdem = 1) then
        Exit(LF.Name);
      for var I := 2 to aOrdem do
      begin
        FindNext(LF);
        if (LRet = 0) and (aOrdem = I) then
        begin
          Result := LF.Name;
          Exit;
        end;
      end;
    end;
  except
    on E: Exception do
    begin
      raise Exception.Create('Não foi possível pegar o nome do ultimo backup!');
    end;
  end;
end;

function GetQtdeBackupDiferentes(aDiretorio: String): Integer;
var
  LF: TSearchRec;
  LRet: Integer;
  LQtdeBancosBkp : Integer;
begin
  try
    LQtdeBancosBkp := 0;
    LRet := FindFirst(aDiretorio + '\\*.backup', faAnyFile, LF);
    if (LRet = 0) then
      Inc(LQtdeBancosBkp)
    else
      Exit(0);

    repeat
      LRet := FindNext(LF);
      if (LRet = 0) then
        Inc(LQtdeBancosBkp)
    until (LRet <> 0);
    Result := LQtdeBancosBkp;
  except
    on E: Exception do
    begin
      raise Exception.Create('Não foi possível recuperar a quantia de backups diferentes na pasta!');
    end;
  end;
end;

function TransformarDoArquivoLidoEmDataLegivel(FileTime : tFileTime) : tDateTime; overload;
var
  LLocalTime : tFileTime;
  LDOSFileTime : DWord;
begin
  FileTimeToLocalFileTime(FileTime, LLocalTime);
  FileTimeToDosDateTime(LLocalTime,  LongRec(LDOSFileTime).Hi,LongRec(LDOSFileTime).Lo);
  Result := FileDateToDateTime(LDOSFileTime);
end;

function UltrapassouLimiteDias(aDataset: TDataset): Boolean;
var
  LF: TSearchRec;
  LRet: Integer;
  LDataUltimoBD: TDatetime;
begin
  Result := False;
  LRet:= FindFirst(aDataSet.FieldByName('pasta_backup').AsString + '\\' + aDataSet.FieldByName('nome_arquivo').AsString, faAnyFile, LF);
  if LRet > 0 then
    Exit(True);

  LDataUltimoBD := TransformarDoArquivoLidoEmDataLegivel(LF.FindData.ftCreationTime);
  if (DaysBetween(DataModuleDados.DataServidor(True), LDataUltimoBD) > aDataSet.FieldByName('limite_dias').AsInteger) and
     (Dateutils.DayOfTheWeek(DataModuleDados.DataServidor(True)) <> DateUtils.DaySunday) then
    Result := True;
end;

function UltrapassouLimiteTamanho(aDataset: TDataset): Boolean;
var
  LF:TSearchRec;
  LF2: TSearchRec;
  LRet:Integer;
  LRet2: Integer;
  LTamanhoBkp: Int64;
  LTamanhoBkp2: Int64;
  LDiferencaTamanhoBkp: Int64;
begin
  try
    Result := False;
    LRet     := FindFirst(aDataSet.FieldByName('pasta_backup').AsString + '\\' + aDataSet.FieldByName('nome_arquivo').AsString, faAnyFile, LF);
    LRet2    := FindFirst(aDataSet.FieldByName('pasta_backup').AsString + '\\' + aDataSet.FieldByName('nome_arquivo').AsString + '.2', faAnyFile, LF2);
    if (LRet > 0) and (LRet2 > 0) then
      Exit(True);

    LTamanhoBkp          := (Int64(LF.FindData.nFileSizeHigh) shl Int64(32) + Int64(LF.FindData.nFileSizeLow));
    LTamanhoBkp2         := (Int64(LF2.FindData.nFileSizeHigh) shl Int64(32) + Int64(LF2.FindData.nFileSizeLow));
    LDiferencaTamanhoBkp := Round((LTamanhoBkp - LTamanhoBkp2) / 1000);
    if (LDiferencaTamanhoBkp <= aDataSet.FieldByName('limite_tamanho').Asinteger) then
      Exit(True);
  except
    on E: Exception do
    begin
      raise Exception.Create('Não foi possível verificar a diferença de tamanho dos backups!');
    end;
  end;
end;

procedure AbrirLocalBancoDados(aDBGrid: TDBGrid);
var
  LCaminho : string;
begin
  LCaminho := ' /e,/root,"' + aDBGrid.DataSource.DataSet.FieldByName('pasta_backup').AsString + '"';
  ShellExecute(Application.Handle, PChar('open'), PChar('explorer.exe'), PChar(LCaminho), nil, SW_NORMAL);
end;

procedure SetCorDBInativado(aDBGrid: TDBGrid; const aRect: TRect; aDataCol: Integer;
  aColumn: TColumn; aState: TGridDrawState);
begin
 If (aDBGrid.DataSource.DataSet.FieldByName('monitorar_arquivo').AsString = 'N') then
    aDBGrid.Canvas.Font.Color := clRed;
  aDBGrid.DefaultDrawColumnCell(aRect, aDataCol, aColumn, aState);
end;

procedure SetLegendaCorDBGridTelaPrincipal(aDBGrid: TDBGrid; const aRect: TRect; aDataCol: Integer;
  aColumn: TColumn; aState: TGridDrawState);
begin
  if not Odd(aDBGrid.DataSource.Dataset.RecNo) then
  begin
    if not(gdselected in aState) then
    begin
      aDBGrid.Canvas.Brush.Color := $00FFEFDF;
      aDBGrid.Canvas.FillRect(aRect);
      aDBGrid.DefaultDrawDataCell(aRect, aColumn.Field, aState);
    end;
  end;
  if (gdselected in aState) then
  begin
    aDBGrid.Canvas.Brush.Color := $00FF6F6F;
    aDBGrid.Canvas.Font.Style := [fsBold];
    aDBGrid.Canvas.FillRect(aRect);
    aDBGrid.DefaultDrawDataCell(aRect, aColumn.Field, aState);
  end;

  If (UltrapassouLimiteDias(aDBGrid.DataSource.DataSet)) then
    aDBGrid.Canvas.Font.Color := clRed
  else if (UltrapassouLimiteTamanho(aDBGrid.DataSource.DataSet)) then
    aDBGrid.Canvas.Font.Color := $000076EC;

  aDBGrid.DefaultDrawColumnCell(aRect, aDataCol, aColumn, aState);
end;

function ConverterAtivoStringParaInteiro(aValue: String): Integer;
begin
  if (aValue = 'S') then
    Result := 0
  else if (aValue = 'N') then
    Result := 1
  else
    Result := -1;
end;

procedure InserirDBCheckBoxNoGrid(aDBGrid: TDBGrid; const aRect: TRect; aColumn: TColumn);
var
  Check: Integer;
  R: TRect;
begin
  if (aDBGrid.DataSource.Dataset.IsEmpty) then
    Exit;
  if aColumn.FieldName = 'ativo' then
  begin
    aDBGrid.Canvas.FillRect(aRect);
    if (aDBGrid.DataSource.Dataset.FieldByName('ativo').AsString = 'S') then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := aRect;
    InflateRect(R, -2, -2);
    DrawFrameControl(aDBGrid.Canvas.Handle, R, DFC_BUTTON,
      DFCS_BUTTONCHECK or Check);
  end;
end;

procedure SetRegraDBCheckSemFoco(aDBGrid : TDBGrid; aCampo: String);
begin
  if (not aDBGrid.DataSource.DataSet.IsEmpty) and
     (aDBGrid.SelectedField.FieldName = aCampo) then
    aDBGrid.SelectedIndex := 1;
end;

procedure SetRegraMarcarDesmarcarDBCheck(aDBGrid: TDBGrid; var aKey: Word);
begin
  if (aKey = VK_SPACE ) then
  begin
    if ((aDBGrid as TDBGrid).DataSource.Dataset.IsEmpty) then
      Exit;
    aDBGrid.DataSource.Dataset.FieldByName('ativo').ReadOnly := False;
    aDBGrid.DataSource.Dataset.Edit;
    aDBGrid.DataSource.Dataset.FieldByName('ativo').AsString :=
      TUtils.IIF<String>(aDBGrid.DataSource.Dataset.FieldByName('ativo').AsString = 'S', 'N', 'S');
    aDBGrid.DataSource.Dataset.Post;
    aDBGrid.DataSource.Dataset.FieldByName('ativo').ReadOnly := True;
  end;
end;

procedure SetRegraDigitoLimites(aDBGrid : TDBGrid; var aKey: char);
var
  LIndexLimimiteDias: Integer;
  LIndexLimimiteTamanho: Integer;
begin
  LIndexLimimiteDias      := ColumnIndexByName(aDBGrid, 'limite_dias');
  LIndexLimimiteTamanho   := ColumnIndexByName(aDBGrid, 'limite_tamanho');

  if (aDBGrid.SelectedIndex = LIndexLimimiteDias) or (aDBGrid.SelectedIndex = LIndexLimimiteTamanho) then
    aKey := #0;
end;

function ColumnIndexByName(aDBGrid : TDBGrid; const aName : String) : Integer;
begin
  Result := -1;
  for var I := 0 to aDBGrid.Columns.Count - 1 do
  begin
    if (aDBGrid.Columns[I].Field <> Nil) and (CompareText(aDBGrid.Columns[I].FieldName, AName) = 0) then
      Exit(I);
  end;
end;

function GetPickListIndex(aDBGrid : TDBGrid; const aName : String): Integer;
var
  LColumnIndex: Integer;
  LValorColuna: String;
begin
  LColumnIndex := ColumnIndexByName(aDBGrid, aName);
  LValorColuna := TUtils.CompletarZeros(aDBGrid.DataSource.DataSet.FieldByName(aName).AsString, 2);
  Result := aDBGrid.Columns[LColumnIndex].PickList.IndexOf(LValorColuna);
end;

procedure CarregarConfigsIni(var aServidor: String; var aPorta: Integer; var aBancoDados, aUsuario, aSenha: String);
var
  LArquivoIni: TIniFile;
begin
  if not FileExists(GetCurrentDir + '\Config.INI') then
    Exit;
  LArquivoIni   := TIniFile.Create(GetCurrentDir + '\Config.INI');
  try
    aServidor   := LArquivoIni.ReadString('Conexao', 'Servidor', aServidor);
    aPorta      := LArquivoIni.ReadInteger('Conexao', 'Porta', aPorta);
    aBancoDados := LArquivoIni.ReadString('Conexao', 'BancoDados', aBancoDados);
    aUsuario    := LArquivoIni.ReadString('Conexao', 'Usuario', aUsuario);
    aSenha      := TUtils.DecryptPasswordDB(LArquivoIni.ReadString('Conexao', 'Senha', TUtils.EncryptPasswordDB(aSenha)));
  finally
    LArquivoIni.Free;
  end;
end;

end.
