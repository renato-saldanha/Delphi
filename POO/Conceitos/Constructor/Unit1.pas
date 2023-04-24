unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Model.Cliente, Model.Pessoa, Model.Fornecedor ;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

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

end.

