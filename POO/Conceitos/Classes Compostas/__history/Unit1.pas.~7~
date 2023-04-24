unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Model.Cliente;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    procedure CadastrarCliente(VNome, VEndereco, VTelefone: String);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  CadastrarCliente('Renato',
                   'Generial Irineu de Souza',
                   '(65) 99271-2774');
end;


procedure TForm1.Button2Click(Sender: TObject);
var
  Cliente: TCliente;
begin
//  try
//    Cliente:= TCliente.Create;
//    Cliente.TestePro
//    Cliente.CadastrarCliente(Cliente);
//  finally
//    FreeAndNil(Cliente);
//  end;



  TCliente.IDCliente:= 15;
  TCliente.MostrarID();
end;

procedure TForm1.CadastrarCliente(VNome, VEndereco, VTelefone: String);
var
  ListaCliente: TStringList;
begin
  ListaCliente:= TStringList.Create;

  try
    ListaCliente.Add('Nome: ' + VNome);
    ListaCliente.Add('Endereço: ' + VEndereco);
    ListaCliente.Add('Telefone: ' + VTelefone);
    ShowMessage(ListaCliente[0] + #13 +
                ListaCliente[1] + #13 +
                ListaCliente[2])
  finally
    FreeAndNil(ListaCliente);
  end;


end;

end.

