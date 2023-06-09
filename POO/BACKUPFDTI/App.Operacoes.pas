unit App.Operacoes;

interface

uses
  App.Interfaces,  System.Types, Vcl.DBGrids, FireDAC.Stan.Param, TypInfo, Vcl.StdCtrls, Vcl.Forms, System.SysUtils,
  System.UITypes, Vcl.Dialogs, Data.DB, FireDAC.Comp.Client, System.Classes;

type
  TBackupOperacoes = class(TinterfacedObject, iBackupOperacoes)
  private
    [weak]
    FParent: iBackupController;
  public
    class function New(aParent: iBackupController): iBackupOperacoes;
    constructor Create(aParent: iBackupController);
    destructor Destroy; override;

    function PesquisarCliente(aEdtCodCliente: TCustomEdit): iBackupOperacoes;
    function CarregarBancosDataset(aCodCliente, aDiretorio : TCustomEdit): iBackupOperacoes;
    function FecharConexao(aForm: TForm): iBackupOperacoes;
    function FiltrarClienteBackup(ACodigo: TCustomEdit; aForm: TForm): iBackupOperacoes; overload;
    function PesquisarClientesBackup(aParent: iClienteBackup): iBackupOperacoes;
    function SincronizarListaClientesBackup: iBackupOperacoes;
    function GravarClienteBackup(aClienteBackup: iClienteBackup): iBackupOperacoes;
    function InativarClienteBackup: iBackupOperacoes;
    function DesabilitarBancoDoConsultor: iBackupOperacoes;
    function CalcularTotais(aDBGrid: TDBGrid): iBackupOperacoes;

    function &End: iBackupController;
  end;

implementation

uses DMDados, BibVariavel, BibPesquisa, App.Util, App.Enums, Fontdata.Utils, Fontdata.MessageDialog, Fontdata.BindForm,
  Model.ClienteBackup;

{ TBackupOperacoes }

constructor TBackupOperacoes.Create(aParent: iBackupController);
begin
  FParent := aParent;
end;

destructor TBackupOperacoes.Destroy;
begin
  inherited;
end;

class function TBackupOperacoes.New(aParent: iBackupController): iBackupOperacoes;
begin
  Result := Self.Create(aParent);
end;

function TBackupOperacoes.FiltrarClienteBackup(aCodigo: TCustomEdit; aForm: TForm): iBackupOperacoes;
begin
  Result := Self;
  try
    if (StrToIntDef(aCodigo.Text, 0) > 0) then
    begin
      aCodigo.Text := TUtils.CompletarZeros(aCodigo.Text, 6);
      DataModuleDados.DBConnection.Connected := True;
      DataModuleDados.QryGeral.Close;
      DataModuleDados.QryGeral.SQL.Clear;
      DataModuleDados.QryGeral.SQL.Add(' select c.codigo,                                                                ' );
      DataModuleDados.QryGeral.SQL.Add('        c.nome,                                                                  ' );
      DataModuleDados.QryGeral.SQL.Add('        cba.limite_dias,                                                         ' );
      DataModuleDados.QryGeral.SQL.Add('        cba.limite_tamanho,                                                      ' );
      DataModuleDados.QryGeral.SQL.Add('        cb.pasta_backup                                                          ' );
      DataModuleDados.QryGeral.SQL.Add(' from clientes c                                                                 ' );
      DataModuleDados.QryGeral.SQL.Add(' left join fontdata.clientes_backup cb on cb.cod_cliente  = c.codigo             ' );
      DataModuleDados.QryGeral.SQL.Add(' left join fontdata.clientes_backup_arquivos cba on cba.cod_cliente  = c.codigo  ' );
      DataModuleDados.QryGeral.SQL.Add(' where c.codigo = :cod_cliente                                                   ' );
      DataModuleDados.QryGeral.ParamByName('cod_cliente').AsInteger := StrToInt(aCodigo.Text);
      DataModuleDados.QryGeral.Open;
      TBindForm.BindDataSetToForm(DataModuleDados.QryGeral, aForm);
    end;
  except on E: Exception do
    TMessageDialog.Error('N�o foi poss�vel filtrar o Nome do Cliente.' + sLineBreak + E.Message);
  end;
