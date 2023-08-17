unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm4 = class(TForm)
    Button1: TButton;
    edtTotal: TEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  const
    DLL_CALC = 'Calc.dll';

  function SomarDouble(AV1, AV2: Double): Double; stdcall; external DLL_CALC delayed;
  function SomarInteger(AV1, AV2: Integer): Integer; stdcall; external DDL_CALC delayed;

var
  Form4: TForm4;

implementation

{$R *.dfm}

procedure TForm4.Button1Click(Sender: TObject);
begin
  edtTotal.Text := SomarInteger(1,6).ToString;
end;

end.
