unit Model.Cliente;

interface
uses
  Vcl.Dialogs, Model.Pessoa;

type

  TCliente = class(TPessoa)


  public
    procedure CadastrarCliente(Pessoa: TPessoa); override;

    function EnderecoCompleto(): String; override; final;
  end;

  TClienteEspecial = class(TCliente)

  private

      function EnderecoCompleto(): String; override;
  end;


implementation

procedure TCliente.CadastrarCliente(Pessoa: TPessoa);
begin
  inherited;
  Pessoa.Nome        := 'Renato';
  Pessoa.Endereco    := 'Generial Irineu de Souza';
  Pessoa.Bairro      := 'Duque de Caxias 2';
  Pessoa.Telefone    := '(65) 99271-2774';

  ShowMessage('Nome: ' + Pessoa.Nome + #13 +
              'Endere�o: ' + Pessoa.Endereco + #13 +
              'Bairro: ' + Pessoa.Bairro + #13 +
              'Cidade: ' + Pessoa.Cidade + #13 +
              'Telefone: ' + Pessoa.Telefone + #13 +
              'Bairro: ' + Pessoa.Bairro + #13 +
              'Cidade: ' + Pessoa.Cidade + #13 +
              'Telefone: ' + Pessoa.Telefone);
end;

function TCliente.EnderecoCompleto: String;
begin
    Result := Endereco + ', ' + Bairro + ','+  Cidade;
end;

{ TClienteEspecial }

function TClienteEspecial.EnderecoCompleto: String;
begin
//
end;

end.
