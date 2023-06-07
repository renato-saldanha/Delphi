unit View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
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

uses
  Controller;


{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
  TController.New.Services.Boletos;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  TController.New.Integrations.MercadoPago;
end;

end.