end;

function TBackupOperacoes.PesquisarClientesBackup(aParent: iClienteBackup): iBackupOperacoes;
var
  LSQLWhere: String;
begin
  Result := Self;
  try
    if (aParent.codigo > 0) then
      LSQLWhere := ' and cba.cod_cliente = ' + IntToStr(aParent.codigo);

    if (aParent.ativo <> '') then
      LSQLWhere := LSQLWhere + ' and cba.ativo = ' + QuotedStr(aParent.ativo);

    if aParent.ClienteBackupArquivo(0).limite_dias > 0 then
      LSQLWhere := LSQLWhere + ' and cba.limite_dias <= ' + IntToStr(aParent.ClienteBackupArquivo(0).limite_dias);

    if aParent.ClienteBackupArquivo(0).limite_tamanho > 0 then
      LSQLWhere := LSQLWhere + ' AND cba.limite_tamanho <= ' + IntToStr(aParent.ClienteBackupArquivo(0).limite_tamanho);

    DataModuleDados.QryConsClienteBackup.Close;
    DataModuleDados.QryConsClienteBackup.MacroByName('Macro').AsRaw := LSQLWhere;
    DataModuleDados.QryConsClienteBackup.Open;
  except
    on E: Exception do
      TMessageDialog.Error('Erro ao carregar a lista de ClientesBackup.' + sLineBreak + E.Message);
  end;
end;

function TBackupOperacoes.PesquisarCliente(aEdtCodCliente: TCustomEdit): iBackupOperacoes;
begin
  Pesquisa2(
    'Clientes',
    'CLIENTES',
    ['clientes.codigo', 'clientes.nome', 'clientes.fantasia', 'clientes.ativo'],
    ['Codigo', 'Nome', 'Fantasia', 'Ativo'],
    '',
    'clientes.ativo = ''S'' ',
    ['clientes.nome', 'clientes.fantasia'],
    ['CODIGO'],
    [aEdtCodCliente],
    ''
  );
end;

function TBackupOperacoes.SincronizarListaClientesBackup: iBackupOperacoes;
begin
  Result := Self;
  try
    DataModuleDados.QryConsClienteBackup.Close;
    DataModuleDados.QryConsClienteBackup.Open;
    DataModuleDados.QryConsClienteBackup.First;
    DataModuleDados.QryConsClienteBackup.DisableControls;
    DataModuleDados.DBConnection.StartTransaction;

    while not DataModuleDados.QryConsClienteBackup.Eof do
    begin
      DataModuleDados.QrySincClienteBackupArquivo.Close;
      DataModuleDados.QrySincClienteBackupArquivo.MacroByName('Macro').AsRaw := ' AND cba.id = ' +
        DataModuleDados.QryConsClienteBackup.FieldByName('id').AsString;
      DataModuleDados.QrySincClienteBackupArquivo.Open;

      case TTipoPersistencia(not DataModuleDados.QrySincClienteBackupArquivo.IsEmpty) of
        tpInsert: DataModuleDados.QrySincClienteBackupArquivo.Append;
        tpUpdate: DataModuleDados.QrySincClienteBackupArquivo.Edit;
      end;
      DataModuleDados.QrySincClienteBackupArquivo.FieldByName('data_ultimo_backup').AsDateTime :=
         GetDataUltimoBackup(DataModuleDados.QryConsClienteBackup);
      DataModuleDados.QrySincClienteBackupArquivo.FieldByName('tamanho_ultimo_backup').AsLargeInt :=
         GetTamanhoUltimoBackup(DataModuleDados.QryConsClienteBackup);
      DataModuleDados.QrySincClienteBackupArquivo.Post;

      if (DataModuleDados.QrySincClienteBackupArquivo.ApplyUpdates(-1) > 0) then
        raise Exception.Create('Erro ao sincronizar os dados');
      DataModuleDados.QryConsClienteBackup.Next;
    end;

    DataModuleDados.DBConnection.Commit;
    DataModuleDados.QryConsClienteBackup.EnableControls;
    DataModuleDados.QryConsClienteBackup.Close;
    TMessageDialog.Info('Registros sincronizados!');
  except
    on E: Exception do
    begin
      DataModuleDados.DBConnection.Rollback;
      DataModuleDados.QrySincClienteBackupArquivo.Cancel;
      DataModuleDados.QryConsClienteBackup.Cancel;
      TMessageDialog.Error('Erro ao carregar a lista de ClientesBackup.' + sLineBreak + E.Message);
    end;
  end;
