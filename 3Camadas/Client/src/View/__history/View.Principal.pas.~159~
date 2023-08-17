unit View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Buttons, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  TypInfo,
  RESTRequest4D,
  Horse,
  Horse.Jhonson,
  DataSet.Serialize,
  DataSet.Serialize.Adapter.RESTRequest4D,
  System.JSON, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait, FireDAC.Comp.UI,
  Vcl.DBCtrls, System.NetEncoding;

type
  TFormPrincipal = class(TForm)
    DbgDados: TDBGrid;
    DscDados: TDataSource;
    LbeDescricao: TLabeledEdit;
    BtnNovo: TButton;
    BtnAlterar: TButton;
    BtnExcluir: TButton;
    BtnPesquisar: TBitBtn;
    mmDados: TFDMemTable;
    Image1: TImage;
    procedure BtnPesquisarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure LbeDescricaoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure DscDadosDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

uses
  View.Cadastro, App.Util;

{$R *.dfm}

procedure TFormPrincipal.BtnExcluirClick(Sender: TObject);
var
  LResponse: IResponse;
begin
  try
    if (MessageDlg('Deseja excluir o registro?', mtWarning, [mbYes, mbNo], 0) = mrYes) then
    begin
      LResponse := TRequest.New
        .BaseURL('http://localhost:9000')
        .Resource('clientes')
        .ResourceSuffix(mmDados.FieldByName('id').AsString)
        .BasicAuthentication('renato', '123')
        .Accept('application/json')
        .Delete;
      if (LResponse.StatusCode = 200) then
        ShowMessage('Registro Excluído!');
    end;
  except on E: Exception do
    Showmessage(e.Message);
  end;
end;

procedure TFormPrincipal.BtnNovoClick(Sender: TObject);
var
  a:TStringStream;
  b: TMemoryStream;
begin
  try
    try
      Application.CreateForm(TFormCadastro, FormCadastro);
      FormCadastro.Query.Tag := 1;
      FormCadastro.Query.Close;
      FormCadastro.Query.FieldDefs := mmDados.FieldDefs;
      FormCadastro.Query.Open;
//      FormCadastro.Query.Append;
//      FormCadastro.Query.CopyRecord(mmDados);
//      FormCadastro.Query.Post;
      FormCadastro.ShowModal;
    finally
      FreeAndNil(FormCadastro);
    end;
  except on E: Exception do
    Showmessage(e.Message);
  end;
end;

procedure TFormPrincipal.BtnPesquisarClick(Sender: TObject);
var
  LResponse: IResponse;
begin
  try
    LResponse := TRequest.New
      .BaseURL('http://localhost:9000')
      .Resource('clientes')
      .ResourceSuffix(LbeDescricao.Text)
      .BasicAuthentication('renato', '123')
      .Adapters(TDataSetSerializeAdapter.New(mmDados))
      .Accept('application/json; image/jpeg')
      .Get;
//      mmDados.LoadFromJSON(LResponse.Content);
  except on E: Exception do
    Showmessage(e.Message);
  end;
end;

procedure TFormPrincipal.DscDadosDataChange(Sender: TObject; Field: TField);
begin
//  Image1.Picture.Assign(mmDados.FieldByName('bmp'))
end;

procedure TFormPrincipal.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
end;

procedure TFormPrincipal.LbeDescricaoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_RETURN: BtnPesquisarClick(nil);
  end;
end;

end.
