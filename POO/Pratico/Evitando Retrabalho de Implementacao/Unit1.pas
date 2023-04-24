unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls,
  Regra.SimplesNacional,
  Regra.LucroPresumido,
  Regra.LucroReal,
  Regra.Interfaces,
  Regra.Controller;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    ComboBox1: TComboBox;
    EdtValorImposto: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
    FRegras: iRegras;
    procedure ExibirResultado(aValue: String);
  public
    { Public declarations }
    procedure RecebeRegra(aValue: iRegras);
  end;

var
  Form1: TForm1;

implementation

uses
  Regra.Tipo;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown:= True;

  TRegraController.New.ListaRegras(ComboBox1.Items);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  RecebeRegra(FRegras);
  FRegras.Operacoes.CalcularImposto(EdtValorImposto.Text);
  FRegras.Operacoes.CalcularImpostoST(EdtValorImposto.Text);
end;

procedure TForm1.RecebeRegra(aValue: iRegras);
begin
  Memo1.Lines.Add(aValue.Name());
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  FRegras:= TEnumRegras(ComboBox1.ItemIndex).this.Display(ExibirResultado);
end;

procedure TForm1.ExibirResultado(aValue: String);
begin
  Memo1.Lines.Add(aValue);
end;

end.

