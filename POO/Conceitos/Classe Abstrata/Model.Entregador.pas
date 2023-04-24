unit Model.Entregador;

interface

uses
  Model.Pessoa;

type
  TEntregador = class sealed(TPessoa)  //Classe não poderá ser herdada de outra unit
    private
    public
    procedure Cadastrar(Pessoa: TPessoa);
  end;

implementation

{ TEntregador }

procedure TEntregador.Cadastrar(Pessoa: TPessoa);
begin
//
end;

end.
