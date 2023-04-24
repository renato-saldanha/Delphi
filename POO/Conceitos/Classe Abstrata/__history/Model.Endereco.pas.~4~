unit Model.Endereco;

interface

type
  TEndereco = class

  constructor Create;
  private
    FBairro: String;
    FCidade: string;
    FEstado: String;
    procedure SetBairro(const Value: String);
    procedure SetCidade(const Value: String);
    procedure SetEstado(const Value: String);
  public
    property Bairro: String read FBairro write SetBairro;
    property Cidade: String read FCidade write SetCidade;
    property Estado: String  read FEstado write SetEstado;
  end;

implementation

{ TEndereco }

constructor TEndereco.Create;
begin
  Estado:= 'Mato Grosso';
end;

procedure TEndereco.SetBairro(const Value: String);
begin
  FBairro := Value;
end;

procedure TEndereco.SetCidade(const Value: String);
begin
  FCidade := Value;
end;

procedure TEndereco.SetEstado(const Value: String);
begin
  FEstado := Value;
end;

end.
