unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Pessoa,
  Produto, DAO.Generic, Interfaces;

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
  vDAOPessoa : iDAOInterface<TPessoa>;
begin
  vDAOPessoa                  := TDAOGeneric<TPessoa>.New;
  vDAOPessoa.this.Nome        := 'Renato';
  vDAOPessoa.this.SobreNome   := 'Saldanha';
  vDAOPessoa.Insert;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  vProduto : iDAOInterface<TProduto>;
begin
  vProduto                    := TDAOGeneric<TProduto>.New;
  vProduto.this.Nome          := 'Oleo';
  vProduto.this.Marca         := 'Vigor';
  vProduto.Insert;
end;

end.
