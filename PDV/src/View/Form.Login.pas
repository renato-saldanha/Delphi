unit Form.Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.Buttons;

type
  TFormLogin = class(TForm)
    PnlPrincipal: TPanel;
    PnlLogin: TPanel;
    PnlUsuario: TPanel;
    Shape1: TShape;
    EdtUsuario: TEdit;
    PnlSenha: TPanel;
    Shape2: TShape;
    EdtSenha: TEdit;
    ImgInicial: TImage;
    PnlBotoes: TPanel;
    PnlSair: TPanel;
    Shape3: TShape;
    SpbSair: TSpeedButton;
    PnlEntrar: TPanel;
    Shape4: TShape;
    SpbEntrar: TSpeedButton;
    procedure SpbSairClick(Sender: TObject);
    procedure SpbEntrarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure AbrirTela;
  end;

var
  FormLogin: TFormLogin;

implementation

uses
  Form.Principal;

{$R *.dfm}

class procedure TFormLogin.AbrirTela;
begin
  Try
    Application.CreateForm(TFormLogin, FormLogin);
    FormLogin.ShowModal;
  finally
    FreeAndNil(FormLogin);
  End;

//  FormLogin               := TFormLogin.Create(nil);
//  FormLogin.Parent        := FormPrincipal.PnlMaster;
//  FormLogin.Top           := 0;
//  FormLogin.Left          := 0;
//  FormLogin.WindowState   := TWindowState.wsMaximized;
//  FormLogin.Show;
end;

procedure TFormLogin.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    Close;
end;

procedure TFormLogin.SpbEntrarClick(Sender: TObject);
begin
  Close;
end;

procedure TFormLogin.SpbSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

end.