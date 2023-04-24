unit Model.Celular;

interface

uses
 Vcl.Dialogs;

type
  TCelular = class
    function CriarCelular: TCelular;


    procedure Ligar();

    private
    FNumero: String;
    procedure SetNumero(const Value: String);

    public
      property Numero: String read FNumero write SetNumero;
    protected


    strict private        // reserva atributo somente a classe pertencente
      FNome: String;
  end;

  TCelular2 = class
    procedure CriarCelular2(FNumero: String);
  end;

implementation
function TCelular.CriarCelular: TCelular;
begin

end;

procedure TCelular.Ligar();
begin
  ShowMessage('Ligou para o cliente: ' + FNumero);
end;

procedure TCelular.SetNumero(const Value: String);
begin
  FNumero := Value;
end;

{ TCelular2 }

procedure TCelular2.CriarCelular2(FNumero: String);
begin
  //FNome:= 're';
end;

end.
