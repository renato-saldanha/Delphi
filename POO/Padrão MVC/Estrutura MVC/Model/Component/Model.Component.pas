unit Model.Component;

interface

uses
  Model.Component.Interfaces;

type
  TModelComponent = class(TINterfacedObject, IModelComponente)
    private
    public
    class function New: IModelComponente;
    constructor Create;
    destructor Destroy; override;

    function &End: IController;
  end;
implementation

end.
