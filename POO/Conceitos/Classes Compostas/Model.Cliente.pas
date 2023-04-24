unit Model.Cliente;

interface

uses
  System.SysUtils,  Model.Pessoa, Vcl.Dialogs;

type
  TCliente = class(TPessoa)

  private
    procedure Cadastrar(Pessoa: TPessoa); override;
  public
      class var IDCliente: Integer;
      class procedure MostrarID();
  end;

implementation

procedure TCliente.Cadastrar(Pessoa: TPessoa);
begin
  inherited;
  Pessoa.Nome               := 'Renato';
  Pessoa.Endereco.Bairro    := 'Duque de Caxias 2';
  Pessoa.Endereco.Cidade    := 'Cuiab�';
//  Pessoa.Endereco.Estado    := 'Mato Grosso';
  Pessoa.Telefone           := '(65) 99271-2774';

  ShowMessage('---Cliente---' + #13 +
              'Nome: ' + Pessoa.Nome + #13 +
              'Endere�o: ' + Pessoa.Endereco.Bairro + #13 +
              'Cidade: ' + Pessoa.Endereco.Cidade + #13 +
              'Estado: ' + Pessoa.Endereco.Estado + #13 +
              'Telefone: ' + Pessoa.Telefone);
end;


class procedure TCliente.MostrarID;
begin
  ShowMessage('ID:' + IntToStr(IDCliente))
end;

end.
