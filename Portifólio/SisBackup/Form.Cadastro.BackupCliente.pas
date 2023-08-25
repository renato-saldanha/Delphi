unit Form.Cadastro.BackupCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls, FileCtrl, RxToolEdit,
  DMDados, App.Enums, App.Interfaces, App.Operacoes,
  Model.ClienteBackup, App.Controller, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.DBCGrids, Vcl.DBCtrls, Vcl.ComCtrls,
  Vcl.Menus;

type
  TFormCadastroBackupCliente = class(TForm)
     [FieldBind('codigo', TBindType.btInteger, True)]
    LbeCodCliente: TLabeledEdit;
      [FieldBind('pasta_backup', TBindType.btString)]
    LbePastaBackup: TLabeledEdit;
      [FieldBind('nome', TBindType.btString)]
    EdtNomeCliente: TEdit;

    SpbPastaBackup: TSpeedButton;
    PnlAcoes: TPanel;
    BtnSalvar: TBitBtn;
    BtnExcluir: TBitBtn;
    BtnLimpar: TBitBtn;
    BtnSair: TBitBtn;
    SpbCodCliente: TSpeedButton;
    DbgArquivos: TDBGrid;
    DscBackupArquivos: TDataSource;
    StbPrincipal: TStatusBar;
    pm: TPopupMenu;
    Excluir1: TMenuItem;
    procedure LbeCodClienteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpbCodClienteClick(Sender: TObject);
    procedure SpbPastaBackupClick(Sender: TObject);
    procedure BtnLimparClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure LbeCodClienteExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DbgArquivosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DbgArquivosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DbgArquivosColEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DbgArquivosEnter(Sender: TObject);
    procedure DbgArquivosKeyPress(Sender: TObject; var Key: Char);
    procedure Excluir1Click(Sender: TObject);
    procedure LbeCodClienteEnter(Sender: TObject);
  private
    { Private declarations }
    FController : iBackupController;
  public
    { Public declarations }
    class procedure AbrirTela;
  end;

var
  FormCadastroBackupCliente: TFormCadastroBackupCliente;

implementation

uses App.Util;

{$R *.dfm}

procedure TFormCadastroBackupCliente.FormCreate(Sender: TObject);
begin
  FController := TBackupController.New;
end;

procedure TFormCadastroBackupCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FController.Operacoes.FecharConexao(Self);
end;

class procedure TFormCadastroBackupCliente.AbrirTela;
begin
  try
    Application.CreateForm(TFormCadastroBackupCliente, FormCadastroBackupCliente);
    FormCadastroBackupCliente.ShowModal;
  finally
    FreeAndNil(FormCadastroBackupCliente);
  end;
end;

procedure TFormCadastroBackupCliente.BtnSalvarClick(Sender: TObject);
var
  FClienteBackup: iClienteBackup;
begin
  FClienteBackup := TClienteBackup.Create;
  FClienteBackup
    .codigo(LbeCodCliente.Text)
    .nome(EdtNomeCliente.Text)
    .pasta_backup(LbePastaBackup.Text)
    .ClienteBackupArquivo(DbgArquivos);

  TBackupController.New.Operacoes
    .GravarClienteBackup(FClienteBackup);

  LimparCampos(Self);
end;

procedure TFormCadastroBackupCliente.BtnExcluirClick(Sender: TObject);
begin
  FController.Operacoes.InativarClienteBackup;
  LimparCampos(Self);
end;

procedure TFormCadastroBackupCliente.LbeCodClienteEnter(Sender: TObject);
begin
  LimparCampos(Self);
end;

procedure TFormCadastroBackupCliente.LbeCodClienteExit(Sender: TObject);
begin
  FController.Operacoes
    .FiltrarClienteBackup(LbeCodCliente, Self)
    .CarregarBancosDataset(LbeCodCliente, LbePastaBackup);
  SetRegraDBCheckSemFoco(DbgArquivos, 'ativo');
end;

procedure TFormCadastroBackupCliente.SpbCodClienteClick(Sender: TObject);
begin
  TBackupController.New.Operacoes.PesquisarCliente(LbeCodCliente);
end;

procedure TFormCadastroBackupCliente.SpbPastaBackupClick(Sender: TObject);
begin
  SelecionarDiretorio(LbePastaBackup);
  FController.Operacoes.CarregarBancosDataset(LbeCodCliente, LbePastaBackup);
end;

procedure TFormCadastroBackupCliente.BtnLimparClick(Sender: TObject);
begin
  LimparCampos(Self);
end;

procedure TFormCadastroBackupCliente.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFormCadastroBackupCliente.LbeCodClienteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_F8     : SpbCodClienteClick(nil);
    VK_RETURN : DbgArquivos.SetFocus;
  end;
end;

procedure TFormCadastroBackupCliente.DbgArquivosColEnter(Sender: TObject);
begin
  SetRegraDBCheckSemFoco(DbgArquivos, 'ativo');
end;

procedure TFormCadastroBackupCliente.DbgArquivosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
begin
  TUtilsVCL.ZebrarDBGrid(DbgArquivos, Rect, DataCol, Column, State);
  SetCorDBInativado(DbgArquivos, Rect, DataCol, Column, State);
  InserirDBCheckBoxNoGrid(dbgArquivos, Rect, Column);
end;

procedure TFormCadastroBackupCliente.DbgArquivosEnter(Sender: TObject);
begin
  SetRegraDBCheckSemFoco(DbgArquivos, 'ativo');
end;

procedure TFormCadastroBackupCliente.DbgArquivosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  SetRegraMarcarDesmarcarDBCheck(DbgArquivos, Key);
end;

procedure TFormCadastroBackupCliente.DbgArquivosKeyPress(Sender: TObject; var Key: Char);
begin
  SetRegraDigitoLimites(DbgArquivos, Key);
end;

procedure TFormCadastroBackupCliente.Excluir1Click(Sender: TObject);
begin
  FController.Operacoes.DesabilitarBancoDoConsultor;
end;

end.
