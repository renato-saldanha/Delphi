unit Pessoa;

interface

uses
  DAO.RTTI;

type

  [TableName('PESSOAS')]
  TPessoa = class
  private
    FNome: string;
    FSobreNome: string;
    FCodigo: string;
  public
    [FieldType(tpPK)]
    property Codigo: Integer read FCodigo write FCodigo;
    [FieldType(tpString)]
    property Nome: string read FNome write FNome;
    [FieldType(tpString)]
    property SobreNome: string read FSobreNome write FSobreNome;

  end;

implementation

end.
