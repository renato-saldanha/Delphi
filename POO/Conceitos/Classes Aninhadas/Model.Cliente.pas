unit Model.Cliente;

interface

uses
  System.SysUtils,  Model.Pessoa, Vcl.Dialogs;

type
  TCliente = class(TPessoa)

  type
    TCredito = class
    private
      FValorCredito: Currency;
        procedure SetValorCredito(const Value: Currency);

    public
      property ValorCredito: Currency read FValorCredito write SetValorCredito;
    end;

  private
    procedure Cadastrar(Pessoa: TPessoa); override;

  public
    constructor Create();
    class var IDCliente: Integer;
    class procedure MostrarID();

  end;

var
  Credito: TCliente.TCredito;

implementation


procedure TCliente.Cadastrar(Pessoa: TPessoa);
begin
  inherited;
  Pessoa.Nome               := 'Renato';
  Pessoa.Endereco.Bairro    := 'Duque de Caxias 2';
  Pessoa.Endereco.Cidade    := 'Cuiabá';
//  Pessoa.Endereco.Estado    := 'Mato Grosso';
  Pessoa.Telefone           := '(65) 99271-2774';
  Credito.ValorCredito      := 1167.25;

  ShowMessage('---Cliente---' + #13 +
              'Nome: ' + Pessoa.Nome + #13 +
              'Endereço: ' + Pessoa.Endereco.Bairro + #13 +
              'Cidade: ' + Pessoa.Endereco.Cidade + #13 +
              'Estado: ' + Pessoa.Endereco.Estado + #13 +
              'Telefone: ' + Pessoa.Telefone + #13 +
              'Credito de R$: ' + CurrToStr(Credito.ValorCredito));
end;


constructor TCliente.Create;
begin
  inherited;
  Credito:= TCliente.TCredito.Create;
end;

class procedure TCliente.MostrarID;
begin
  ShowMessage('ID:' + IntToStr(IDCliente))
end;

{ TCliente.TCredito }

procedure TCliente.TCredito.SetValorCredito(const Value: Currency);
begin
  FValorCredito := Value;
end;

end.
