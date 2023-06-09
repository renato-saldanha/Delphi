unit Model.Pessoa;

interface

uses
  System.SysUtils, Model.Endereco;

type
  TPessoa = class
  private
    FNome: String;
    FEndereco: TEndereco;
    FTelefone: String;
    FDataNascimento: TDateTime;

    procedure SetNome(const Endereco: String);
    procedure SetTelefone(const Endereco: String);

    procedure SetDataNascimento(const Endereco: TDateTime); overload;
    procedure SetDataNascimento(const Endereco: String); overload;

  public
    constructor Create();
    destructor Destroy();  override;

    property Nome: String read FNome write SetNome;
    property Endereco: TEndereco read FEndereco write FEndereco;
    property Telefone: String read FTelefone write SetTelefone;
    property DataNascimento: TDateTime read FDataNascimento write SetDataNascimento;

  published   //mostra property em tempo de design
     procedure Cadastrar(Pessoa: TPessoa); virtual;  abstract; //For�a ser implementado somente em classes filhas
  end;

implementation

{ TCliente }

constructor TPessoa.Create;
begin
  inherited;
  Self.Endereco:= TEndereco.Create;
end;

destructor TPessoa.Destroy;
begin
  inherited;

  FreeAndNil(FEndereco);
end;

procedure TPessoa.SetDataNascimento(const Endereco: String);
begin
  FDataNascimento := StrToDateTime(Endereco);
end;

procedure TPessoa.SetDataNascimento(const Endereco: TDateTime);
begin
  FDataNascimento := Endereco;
end;

procedure TPessoa.SetNome(const Endereco: String);
begin
  FNome := Endereco;
end;

procedure TPessoa.SetTelefone(const Endereco: String);
begin
  FTelefone := Endereco;
end;

end.
