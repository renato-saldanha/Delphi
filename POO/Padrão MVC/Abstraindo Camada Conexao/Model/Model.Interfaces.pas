unit Model.Interfaces;

interface

uses
  Model.Connection.Interfaces, Data.DB;

type
  IModel = Interface
    ['{CE1D1B3E-C63F-40F9-9FB7-BCB4A0716334}']
    function DataSet: IModelConnectionsGeneric;
  End;

implementation

end.
