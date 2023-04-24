unit Model.Pessoa;

interface

uses
  System.SysUtils;

type
  TPessoa = class

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

  published   //mostra property em tempo de design
     procedure CadastrarCliente(Pessoa: TPessoa); virtual;  abstract; //For�a ser implementado somente em classes filhas
  end;

implementation

{ TCliente }

constructor TPessoa.Create;
begin
  FCidade:= 'Cuiab�';
end;

function TPessoa.EnderecoCompleto: String;
begin
  Result := FEndereco + ', ' + FBairro;
end;

procedure TPessoa.SetBairro(const Value: String);
begin
  FBairro := Value;
end;

procedure TPessoa.SetCidade(const Value: string);
begin
  FCidade := Value;
end;

procedure TPessoa.SetDataNascimento(const Value: String);
begin
  FDataNascimento := StrToDateTime(Value);
end;

procedure TPessoa.SetDataNascimento(const Value: TDateTime);
begin
  FDataNascimento := Value;
end;

procedure TPessoa.SetEndereco(const Value: String);
begin
  FEndereco := Value;
end;

procedure TPessoa.SetNome(const Value: String);
begin
  FNome := Value;
end;

procedure TPessoa.SetTelefone(const Value: String);
begin
  FTelefone := Value;
end;

end.