end;

function TBackupOperacoes.GravarClienteBackup(aClienteBackup: iClienteBackup): iBackupOperacoes;
begin
  Result := Self;
  try
    aClienteBackup.ValidarCampos;
    DataModuleDados.QryCadClienteBackup.Close;
    DataModuleDados.QryCadClienteBackup.ParamByName('cod_cliente').AsInteger := aClienteBackup.codigo;
    DataModuleDados.QryCadClienteBackup.Open;

    DataModuleDados.DBConnection.StartTransaction;
    DataModuleDados.QryCadClienteBackup.Edit;
    DataModuleDados.QryCadClienteBackup.FieldByName('cod_cliente').AsInteger := aClienteBackup.codigo;
    DataModuleDados.QryCadClienteBackup.FieldByName('pasta_backup').AsString := aClienteBackup.pasta_backup;
    DataModuleDados.QryCadClienteBackup.Post;

    if (DataModuleDados.QryCadClienteBackup.ApplyUpdates(-1) > 0) then
      raise Exception.Create('N�o foi poss�vel Gravar os dados de ClienteBackup');

    if (DataModuleDados.QryCadClienteBackupArquivo.ApplyUpdates(-1) > 0) then
      raise Exception.Create('N�o foi poss�vel Gravar os dados de ClienteBackupArquivo');

    DataModuleDados.DBConnection.Commit;
    TMessageDialog.Info('Resgistros salvos!');
  except
    on E: EPropertyError do
      TMessageDialog.Error(E.Message);
    on E: Exception do
    begin
      DataModuleDados.QryCadClienteBackup.Cancel;
      DataModuleDados.QryCadClienteBackupArquivo.Cancel;
      DataModuleDados.DBConnection.Rollback;
      TMessageDialog.Error(E.Message);
    end;

  end;
end;

function TBackupOperacoes.InativarClienteBackup: iBackupOperacoes;
begin
  try
    Result := Self;
    if (not DataModuleDados.QryCadClienteBackup.IsEmpty) then
    begin
      DataModuleDados.DBConnection.StartTransaction;
      DataModuleDados.QryCadClienteBackup.Edit;
      DataModuleDados.QryCadClienteBackup.FieldByName('ativo').AsString := 'N';
      DataModuleDados.QryCadClienteBackup.Post;
      if (DataModuleDados.QryCadClienteBackup.ApplyUpdates(-1) > 0) then
      begin
        DataModuleDados.QryCadClienteBackup.Cancel;
        DataModuleDados.DBConnection.Rollback;
        raise Exception.Create('N�o foi poss�vel Inativar os dados de ClienteBackup');
      end;
      TMessageDialog.Info('Inativado com sucesso!');
      DataModuleDados.DBConnection.Commit;
    end;
  except on E: Exception do
    TMessageDialog.Error('N�o foi poss�vel Inativar o Cliente!' + sLineBreak + E.Message);
  end;
end;

