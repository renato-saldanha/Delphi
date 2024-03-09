unit App.Controller;

interface

uses
   App.Enums, Vcl.Dialogs,  Vcl.Forms, Vcl.StdCtrls, System.SysUtils,
   App.Interfaces,
   App.Operacoes,
   App.Parametros;

type
  TBackupController = class(TInterfacedObject, iBackupController)
  private
    FOperacoes : iBackupOperacoes;
    FParametros: iBackupParametros;
  public
    class function New: iBackupController;
    constructor Create;
    destructor Destroy; override;

    function Operacoes: iBackupOperacoes;
    function Parametros: iBackupParametros;
  end;

implementation

{ TBackupController }

class function TBackupController.New: iBackupController;
begin
  Result := Self.Create;
end;

constructor TBackupController.Create;
begin

end;

destructor TBackupController.Destroy;
begin

  inherited;
end;

function TBackupController.Operacoes: iBackupOperacoes;
begin
  if not Assigned(FOperacoes) then
    FOperacoes := TBackupOperacoes.Create(Self);
  Result := FOperacoes;
end;

function TBackupController.Parametros: iBackupParametros;
begin
  if not Assigned(FParametros) then
    FParametros := TBackupParametros.Create(Self);
  Result:= FParametros;
end;

end.
