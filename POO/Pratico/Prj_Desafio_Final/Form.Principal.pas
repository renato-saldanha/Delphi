unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Regra.Controller,
  Regra.Interfaces;

type
  TForm1 = class(TForm)
    CbxTipoReceita: TComboBox;
    EdtValor: TEdit;
    BtnCalcular: TButton;
    Memo1: TMemo;
    procedure CbxTipoReceitaChange(Sender: TObject);
    procedure BtnCalcularClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FParent : iRegra;
    procedure ExibirResultado(aValue: String);
    function RecebeRegra(aValue: iRegra): iRegra;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;


implementation

uses
  Regra.Tipo;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  Memo1.Lines.Clear;
  CbxTipoReceita.Items.Clear;
  TRegraController.New.ListarRegras(CbxTipoReceita.Items);
end;

procedure TForm1.BtnCalcularClick(Sender: TObject);
begin
  FParent.Operacoes.CalcularPercentual(EdtValor.Text);
end;

function TForm1.RecebeRegra(aValue: iRegra): iRegra;
begin
  Memo1.Lines.Add(aValue.Parametros.Descricao);
end;

procedure TForm1.CbxTipoReceitaChange(Sender: TObject);
begin
   FParent := TEnumTipoReceita(CbxTipoReceita.ItemIndex).this.Parametros.Display(ExibirResultado).&End;
   RecebeRegra(FParent);
end;

procedure TForm1.ExibirResultado(aValue: String);
begin
  Memo1.Lines.Add(aValue);
end;

end.
