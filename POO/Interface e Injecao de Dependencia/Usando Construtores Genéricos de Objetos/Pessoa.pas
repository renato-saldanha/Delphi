unit Pessoa;

interface
type
  TPessoa = class
    private
    FNome: string;
    FSobreNome: string;
    public
      property Nome: string read FNome write FNome;
      property SobreNome: string read FSobreNome write FSobreNome;

  end;

implementation

end.
