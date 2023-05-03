unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Pessoa,
  Produto, DAO.Generic;

type
  TForm1 = class(TForm)
    Btn1: TButton;
    Button1: TButton;
    procedure Btn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Btn1Click(Sender: TObject);
var
  vPessoa : TPessoa;
begin
  vPessoa     := TPessoa.Create;

  try
    vPessoa.Nome        := 'Renato';
    vPessoa.SobreNome   := 'Saldanha';
    TDAOGeneric<TPessoa>.New.Insert(vPessoa);
  finally
    vPessoa.Free;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  vProduto : TProduto;
begin
  vProduto     := TProduto.Create;
  try
    vProduto.Nome        := 'Oleo';
    vProduto.Marca       := 'Vigor';
    TDAOGeneric<TProduto>.New.Insert(vProduto);
  finally
    vProduto.Free;
  end;

end;

end.
