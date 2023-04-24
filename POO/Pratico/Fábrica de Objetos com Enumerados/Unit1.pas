unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Regra.LucroPresumido, Regra.LucroReal, Regra.SimplesNacional,
  Regra;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    ComboBox1: TComboBox;
    EdtValorImposto: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FRegra: TRegra;
    procedure CarregarInfoComboBox(Combo: TComboBox);
  public
    { Public declarations }
//    procedure RecebeRegra(aValue: TRegraSimplesNacional); overload;
//    procedure RecebeRegra(aValue: TRegraLucroReal); overload;
//    procedure RecebeRegra(aValue: TRegraLucroPresumido); overload;
    procedure RecebeRegra(aValue: TRegra);
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

  CarregarInfoComboBox(ComboBox1);
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FRegra.Free;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  RecebeRegra(FRegra);

  Memo1.Lines.Add(CurrToStr(FRegra.CalculaImposto(StrToCurr(EdtValorImposto.Text))));
end;

procedure TForm1.RecebeRegra(aValue: TRegra);
begin
  Memo1.Lines.Add(aValue.Name())
end;

procedure TForm1.CarregarInfoComboBox(Combo: TComboBox);
begin
  Combo.Items.Clear;
  Combo.Items.Add('Simples Nacional');
  Combo.Items.Add('Lucro Presumido');
  Combo.Items.Add('Lucro Real');
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  if Assigned(FRegra) then
    FRegra.Free;

  FRegra:= TEnumRegras(ComboBox1.ItemIndex).this;
end;


end.

