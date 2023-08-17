unit Controller.Cliente;

interface

uses
  System.JSON, DataSet.Serialize, SysUtils, StrUtils,
  Horse, Services.Cliente, Horse.Exception;

procedure Registry;
procedure InserirCliente(Req: THorseRequest; Res: THorseResponse; Next: TProc);
procedure GetClientes(Req: THorseRequest; Res: THorseResponse; Next: TProc);
procedure GetClienteByDescricao(Req: THorseRequest; Res: THorseResponse; Next: TProc);
procedure DeletarCliente(Req: THorseRequest; Res: THorseResponse; Next: TProc);

implementation


procedure InserirCliente(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LService: TServiceCliente;
begin
  LService := TServiceCliente.Create(nil);

  try
    Res
      .Send<TJSONObject>(LService.Inserir(Req.Body<TJSONObject>).ToJSONObject())
      .Status(THTTPStatus.Created);
  finally
    LService.Free;
  end;
end;

procedure GetClientes(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LService: TServiceCliente;
begin
  LService := TServiceCliente.Create(nil);

  try
    Res
      .Send<TJSONArray>(LService.GetClientes.ToJSONArray)
      .Status(THTTPStatus.OK);
  finally
    LService.Free;
  end;

end;

procedure DeletarCliente(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LService: TServiceCliente;
  LDescricao: String;
begin
  LService := TServiceCliente.Create(nil);
  try
    LDescricao := Req.Params.Items['nome'];
    if LService.GetClienteByDescricao(LDescricao).IsEmpty then
      raise EHorseException.New
              .Status(THTTPStatus.NotFound)
              .Title('Cliente não existe!');
    if LService.Excluir(LDescricao) then
      Res.Status(THTTPStatus.NoContent);
  finally
    LService.Free;
  end;
end;

procedure AlterarCliente(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LService: TServiceCliente;
  LDescricao: String;
begin
  LService := TServiceCliente.Create(nil);
  try
    LDescricao := Req.Params.Items['nome'];
    if LService.GetClienteByDescricao(LDescricao).IsEmpty then
      raise EHorseException.New
              .Status(THTTPStatus.NotFound)
              .Title('Cliente não existe!');
    if LService.Alterar(Req.Body<TJSONObject>) then
      Res.Status(THTTPStatus.NoContent);
  finally
    LService.Free;
  end;
end;

procedure GetClienteByDescricao(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LService: TServiceCliente;
  LDescricao: String;
begin
  LService := TServiceCliente.Create(nil);

  try
    LDescricao := Req.Params.Items['nome'];
    Res
      .Send<TJSONObject>(LService.GetClienteByDescricao(LDescricao).ToJSONObject)
      .Status(THTTPStatus.OK);
  finally
    LService.Free;
  end;

end;

procedure Registry;
begin
  THorse.Delete('/clientes/:nome',  DeletarCliente);
  THorse.Get('/clientes/:nome',  GetClienteByDescricao);
  THorse.Put('/clientes/:nome',  AlterarCliente);
  THorse.Get('/clientes', GetClientes);
  THorse.Post('/clientes', InserirCliente);
end;

end.
