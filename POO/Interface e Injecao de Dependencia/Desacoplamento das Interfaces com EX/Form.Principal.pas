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
    Memo1: TMemo;
    procedure Btn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    procedure Display(aValue: String);
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
  vDAOPessoa.Display(Self.Display);
  vDAOPessoa.this.Nome        := 'Renato';
  vDAOPessoa.this.SobreNome   := 'Saldanha';
  vDAOPessoa.Insert;
  vDAOPessoa.Update;
  vDAOPessoa.Delete;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  vDAOProduto : iDAOInterface<TProduto>;
begin
  vDAOProduto                    := TDAOGeneric<TProduto>.New;
  vDAOProduto.Display(Display);
  vDAOProduto.this.Nome          := 'Oleo';
  vDAOProduto.this.Marca         := 'Vigor';
  vDAOProduto.this.Valor         := 10.56;
  vDAOProduto.Insert;
  vDAOProduto.Update;
  vDAOProduto.Delete;
end;

procedure TForm1.Display(aValue: String);
begin
  Memo1.Lines.Add(aValue)
end;

end.
