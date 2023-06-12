unit Model.Interfaces;

interface

uses
  Model.Connections.Interfaces;

type
  IModel = Interface
    ['{CE1D1B3E-C63F-40F9-9FB7-BCB4A0716334}']
    function Connections: IModelConnections;
  End;

implementation

end.
