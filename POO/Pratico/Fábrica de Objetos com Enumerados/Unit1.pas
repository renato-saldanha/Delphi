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
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
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
  Uteis;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown:= True;

  CarregarInfoComboBox(ComboBox1);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
//  case (ComboBox1.ItemIndex) of
//    0: Memo1.Lines.Add('Simples Nacional');
//    1: Memo1.Lines.Add('Lucro Presumido');
//  else
//    Memo1.Lines.Add('Lucro Real');
//  end;

//  case (ComboBox1.ItemIndex) of
//     0: RecebeRegra(TRegraSimplesNacional.Create);
//     1: RecebeRegra(TRegraLucroPresumido.Create);
//     2: RecebeRegra(TRegraLucroReal.Create);
//  end;

  RecebeRegra(FRegra);
end;

//procedure TForm1.RecebeRegra(aValue: TRegraSimplesNacional);
//begin
//  Memo1.Lines.Add(aValue.Name());
//end;
//
//procedure TForm1.RecebeRegra(aValue: TRegraLucroPresumido);
//begin
//  Memo1.Lines.Add(aValue.Name());
//end;
//
//procedure TForm1.RecebeRegra(aValue: TRegraLucroReal);
//begin
//  Memo1.Lines.Add(aValue.Name());
//end;

procedure TForm1.RecebeRegra(aValue: TRegra);
begin
  Memo1.Lines.Add(aValue.Name())
end;

procedure TForm1.CarregarInfoComboBox(Combo: TComboBox);
begin
  Combo.Items.Clear;
//  Combo.Items.AddObject('Simples Nacional', TRegraSimplesNacional.Create);
//  Combo.Items.AddObject('Lucro Presumido', TRegraLucroPresumido.Create);
//  Combo.Items.AddObject('Lucro Real', TRegraLucroReal.Create);
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  if Assigned(FRegra) then
    FRegra.Free;

//    case TEnumRegra(ComboBox1.ItemIndex) of
//      trSimplesNacional     : FRegra   := TRegraSimplesNacional.Create;
//      trLucroPresumido      : FRegra   := TRegraLucroPresumido.Create;
//      trLucroReal           : FRegra   := TRegraLucroReal.Create;
//    end;

    FRegra:= TRegra(ComboBox1.Items.Objects[ComboBox1.ItemIndex]);
end;


end.