function TBackupOperacoes.CalcularTotais(aDBGrid: TDBGrid): iBackupOperacoes;
begin
  try
    Result := Self;
    aDBGrid.DataSource.DataSet.First;
    aDBGrid.DataSource.DataSet.DisableControls;
    while not aDBGrid.DataSource.DataSet.Eof do
    begin
      If (UltrapassouLimiteDias(aDBGrid.DataSource.DataSet)) then
        FParent.Parametros.QtdeAtrasado(StrToInt(FParent.Parametros.QtdeAtrasado) + 1)
      else if (UltrapassouLimiteTamanho(aDBGrid.DataSource.DataSet)) then
        FParent.Parametros.QtdeTamanhoDiferente(StrToInt(FParent.Parametros.QtdeTamanhoDiferente) + 1)
      else
        FParent.Parametros.QtdeNormal(StrToInt(FParent.Parametros.QtdeNormal) + 1);

      FParent.Parametros.TotalGeral(StrToInt(FParent.Parametros.QtdeNormal) +
                                    StrToInt(FParent.Parametros.QtdeTamanhoDiferente) +
                                    StrToInt(FParent.Parametros.QtdeAtrasado));
      aDBGrid.DataSource.DataSet.Next;
    end;
    aDBGrid.DataSource.DataSet.EnableControls;
    aDBGrid.DataSource.DataSet.First;

    if (FParent.Parametros.DisplaysValidos) then
    begin
      FParent.Parametros.DisplayQtdeNormal()(FParent.Parametros.QtdeNormal);
      FParent.Parametros.DisplayQtdeAtrasado()(FParent.Parametros.QtdeAtrasado);
      FParent.Parametros.DisplayQtdeTamanhoDiferente()(FParent.Parametros.QtdeTamanhoDiferente);
      FParent.Parametros.DisplayTotalGeral()(FParent.Parametros.TotalGeral);
    end;
  except on E: Exception do
    TMessageDialog.Error('Ocorreu um erro ao Calcular os Totais!' + sLineBreak + E.Message);
  end;
end;

function TBackupOperacoes.CarregarBancosDataset(aCodCliente, aDiretorio : TCustomEdit): iBackupOperacoes;
var
  LQtdeBancosPasta: Integer;
