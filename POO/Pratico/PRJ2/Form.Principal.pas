unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.NumberBox,
  Regra.Tipo, Regra.Interfaces;

type
  TForm1 = class(TForm)
    CbxTipoPreco: TComboBox;
    BtnVerPreco: TButton;
    Memo: TMemo;
    NbxPrecoVenda: TNumberBox;
    procedure FormCreate(Sender: TObject);
    procedure BtnVerPrecoClick(Sender: TObject);
    procedure CbxTipoPrecoChange(Sender: TObject);
  private
    { Private declarations }
    FParent: iRegras;
    procedure ExibirResultado(aValue: String);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  Regra.Controller;

{$R *.dfm}

procedure TForm1.BtnVerPrecoClick(Sender: TObject);
begin
  FParent.Operacoes.CalcularPreco(NbxPrecoVenda.ValueCurrency);

  // ExibirResultado(CbxTipoPreco.Text);
  // ExibirResultado(CurrToStr(Total))
end;

procedure TForm1.CbxTipoPrecoChange(Sender: TObject);
begin
  FParent := TEnumTipoPreco(CbxTipoPreco.Items).this.Parametros.Display(ExibirResultado).&End;
end;

procedure TForm1.ExibirResultado(aValue: String);
begin
  Memo.Lines.Add(aValue);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  CbxTipoPreco.Clear;
  TRegraController.New.ListarRegras(CbxTipoPreco.Items);
end;

end.
