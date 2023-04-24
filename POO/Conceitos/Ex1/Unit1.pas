unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Btn: TButton;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure BtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BtnClick(Sender: TObject);
var
  Iarray: array [1 .. 5] of Integer;
  I: Integer;
begin
  Iarray[1] := 10;
  Iarray[2] := 20;
  Iarray[3] := 30;
  Iarray[4] := 40;
  Iarray[5] := 50;

  for I := 0 to Length(Iarray) - 1 do
  begin

  end;

end;

end.
