unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, JSON;

type
  TForm2 = class(TForm)
    Btn1: TButton;
    Memo1: TMemo;
    Memo2: TMemo;
    Button1: TButton;
    Memo3: TMemo;
    Button2: TButton;
    Memo4: TMemo;
    procedure Btn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Btn1Click(Sender: TObject);
var
  JSONPessoa: TJSONObject;
  JSONReferencia: TJSONObject;
begin
  JSONPessoa := TJSONObject.Create;

  try
    JSONPessoa.AddPair('nome', 'Julio')
      .AddPair('endereco', 'Rua X')
      .AddPair('numero', TJSONNumber.Create(100));

    JSONReferencia := TJSONObject.Create;
    JSONReferencia.AddPair('telefone', '(65) 99245-9988');

    JSONPessoa.AddPair('referencia', JSONReferencia);

    memo1.Text := JSONPessoa.ToString;

    JSONPessoa.RemovePair('endereco');

    memo2.Text := JSONPessoa.ToString;
  except on E: Exception do
    JSONPessoa.Free;
  end;
end;

procedure TForm2.Button1Click(Sender: TObject);
var
  JSONPessoa: TJSONObject;
begin
  JSONPessoa := TJSONObject.ParseJSONValue(memo1.Text) as TJSONObject;

  Memo3.Text := JSONPessoa.Get(3).ToString;
  Memo3.Lines.Add(JSONPessoa.GetValue<string>('nome'));
end;

procedure TForm2.Button2Click(Sender: TObject);
var
  JSONPessoa: TJSONObject;
  JSONReferencia: TJSONObject;
  ArrayPessoa: TJSONArray;
begin
  ArrayPessoa := TJSONArray.Create;
  JSONPessoa := TJSONObject.Create;
  try
    JSONPessoa.AddPair('nome', 'Julio')
      .AddPair('endereco', 'Rua X')
      .AddPair('numero', TJSONNumber.Create(100));

    JSONReferencia := TJSONObject.Create;
    JSONReferencia.AddPair('telefone', '(65) 99245-9988');

    JSONPessoa.AddPair('referencia', JSONReferencia);

    ArrayPessoa.AddElement(JSONPessoa);
    memo4.Text := ArrayPessoa.Format(3);
  except on E: Exception do
    ArrayPessoa.Free;
  end;
end;

end.