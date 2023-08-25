unit View.Cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Data.DB, FireDAC.Comp.Client, DataSet.Serialize, NetEncoding,
  Jpeg,
  ExtDlgs,
  Consts, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet, RESTRequest4D, FireDAC.DApt;

type
  TEnumDBStatus = (sNada, sInserir, sAtualizar);

  TEnumDBStatusHelper = record Helper for TEnumDBStatus
    function SetStatusDataset(AQuery: TFDMemTable): TFDMemTable;
  end;

  TFormCadastro = class(TForm)
    EdtNome: TDBLabeledEdit;
    EdtEndereco: TDBLabeledEdit;
    EdtCidade: TDBLabeledEdit;
    EdtInteresses: TDBLabeledEdit;
    Panel1: TPanel;
    BtnSair: TButton;
    BtnSalvar: TButton;
    ImgCadastro: TDBImage;
    btnEscolherImagem: TButton;
    BtnLimpar: TButton;
    OpenDialog1: TOpenDialog;
    Adapter: TFDTableAdapter;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnLimparClick(Sender: TObject);
    procedure btnEscolherImagemClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
  private
    { Private declarations }
    FQuery: TFDMemTable;
    FDataSource: TDataSource;
    procedure SetImage();
    Function TipoDaImagem(imagem: TStream): string;
  public
    { Public declarations }
    property Query: TFDMemTable read FQuery write FQuery;
    procedure Inserir;
    procedure Alterar;
  end;

var
  FormCadastro: TFormCadastro;

implementation

uses
  View.Principal, DataSet.Serialize.Adapter.RESTRequest4D;

{$R *.dfm}

procedure TFormCadastro.btnEscolherImagemClick(Sender: TObject);
begin
  OpenDialog1.Filter:= '*.jpg|*.jpeg|*.bmp|*.png';
  if OpenDialog1.Execute then
  begin
    ImgCadastro.Picture.LoadFromFile(OpenDialog1.FileName);
    TBlobField(FQuery.FieldByName('image')).LoadFromFile(OpenDialog1.FileName);
  end;
end;

procedure TFormCadastro.BtnSalvarClick(Sender: TObject);
var
  LResponse: IResponse;
begin
  try
    if (MessageDlg('Deseja inserir o registro?', mtWarning, [mbYes, mbNo], 0) = mrYes) then
    begin
      FQuery.Post;
      LResponse := TRequest.New
        .BaseURL('http://localhost:9000')
        .Resource('clientes')
        .BasicAuthentication('renato', '123')
        .Adapters(TDataSetSerializeAdapter.New(FQuery))
        .AddBody(FQuery.ToJSONObject)
        .Post;
      if (LResponse.StatusCode = 200) then
        ShowMessage('Registro Inserido!');
    end;
  except on E: Exception do
    Showmessage(e.Message);
  end;
end;

procedure TFormCadastro.BtnLimparClick(Sender: TObject);
begin
  ImgCadastro.Picture.assign(nil);
end;

procedure TFormCadastro.FormCreate(Sender: TObject);
begin
  FQuery      := TFDMemTable.Create(Self);
  FDataSource := TDataSource.Create(Self);
end;

procedure TFormCadastro.FormShow(Sender: TObject);
const
  INSERCAO  = 1;
  ALTERACAO = 2;
begin
  FDataSource.DataSet        := FQuery;
  EdtNome.DataSource         := FDataSource;
  EdtNome.DataField          := 'first_name';
  EdtEndereco.DataSource     := FDataSource;
  EdtEndereco.DataField      := 'address1';
  EdtCidade.DataSource       := FDataSource;
  EdtCidade.DataField        := 'City';
  EdtInteresses.DataSource   := FDataSource;
  EdtInteresses.DataField    := 'interests';
//  ImgCadastro.Picture.Assign(TGraphicField(FQuery.FieldByName('image')));
  ImgCadastro.DataSource     := FDataSource;
  ImgCadastro.DataField      := 'IMAGE';
//  SetImage;

  case FQuery.Tag of
    INSERCAO : FQuery.Append;
    ALTERACAO: FQuery.Edit;
  end;
end;

procedure TFormCadastro.Inserir;
begin
  //
end;

procedure TFormCadastro.SetImage;
var
  Stream: TMemoryStream;
  LBitmap: TBitmap;
  LJpg: TJpegImage;
  LStream: TStringStream;
  LHeader: array [0 .. 9] of byte;
  LStrHeader: String;
  lj: integer;
begin
  Stream := TMemoryStream.Create;

  Stream := TBytesStream.Create(TNetEncoding.Base64.DecodeStringToBytes(Query.FieldByName('image').AsString));
  LBitmap := TBitmap.Create;
  LBitmap.CanLoadFromStream(Stream);




  LStream := TStringStream.Create;

   TBlobField(FQuery.FieldByName('image')).SaveToStream(LStream);
//   LStream.Position := 0;
//   LJpg           := TJpegImage.Create;
//   LJpg.LoadFromStream(Stream);
//  TipoDaImagem(Stream);
  LJpg.SaveToFile('c:\temp\e2.jpeg');
  LStream.Position := 0;
  LStream.ReadBuffer(LHeader, length(LHeader));
  LStream.Position := 0;
//  for lj := Low(LHeader) to High(LHeader) do
//    if (LHeader[lj] > 32) and (LHeader[lj] <= 128) then
//      LStrHeader := LStrHeader + char(LHeader[lj]);

  LStream.SaveToFile('c:\temp\a2.bmp')  ;

  ImgCadastro.Picture.Assign(LBitmap);
end;

procedure TFormCadastro.Alterar;
begin
  //
end;

procedure TFormCadastro.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      Self.Close;
    VK_RETURN, VK_TAB:
      PERFORM(WM_NEXTDLGCTL, 0, 0);
  end;
end;

{ TEnumDBStatusHelper }

function TEnumDBStatusHelper.SetStatusDataset(AQuery: TFDMemTable): TFDMemTable;
begin
  case Self of
    sInserir   : AQuery.Insert;
    sAtualizar : AQuery.Edit;
  end;
end;

Function TFormCadastro.TipoDaImagem(imagem: TStream): string;
var
  ss: TStringStream;
  imageStream: TMemoryStream;
var
  temp: string;
Begin
  try
    imageStream := TMemoryStream.Create;
    imageStream.Position := 0;
    ss := TStringStream.Create('');
    ss.CopyFrom(imagem, 5);
    temp := Uppercase(ss.DataString);
    IF (Ord(ss.DataString[1]) = 255) and (Ord(ss.DataString[2]) = 216) then
      result := '.JPG'
    Else IF Pos('BM', temp) > 0 then
      result := '.BMP'
    Else IF Pos('GIF', temp) > 0 then
      result := '.GIF'
    Else IF Pos('PNG', temp) > 0 then
      result := '.PNG'
    Else IF (Ord(ss.DataString[1]) = 215) and (Ord(ss.DataString[2]) = 205) and (Ord(ss.DataString[3]) = 198) then
      result := '.WMF'
    ELse IF Pos('X', temp) > 0 then
      result := '.EMF'
    Else

      IF (Ord(ss.DataString[1]) = 0) and (Ord(ss.DataString[2]) = 0) then
      result := '.ICO'
    else IF (Ord(ss.DataString[1]) = 0) and (Ord(ss.DataString[2]) = 1) then
      result := '.ICO'
    Else

      result := 'Desconhecido';
  finally
    imageStream.Free;
  end;
End;

end.