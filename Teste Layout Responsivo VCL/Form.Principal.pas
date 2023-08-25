unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Math, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TForm4 = class(TForm)
    PnlBotoes: TPanel;
    PnlCancelarOperacao: TPanel;
    Shape1: TShape;
    SpeedButton1: TSpeedButton;
    PnlAbrirCaixa: TPanel;
    Shape3: TShape;
    SpeedButton2: TSpeedButton;
    PnlCancelarItem: TPanel;
    Shape4: TShape;
    SpeedButton3: TSpeedButton;
    PnlConsultarPreco: TPanel;
    Shape5: TShape;
    SpeedButton4: TSpeedButton;
    PnlCancelarVenda: TPanel;
    Shape6: TShape;
    SpeedButton5: TSpeedButton;
    PnlMaisFuncoes: TPanel;
    Shape7: TShape;
    SpeedButton6: TSpeedButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Shape2: TShape;
    SpeedButton7: TSpeedButton;
    Panel3: TPanel;
    Shape8: TShape;
    SpeedButton8: TSpeedButton;
    Panel4: TPanel;
    Shape9: TShape;
    SpeedButton9: TSpeedButton;
    Panel5: TPanel;
    Shape10: TShape;
    SpeedButton10: TSpeedButton;
    Panel6: TPanel;
    Shape11: TShape;
    SpeedButton11: TSpeedButton;
    Panel7: TPanel;
    Shape12: TShape;
    SpeedButton12: TSpeedButton;
    Panel8: TPanel;
    Shape13: TShape;
    SpeedButton13: TSpeedButton;
    Panel9: TPanel;
    Shape14: TShape;
    SpeedButton14: TSpeedButton;
    Panel10: TPanel;
    Shape15: TShape;
    SpeedButton15: TSpeedButton;
    Panel11: TPanel;
    Shape16: TShape;
    SpeedButton16: TSpeedButton;
    Panel12: TPanel;
    Shape17: TShape;
    SpeedButton17: TSpeedButton;
    Panel13: TPanel;
    Shape18: TShape;
    SpeedButton18: TSpeedButton;
    PnlEdits: TPanel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    FlowPanel1: TFlowPanel;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    FClientWidthInicial: Integer;
    procedure AjustarTamanhoComponentes(AComponentPai: TComponent);
    procedure SetEscalaResolucaoTotalTela;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

procedure TForm4.AjustarTamanhoComponentes(AComponentPai: TComponent);
var
  LCountPanel: Integer;
  LClientWidthDiferenca: Integer;
  LWidthDistribuida: Integer;
  LLarguraInicialComponentePai: Integer;
  LFormula: Extended;
  LFormulaString: string;
begin

  LCountPanel := TWinControl(AComponentPai).ControlCount;
  LLarguraInicialComponentePai := TWinControl(AComponentPai).Width;
//  if ClientWidth <= FClientWidthInicial then                                       Round(LClientWidthDiferenca / LCountPanel)
//    LClientWidthDiferenca := FClientWidthInicial - ClientWidth
//  else
//    LClientWidthDiferenca := ClientWidth - FClientWidthInicial;
  for var I := 0 to Pred(LCountPanel) do
    if (TWinControl(AComponentPai).Controls[I].GetParentComponent.Name = TWinControl(AComponentPai).Name) then
    begin
      if ClientWidth = FClientWidthInicial then
      begin
        Exit;
//        LClientWidthDiferenca := ClientWidth - FClientWidthInicial;
//        TWinControl(AComponentPai).Controls[I].Width := ((TWinControl(AComponentPai).Controls[I].Width * 2) - Round(LClientWidthDiferenca / (LCountPanel div 2)) - TWinControl(AComponentPai).Controls[I].Width) ;
      end
      else if ClientWidth > FClientWidthInicial then
      begin
//
//
//        LClientWidthDiferenca := LLarguraInicialComponentePai - FClientWidthInicial;
////
//        if (ClientWidth mod LCountPanel) = 0 then
//          LWidthDistribuida := 1
//        else
//        begin
//          LWidthDistribuida := 0;
////          LClientWidthDiferenca := 0;
//        end;
////

////        TWinControl(AComponentPai).Controls[I].Width := ((TWinControl(AComponentPai).Controls[I].Width) - Round(LClientWidthDiferenca / (LCountPanel div 2)) - TWinControl(AComponentPai).Controls[I].Width) ;
//        TWinControl(AComponentPai).Controls[I].Width :=  TWinControl(AComponentPai).Controls[I].Width + LWidthDistribuida;
        LFormula                  := (TWinControl(AComponentPai).Controls[I].Width * ClientWidth) / FClientWidthInicial;
        LFormulaString := FormatFloat('#,###.###', LFormula) ;
        LClientWidthDiferenca     :=  LFormulaString.Replace(',', '', []).ToInt64 mod LCountPanel;
//        TWinControl(AComponentPai).Controls[I].Width := TWinControl(AComponentPai).Controls[I].Width + LClientWidthDiferenca;
                  Self.OnResize := nil;
                 ScaleBy(ClientWidth+LClientWidthDiferenca, ClientWidth);
                 ClientWidth := ClientWidth+LClientWidthDiferenca;
                 Application.ProcessMessages;
                 LockWindowUpdate(0);
                  Self.OnResize := FormResize;
      end
      else
      begin
        LClientWidthDiferenca := (Round(ClientWidth / LCountPanel) - TWinControl(AComponentPai).Controls[I].Width);
        if LClientWidthDiferenca < 0 then
          LClientWidthDiferenca := LClientWidthDiferenca * - 1;

        TWinControl(AComponentPai).Controls[I].Width := TWinControl(AComponentPai).Controls[I].Width - LClientWidthDiferenca + 2;
      end;
    end;


//  for var I := 0 to Pred(LCountPanel) do
//    if (TWinControl(AComponentPai).Controls[I].GetParentComponent is TWinControl) then
//      TWinControl(AComponentPai).Controls[I].Width := (Round(TWinControl(AComponentPai).Width / (LCountPanel / 2)) div 2) - 2;
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
  FClientWidthInicial := ClientWidth;

end;

procedure TForm4.FormResize(Sender: TObject);
begin
//
//  AjustarTamanhoComponentes(PnlEdits);
//  AjustarTamanhoComponentes(PnlBotoes);
//  AjustarTamanhoComponentes(Panel1);
end;

procedure TForm4.SetEscalaResolucaoTotalTela;
begin
  var ScreenWidth    := Screen.Width;
  var ScreenHeight   := Screen.Height;
  Scaled             := True;
  if (Screen.Width <> ClientWidth) then
  begin
    Height    := Longint(Height) * Longint(Screen.height) DIV ScreenHeight;
    Width     := Longint(Width)  * Longint(Screen.width)  DIV ScreenWidth;
    ScaleBy(Screen.Width, ClientWidth);
  end;
  WindowState := TWindowState.wsMaximized;
end;

procedure TForm4.SpeedButton1Click(Sender: TObject);
begin
ShowMessage(Edit1.Width.ToString)
end;

end.
