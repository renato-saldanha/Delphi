unit Produto;

interface
type
  TProduto = class
    private
    FNome: string;
    FMarca: string;
    public
      property Nome: string read FNome write FNome;
      property Marca: string read FMarca write FMarca;
  end;
implementation

end.
