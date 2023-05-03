unit DAO.Generic;

interface

uses
  Interfaces;

type
  TDAOGeneric<T: class, constructor> = class(TInterfacedObject, iDAOInterface<T>)
  private
    FEntidade: T;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iDAOInterface<T>;
    procedure Insert();
    procedure Delete();
    procedure Update();

    function this: T;
  end;

implementation

{ TDAOGeneric<T> }

constructor TDAOGeneric<T>.Create;
begin
  FEntidade := T.Create;
end;

class function TDAOGeneric<T>.New: iDAOInterface<T>;
begin
  Result := Self.Create;
end;

function TDAOGeneric<T>.this: T;
begin
  Result := FEntidade;
end;

destructor TDAOGeneric<T>.Destroy;
begin
  FEntidade.Free;
  inherited;
end;

procedure TDAOGeneric<T>.Delete();
begin
  //
end;

procedure TDAOGeneric<T>.Insert();
begin
  ///
end;

procedure TDAOGeneric<T>.Update();
begin
  //
end;

end.
