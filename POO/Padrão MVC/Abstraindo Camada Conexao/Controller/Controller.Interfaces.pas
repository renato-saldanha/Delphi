unit Controller.Interfaces;

interface

uses
  Model.Connections.Interfaces;

type
  IController = interface
    ['{4FF03C86-5D27-4C99-B341-C7357A157874}']
    function Connections: IModelConnections;
  end;

implementation

end.
