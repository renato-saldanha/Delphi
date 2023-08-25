 program API;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  Horse,
  Horse.Jhonson,
  Horse.HandleException,
  Horse.BasicAuthentication,
  Provider.Conexao in 'src\Providers\Provider.Conexao.pas' {Conexao: TDataModule},
  Controller.Cliente in 'src\Controller\Controller.Cliente.pas',
  Services.Cliente in 'src\Services\Services.Cliente.pas' {ServiceCliente: TDataModule},
  App.Util in '..\Uteis\App.Util.pas';

begin
  try
    THorse
      .Use(Jhonson())
      .Use(HandleException)
      .Use(HorseBasicAuthentication(
        function(const AUsername, APassword: string): Boolean
        begin
          Result := AUsername.Equals('renato') and APassword.Equals('123');
        end));

    Registry;

    THorse.Listen(9000);
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

end.