unit ProdutoDAO;

interface

uses
  Produto;
type
  TProdutoDAO = class
    private
    public
      procedure Insert(aClass: TProduto);
      procedure Delete(aClass: TProduto);
      procedure Update(aClass: TProduto);
  end;
implementation

{ TPessoaDAO }

procedure TProdutoDAO.Delete(aClass: TProduto);
begin
//
end;

procedure TProdutoDAO.Insert(aClass: TProduto);
begin
  ///
end;

procedure TProdutoDAO.Update(aClass: TProduto);
begin
     //
end;

end.

