unit Model.Services.Interfaces;

interface

type
  IModelServicesGeneric = interface
    ['{E1B34F1B-0781-4904-AB10-E1EF8C7E83B8}']
  end;

  IModelServices = interface
    ['{959C41C8-59EC-4035-B449-09318C95523D}']
    function Boletos: IModelServicesGeneric;
    function NFe: IModelServicesGeneric;
    function NFSe: IModelServicesGeneric;
  end;

implementation

end.
