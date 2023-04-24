unit Model.Cliente;

interface

uses
  Vcl.Dialogs, System.SysUtils;

type
  TCliente = class

  constructor Create;

  private
    FNome: String;
    FEndereco: String;
    FTelefone: String;
    FBairro: String;
    FCidade: string;
    FDataNascimento: TDateTime;

    procedure SetEndereco(const Value: String);
    procedure SetNome(const Value: String);
    procedure SetTelefone(const Value: String);
    procedure SetBairro(const Value: String);
    procedure SetCidade(const Value: string);
    procedure SetDataNascimento(const Value: TDateTime); overload;
    procedure SetDataNascimento(const Value: String); overload;

  public
    property Nome: String read FNome write SetNome;
    property Endereco: String read FEndereco write SetEndereco;
    property Telefone: String read FTelefone write SetTelefone;
    property Bairro: String read FBairro write SetBairro;
    property Cidade: string read FCidade write SetCidade;
    property DataNascimento: TDateTime read FDataNascimento write SetDataNascimento;


  published
    procedure CadastrarCliente(Cliente: TCliente);
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

procedure TCliente.SetDataNascimento(const Value: String);
begin
  FDataNascimento := StrToDateTime(Value);
end;

procedure TCliente.SetDataNascimento(const Value: TDateTime);
begin
  FDataNascimento := Value;
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

procedure TCliente.CadastrarCliente(Cliente: TCliente);
begin
  Cliente.Nome        := 'Renato';
  Cliente.Endereco    := 'Generial Irineu de Souza';
  Cliente.Bairro      := 'Duque de Caxias 2';
  Cliente.Telefone    := '(65) 99271-2774';

  ShowMessage('Nome: ' + Cliente.Nome + #13 +
              'Endere�o: ' + Cliente.Endereco + #13 +
              'Bairro: ' + Cliente.Bairro + #13 +
              'Cidade: ' + Cliente.Cidade + #13 +
              'Telefone: ' + Cliente.Telefone + #13 +
              'Bairro: ' + Cliente.Bairro + #13 +
              'Cidade: ' + Cliente.Cidade + #13 +
              'Telefone: ' + Cliente.Telefone);
end;

end.
