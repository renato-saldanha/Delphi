program PrjObjectToJSON;

uses
  Vcl.Forms,
  Principal in 'Principal.pas' {Form2},
  Model.Produto in 'Model\Model.Produto.pas',
  Model.Produto.Interfaces in 'Model\Model.Produto.Interfaces.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
