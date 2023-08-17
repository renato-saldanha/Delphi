
unit RecordsVariant;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, TypInfo;

type
  TCargo = (cAjudanteCozinha, cGerente, cAuxiliarLimepza);
  TSetor = (sCozinha, sGerencial, sLimpeza);
  TFuncionario = record
    FCodigo: Integer;
    FNome: String;
    case Cargo: TCargo of
      cGerente          : (ACargaHoraria: Double; ASetor: TSetor; AAtribuiFunção: Boolean);
      cAjudanteCozinha  : (CargaHoraria: Double; FSetor: TSetor);
      cAuxiliarLimepza  : (ACarga: Double; Setor: TSetor);
    end;

  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    function GetGerente: TFuncionario;
    function GetAuxLimpeza: TFuncionario;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

{ TForm2 }

procedure TForm2.Button1Click(Sender: TObject);
begin
  GetGerente;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  GetAuxLimpeza;
end;

function TForm2.GetAuxLimpeza: TFuncionario;
var
  LFuncionario: TFuncionario;
begin
  LFuncionario.FCodigo        := 1;
  LFuncionario.FNome          := 'Renato';
  LFuncionario.Cargo          := cAjudanteCozinha;
  LFuncionario.ACargaHoraria  := 8.4 ;
  LFuncionario.Setor          := sCozinha;

  showmessage(IntToStr(LFuncionario.FCodigo) + sLineBreak +
              LFuncionario.FNome + sLineBreak +
              GetEnumName(TypeInfo(TCargo), Integer(LFuncionario.Cargo)) + sLineBreak +
              FloatToStr(LFuncionario.ACargaHoraria) + sLineBreak +
              GetEnumName(TypeInfo(TSetor), Integer(LFuncionario.Setor)));

  //Os 2 primeiros atributos podem ser acessados por qualquer nome colocado em qualquer um dos 3 cargos
end;

function TForm2.GetGerente: TFuncionario;
var
  LFuncionario: TFuncionario;
begin
  LFuncionario.FCodigo        := 2;
  LFuncionario.FNome          := 'Renato';
  LFuncionario.Cargo          := cGerente;
  LFuncionario.ACargaHoraria  := 11;
  LFuncionario.Setor          := sGerencial;
  LFuncionario.AAtribuiFunção := True;
  //Os 2 primeiros atributos podem ser acessados por qualquer nome colocado em qualquer um dos 3 cargos
end;

end.
