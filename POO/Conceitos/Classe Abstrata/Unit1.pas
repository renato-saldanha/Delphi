unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Model.Cliente, Model.Pessoa, Model.Fornecedor,
  Conexao, Conexao.FirebirdSQL, Conexao.Postgre;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Btn: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
  FConexao: TConexao;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation


{$R *.dfm}

procedure TForm1.BtnClick(Sender: TObject);
begin
  FConexao:= TConexaoPostgre.Create();
  FConexao.CriarConexao('BDTESTE1223');
  FreeAndNil(FConexao);
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  Cliente: TPessoa;
begin
  try
    Cliente:= TCliente.Create;
    Cliente.Cadastrar(Cliente);
  finally
    FreeAndNil(Cliente);
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  Cliente: TPessoa;
begin
  try
    Cliente:= TFornecedor.Create;
    Cliente.Cadastrar(Cliente);
  finally
    FreeAndNil(Cliente);
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  FConexao:= TConexaoFirebirdSQL.Create();
  FConexao.CriarConexao('BDTESTE1223');
  FreeAndNil(FConexao);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
//  FConexao:= TConexaoPostgre.Create();
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
//  FreeAndNil(FConexao);
end;

end.

