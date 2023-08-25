unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,

  JSON.Writers, JSON.Types, JSON.Readers, JSON.Builders;

type
  TForm2 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Memo2: TMemo;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
    procedure Iterator(AValue: TJSONIterator);
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
var
  JSONWriter: TJsonTextWriter;
  StringWriter: TStringWriter;
begin
  StringWriter := TStringWriter.Create;
  JSONWriter := TJsonTextWriter.Create(StringWriter);

  try
    JSONWriter.Formatting := TJsonFormatting.Indented;
    JSONWriter.WriteStartObject;
    JSONWriter.WritePropertyName('nome');
    JSONWriter.WriteValue('Renato');
    JSONWriter.WritePropertyName('endereco');
    JSONWriter.WriteValue('Rua XXXX');
    JSONWriter.WritePropertyName('cidade');
    JSONWriter.WriteValue('Cuiab�');
    JSONWriter.WritePropertyName('referencia');
    JSONWriter.WriteStartArray;
      JSONWriter.WriteStartObject;
        JSONWriter.WritePropertyName('contato');
        JSONWriter.WriteValue('Parente 1');
        JSONWriter.WritePropertyName('telefone');
        JSONWriter.WriteValue('(65) 99921-8459');
      JSONWriter.WriteEndObject;
      JSONWriter.WriteStartObject;
        JSONWriter.WritePropertyName('contato');
        JSONWriter.WriteValue('FUlano 2');
        JSONWriter.WritePropertyName('telefone');
        JSONWriter.WriteValue('(65) 3632-4878');
      JSONWriter.WriteEndObject;
    JSONWriter.WriteEndArray;
    JSONWriter.WriteEndObject;

    memo1.Text := StringWriter.ToString;
  finally
    JSONWriter.Free;
  end;
end;

procedure TForm2.Button2Click(Sender: TObject);
var
  JSONReader: TJsonTextReader;
  StringReader: TStringReader;
  LCampo: String;
  LAux: String;
begin
  StringReader := TStringReader.Create(memo1.Text);
  JSONReader := TJsonTextReader.Create(StringReader);

  try
    while JSONReader.Read do
    begin
      case JSONReader.TokenType of
        TJsonToken.PropertyName: LCampo := JSONReader.Value.ToString;
        TJsonToken.Integer,
        TJsonToken.String,
        TJsonToken.Boolean: Memo2.lines.add(LCampo + ' = ' + JSONReader.Value.ToString);
      end;
    end;
  finally
  end;
end;

procedure TForm2.Button3Click(Sender: TObject);
var
  JSONWriter: TJsonTextWriter;
  StringWriter: TStringWriter;
  JSONBuilder: TJsonObjectBuilder;
begin
   StringWriter := TStringWriter.Create;
   JSONWriter := TJsonTextWriter.Create(StringWriter);
   JsonBuilder := TJSONObjectBuilder.Create(JSONWriter);

   try
     JSONWriter.Formatting := TJsonFormatting.Indented;
     JSONBuilder
      .BeginObject
        .Add('nome', 'Renato')
        .Add('endereco', 'Rua X')
        .Add('numero', 100)
        .BeginArray('referencia')
          .BeginObject
            .Add('contato', 'Parente 1')
            .Add('telefone' , '(65) 3321-9852')
          .EndObject
          .BeginObject
            .Add('contato', 'Fulano 3')
            .Add('telefone', '(65) 99216-9981')
          .EndObject
        .EndArray
      .EndObject;

      memo2.Text := StringWriter.ToString;
   finally
     JSONWriter.Free;
     StringWriter.Free;
     JSONBuilder.Free;
   end;

end;

procedure TForm2.Button4Click(Sender: TObject);
var
  JSONReader: TJsonTextReader;
  StringReader: TStringReader;
  JSONIterator: TJSONIterator;
begin
  StringReader := TStringReader.Create(memo1.text);
  JSONReader := TJsonTextReader.Create(StringReader);
  JSONIterator := TJSONIterator.Create(JSONReader);
  memo2.Lines.Clear;

  try
//    JSONIterator.Find('referencia[0].contato');
//    JSONIterator.Recurse;
//    memo2.Lines.Add(JSONIterator.Key + ' = ' + JSONIterator.AsString);
//    JSONIterator.Next;
//    memo2.Lines.Add(JSONIterator.Key + ' = ' + JSONIterator.AsString);
//    JSONIterator.Return;

    Iterator(JSONIterator);
  finally
   JSONReader.Free;
   StringReader.Free;
   JSONIterator.Free;
  end;
end;

procedure TForm2.Iterator(AValue: TJSONIterator);
begin
  while AValue.Next do
  begin
    case AValue.&Type of
      TJsonToken.StartObject:
      begin
        AValue.Recurse;
        Iterator(AVAlue);
      end;
      TJsonToken.StartArray:
      begin
        Memo2.Lines.Add(AValue.Key);
        AValue.Recurse;
        Iterator(Avalue);
        Avalue.Return;
      end;
      TJsonToken.Integer: Memo2.Lines.Add(Avalue.Key + ' = ' + AVAlue.AsInteger.ToString);
      TJsonToken.String: Memo2.Lines.Add(Avalue.Key + ' = ' + AVAlue.AsString);
      TJsonToken.Boolean: Memo2.Lines.Add(Avalue.Key + ' = ' + AVAlue.AsValue.ToString);
    end;
  end;
  Avalue.Return;
end;

end.