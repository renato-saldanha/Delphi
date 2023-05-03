unit Interfaces;

interface

type
  iDAOInterface<T: class, constructor> = interface
    ['{9E59DA80-0DC2-4E51-9B74-A498EEC28D2F}']

      procedure Insert();
      procedure Delete();
      procedure Update();

      function this: T;
  end;

implementation

end.
