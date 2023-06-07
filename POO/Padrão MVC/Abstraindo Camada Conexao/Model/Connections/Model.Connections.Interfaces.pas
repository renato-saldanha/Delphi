unit Model.Connections.Interfaces;

interface

uses
  FireDAC.Comp.Client, System.Classes, FireDAC.Stan.Param, Data.DB,
  Vcl.DBCtrls, Vcl.DBGrids;

type
  IModelConnectionsGeneric = interface
    ['{92B44097-0E9C-402C-AB0F-80DAD08A79DC}']

    procedure Close;
    function Connection: TFDConnection;
    function GetDataSet: TFDQuery;
    function SQL: TStrings;
    function ParamByName(AValue: String): TFDParam;
    function FieldByName(AValue: String): TField;
    function Open: TDataset; overload;
    function Open(AValue: String): TDataset; overload;
    function DBNavigator(const ADBNavigator: TDBNavigator): IModelConnectionsGeneric;
    function DBGrid(const ADBGrid: TDBGrid): IModelConnectionsGeneric;
  end;

  IModelConnections = interface
    ['{2377BB56-A36B-4A7F-A5C8-2FABA18BFCF2}']
    function FireDac: IModelConnectionsGeneric;
  end;

implementation

end.