begin
  try
    if (StrToIntDef(aCodCliente.Text, 0) > 0)  and
       (DataModuleDados.QryConsClienteBackupArquivos.State in [dsInactive, dsBrowse]) then
    begin
      LQtdeBancosPasta := GetQtdeBackupDiferentes(aDiretorio.Text);

      DataModuleDados.QryCadClienteBackup.Close;
      DataModuleDados.QryCadClienteBackup.ParamByName('cod_cliente').AsInteger := StrToInt(aCodCliente.Text);
      DataModuleDados.QryCadClienteBackup.Open;

      DataModuleDados.QryConsClienteBackupArquivos.Close;
      DataModuleDados.QryConsClienteBackupArquivos.ParamByName('cod_cliente').AsInteger := StrToInt(aCodCliente.Text);
      DataModuleDados.QryConsClienteBackupArquivos.Open;

      DataModuleDados.QryCadClienteBackupArquivo.Close;
      DataModuleDados.QryCadClienteBackupArquivo.ParamByName('cod_cliente').AsInteger   := StrToInt(aCodCliente.Text);
      DataModuleDados.QryCadClienteBackupArquivo.Open;

      for var I := 1 to LQtdeBancosPasta do
      begin
        if (DataModuleDados.QryConsClienteBackupArquivos.Locate('nome_arquivo', DataModuleDados.QryCadClienteBackupArquivo.FieldByName('nome_arquivo').AsString, [])) and
           (not DataModuleDados.QryCadClienteBackupArquivo.Eof) then
        begin
          DataModuleDados.QryCadClienteBackupArquivo.Edit;
          DataModuleDados.QryCadClienteBackupArquivo.FieldByName('cod_cliente').Asinteger        := StrToInt(aCodCliente.Text);
          DataModuleDados.QryCadClienteBackupArquivo.FieldByName('ordem').AsInteger              := I;

          DataModuleDados.QryCadClienteBackupArquivo.FieldByName('nome_arquivo').ReadOnly        := False;
          DataModuleDados.QryCadClienteBackupArquivo.FieldByName('nome_arquivo').AsString        := GetNomeUltimoBackup(I, aDiretorio.Text);
          DataModuleDados.QryCadClienteBackupArquivo.FieldByName('nome_arquivo').ReadOnly        := True;


          DataModuleDados.QryCadClienteBackupArquivo.FieldByName('ativo').ReadOnly               := False;
          DataModuleDados.QryCadClienteBackupArquivo.FieldByName('ativo').AsString               := DataModuleDados.QryConsClienteBackupArquivos.FieldByName('ativo').AsString;
          DataModuleDados.QryCadClienteBackupArquivo.FieldByName('ativo').ReadOnly               := True;

          DataModuleDados.QryCadClienteBackupArquivo.FieldByName('limite_dias').AsInteger        :=
            DataModuleDados.QryConsClienteBackupArquivos.fieldbyname('limite_dias').AsInteger;
          DataModuleDados.QryCadClienteBackupArquivo.FieldByName('limite_tamanho').AsInteger     :=
            DataModuleDados.QryConsClienteBackupArquivos.fieldbyname('limite_tamanho').AsInteger;
        end
        else
        begin
          DataModuleDados.QryCadClienteBackupArquivo.Append;
          DataModuleDados.QryCadClienteBackupArquivo.FieldByName('cod_cliente').Asinteger        := StrToInt(aCodCliente.Text);
          DataModuleDados.QryCadClienteBackupArquivo.FieldByName('nome_arquivo').ReadOnly        := False;
          DataModuleDados.QryCadClienteBackupArquivo.FieldByName('nome_arquivo').AsString        := GetNomeUltimoBackup(I, aDiretorio.Text);
          DataModuleDados.QryCadClienteBackupArquivo.FieldByName('nome_arquivo').ReadOnly        := True;
          DataModuleDados.QryCadClienteBackupArquivo.FieldByName('ordem').AsInteger              := I;

          DataModuleDados.QryCadClienteBackupArquivo.FieldByName('ativo').ReadOnly               := False;
          DataModuleDados.QryCadClienteBackupArquivo.FieldByName('ativo').AsString               := 'N';
          DataModuleDados.QryCadClienteBackupArquivo.FieldByName('ativo').ReadOnly               := True;
        end;

        DataModuleDados.QryCadClienteBackupArquivo.Post;
        DataModuleDados.QryCadClienteBackupArquivo.Next
      end;
      DataModuleDados.QryCadClienteBackupArquivo.First;
    end;
  except
    On E: Exception do
      TMessageDialog.Error('N�o foi poss�vel carregar os bancos na pasta selecionada!' + sLineBreak + E.Message);
  end;
end;

function TBackupOperacoes.FecharConexao(aForm: TForm): iBackupOperacoes;
begin
  for var I := 0 to aForm.ComponentCount - 1 do
    if (aForm.Components[I] is TDBGrid) and (TDBGrid(aForm.Components[I]).DataSource <> nil) then
      TDBGrid(aForm.Components[I]).DataSource.DataSet.Close;

  if (DataModuleDados.DBConnection.InTransaction) then
    DataModuleDados.DBConnection.Rollback;
end;

function TBackupOperacoes.&End: iBackupController;
begin
  Result := FParent;
end;

function TBackupOperacoes.DesabilitarBancoDoConsultor: iBackupOperacoes;
begin
  try
    if TMessageDialog.Question('Deseja realmente remover o registro do monitoramento?') then
    begin
      DataModuleDados.QryCadClienteBackupArquivo.Edit;
      DataModuleDados.QryCadClienteBackupArquivo.FieldByName('monitorar_arquivo').AsString := 'N';
      DataModuleDados.QryCadClienteBackupArquivo.Post;

      if (DataModuleDados.QryCadClienteBackupArquivo.ApplyUpdates(-1) > 0) then
        Abort;
      TMessageDialog.Info('Registro inativado!');
    end;
  except on E: Exception do
    TMessageDialog.Error('N�o foi poss�vel remover o registro do monitoramento!' + sLineBreak + E.Message);
  end;
end;

end.
