unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Model.Produto,
  Model.Produto.Interfaces, System.JSON, REST.JSON;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Memo2: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
var
  LProduto : IModelProduto;
  LProdutoItem: IModelProdutoItem;
  JSONProduto: TJsonObject;
begin
  LProduto            := TModelProduto.New;
  LProduto
    .Id(1)
    .Descricao('Sal de Epson')
    .Itens.Add(TModelProdutoItem.New
                .Valor(145)
                .Quantidade(2));
  LProduto.Itens.Add(TModelProdutoItem.New
                .Valor(385)
                .Quantidade(47));

  Memo1.Lines.Clear;
  Memo1.Lines.Add('Produto: ' + LProduto.Descricao);
  Memo1.Lines.Add('Id: ' + LProduto.Id);
  Memo1.Lines.Add('Pre�o 1:');
  Memo1.Lines.Add('Quantidade: ' + LProduto.Itens.Items[0].Quantidade);
  Memo1.Lines.Add('Valor: ' + LProduto.Itens.Items[0].Valor);
  Memo1.Lines.Add('Pre�o 2:');
  Memo1.Lines.Add('Quantidade: ' + LProduto.Itens.Items[1].Quantidade);
  Memo1.Lines.Add('Valor: ' + LProduto.Itens.Items[1].Valor);

  JSONProduto := TJSON.ObjectToJsonObject(TObject(LProduto));
  try
    Memo2.Lines.Add(JSONProduto.Format);
  finally
    JSONProduto.Free;
  end;
end;

end.