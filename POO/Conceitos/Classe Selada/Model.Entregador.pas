unit Model.Entregador;

interface

uses
  Model.Pessoa;

type
  TEntregador = class sealed(TPessoa)  //Classe n�o poder� ser herdada de outra unit
    private
    public
    procedure Cadastrar(Pessoa: TPessoa);
  end;

implementation

{ TEntregador }

procedure TEntregador.Cadastra(Pessoa: TPessoa)
begin
//
end;

end.
