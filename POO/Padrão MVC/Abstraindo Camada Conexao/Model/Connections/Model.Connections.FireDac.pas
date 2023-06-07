unit Model.Connections.FireDac;

interface

uses
  FireDac.Stan.Intf, FireDac.Stan.Option, FireDac.Stan.Error,
  FireDac.UI.Intf, FireDac.Phys.Intf, FireDac.Stan.Def, FireDac.Stan.Pool, FireDac.Stan.Async, FireDac.Phys,
  FireDac.VCLUI.Wait, FireDac.DatS, FireDac.DApt.Intf, FireDac.DApt, FireDac.Comp.DataSet,
  FireDac.Comp.Client, FireDAC.Phys.FBDef, FireDAC.Phys.IBBase, FireDAC.Phys.FB,
  Model.Connections.Interfaces, System.Classes, FireDAC.Stan.Param, Data.DB,
  Vcl.DBCtrls, Vcl.DBGrids;

type
  TModelConnectionsFireDac = class(TInterfacedObject, IModelConnectionsGeneric)
  private
    FConnection: TFDConnection;
    FPhysDriverFB: TFDPhysFBDriverLink;
    FQry: TFDQuery;
    FDataSource: TDataSource;
    procedure ConnectionConfig;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IModelConnectionsGeneric;

    procedure Close;
    function Connection: TFDConnection;
    function GetDataSet: TFDQuery;
    function SQL: TStrings;
    function ParamByName(AValue: String) : TFDParam;
    function FieldByName(AValue: String) : TField;
    function Open: TDataset; overload;
    function Open(AValue: String): TDataset; overload;
    function DBNavigator(const ADBNavigator: TDBNavigator): IModelConnectionsGeneric;
    function DBGrid(const ADBGrid: TDBGrid): IModelConnectionsGeneric;
  end;

implementation

uses
  System.SysUtils;

{ TModelConnectionsFireDac }

function TModelConnectionsFireDac.Connection: TFDConnection;
begin
  Result := Self.FConnection;
end;

procedure TModelConnectionsFireDac.ConnectionConfig;
begin
  try
    FConnection.Connected             := False;
    FConnection.DriverName            := 'FB';
    FConnection.LoginPrompt           := False;
    FConnection.Params.Database       := 'D:\Renato\ReactNative\AutRemotaBackEnd\DB\DB.FDB';
    FConnection.Params.UserName       := 'SYSDBA';
    FConnection.Params.Password       := 'masterkey';
    FConnection.Connected             := True;
  except on E: Exception do
    raise Exception.Create(E.Message);
  end;
end;

constructor TModelConnectionsFireDac.Create;
begin
  FConnection         := TFDConnection.Create(nil);
  FPhysDriverFB       := TFDPhysFBDriverLink.Create(FConnection);
  ConnectionConfig();
  FQry                := TFDQuery.Create(FConnection);
  FQry.Connection     := FConnection;
  FDataSource         := TDataSource.Create(FConnection);
  FDataSource.DataSet := FQry;
end;

destructor TModelConnectionsFireDac.Destroy;
begin
  inherited;
  FreeAndNil(FQry);
  FreeAndNil(FPhysDriverFB);
  FreeAndNil(FConnection);
end;

function TModelConnectionsFireDac.GetDataSet: TFDQuery;
begin
  Result := FQry;
end;

class function TModelConnectionsFireDac.New: IModelConnectionsGeneric;
begin
  Result := Self.Create;
end;

function TModelConnectionsFireDac.Open: TDataSet;
begin
  FQry.Open;
  Result:= FQry;
end;

function TModelConnectionsFireDac.Open(AValue: String): TDataSet;
begin
  FQry.Open(AValue);
  Result:= FQry;
end;

procedure TModelConnectionsFireDac.Close;
begin
  FQry.Close;
end;

function TModelConnectionsFireDac.ParamByName(AValue: String): TFDParam;
begin
  Result := FQry.ParamByName(AValue);
end;

function TModelConnectionsFireDac.FieldByName(AValue: String) : TField;
begin
  Result := FQry.FieldByName(AValue);
end;

function TModelConnectionsFireDac.SQL: TStrings;
begin
  Result := FQry.SQL;
end;

function TModelConnectionsFireDac.DBGrid(const ADBGrid: TDBGrid): IModelConnectionsGeneric;
begin
  Result := Self;
  ADBGrid.DataSource := FDataSource;
end;

function TModelConnectionsFireDac.DBNavigator(const ADBNavigator: TDBNavigator): IModelConnectionsGeneric;
begin
  Result := Self;
  ADBNavigator.DataSource:= FDataSource;
end;

end.
