unit Regra.Parametros;

interface

uses
  Regra.Interfaces;

type
  TRegraParametros = class(TInterfacedObject, iRegrasParametros)
  private
  public
  constructor Create(aParent: iRegras);
  destructor Destroy; override;
  class function New(aParent: iRegras): iRegrasParametros;

  end;

implementation


end.