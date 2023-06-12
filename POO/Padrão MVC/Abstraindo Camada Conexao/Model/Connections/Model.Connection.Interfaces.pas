unit Model.Connection.Interfaces;

interface

uses
  FireDAC.Comp.Client, System.Classes, FireDAC.Stan.Param, Data.DB,
  Vcl.DBCtrls, Vcl.DBGrids, System.TypInfo;

type
  IModelConnectionsGeneric = interface
    ['{92B44097-0E9C-402C-AB0F-80DAD08A79DC}']

    procedure Close;
    function Connection: TCustomConnection;
    function GetDataSet: TDataSet;
    function ParamByName(AValue: String): TCollectionItem;
    function FieldByName(AValue: String): TField;
    function SQL: TStrings;
    function Open: IModelConnectionsGeneric ; overload;
    function Open(AValue: String): IModelConnectionsGeneric ; overload;
    function DBNavigator(const ADBNavigator: TDBNavigator): IModelConnectionsGeneric;
    function DBGrid(const ADBGrid: TDBGrid): IModelConnectionsGeneric;
  end;

implementation

end.
