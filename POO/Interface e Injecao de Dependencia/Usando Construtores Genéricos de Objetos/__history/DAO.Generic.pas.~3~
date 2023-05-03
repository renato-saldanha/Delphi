unit DAO.Generic;

interface

uses
  Interfaces;

type
  TDAOGeneric<T: class> = class(TInterfacedObject, iDAOInterface<T>)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iDAOInterface<T>;
    procedure Insert(aClass: T);
    procedure Delete(aClass: T);
    procedure Update(aClass: T);
  end;

implementation

{ TDAOGeneric<T> }

constructor TDAOGeneric<T>.Create;
begin
//
end;

procedure TDAOGeneric<T>.Delete(aClass: T);
begin
  //
end;

class function TDAOGeneric<T>.New: iDAOInterface<T>;
begin
  Result := Self.Create;
end;

destructor TDAOGeneric<T>.Destroy;
begin

  inherited;
end;

procedure TDAOGeneric<T>.Insert(aClass: T);
begin
  //
end;

procedure TDAOGeneric<T>.Update(aClass: T);
begin
  //
end;

end.
