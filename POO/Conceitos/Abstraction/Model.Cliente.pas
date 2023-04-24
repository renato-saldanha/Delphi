unit Model.Cliente;

interface

uses
  Vcl.Dialogs;

type
  TCliente = class

  constructor Create;

  private
    FNome: String;
    FEndereco: String;
    FTelefone: String;
    FBairro: String;
    FCidade: string;

    procedure SetEndereco(const Value: String);
    procedure SetNome(const Value: String);
    procedure SetTelefone(const Value: String);
    procedure SetBairro(const Value: String);
    procedure SetCidade(const Value: string);

  public
    property Nome: String read FNome write SetNome;
    property Endereco: String read FEndereco write SetEndereco;
    property Telefone: String read FTelefone write SetTelefone;
    property Bairro: String read FBairro write SetBairro;
    property Cidade: string read FCidade write SetCidade;


  published

  end;

implementation

{ TCliente }

constructor TCliente.Create;
begin
  FCidade:= 'Cuiab�';
end;

procedure TCliente.SetBairro(const Value: String);
begin
  FBairro := Value;
end;

procedure TCliente.SetCidade(const Value: string);
begin
  FCidade := Value;
end;

procedure TCliente.SetEndereco(const Value: String);
begin
  FEndereco := Value;
end;

procedure TCliente.SetNome(const Value: String);
begin
  FNome := Value;
end;

procedure TCliente.SetTelefone(const Value: String);
begin
  FTelefone := Value;
end;

end.
