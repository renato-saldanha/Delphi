unit Model.Pedido;

interface
uses

  System.SysUtils, Vcl.Dialogs;

type

//  *****Dominio Anemico******
//  TPedido = class
//    FNumero: Integer;
//    FValorTotal: Currency;
//    FValorDesconto: Currency;
//  end;
//
//  TPedidoService = class
//    procedure VenderItem(Valor: Currency);
//    procedure ConcederDesconto(Valor: Currency);
//  end;

//  *****Dominio Rico******
  TPedido = class
  private
    FNumero: Integer;
    FValorTotal: Currency;
    FValorDesconto: Currency;
  public
    constructor Create(Numero: Integer);
    function GetNumero: Integer;
    function GetValorTotal: Currency;
    function GetValorDesconto: Currency;

    procedure VenderItem(Valor: Currency);
    procedure ConcederDesconto(Valor: Currency);
  end;


implementation

{ TPedidoService }

procedure TPedido.ConcederDesconto(Valor: Currency);
begin
  ShowMessage('Desconto de R$' + CurrToStr(Valor));
end;

procedure TPedido.VenderItem(Valor: Currency);
begin
  ShowMessage('Valor de venda: R$' + CurrToStr(Valor));
end;

{ TPedido }

constructor TPedido.Create(Numero: Integer);
begin
  Inc(Numero);
end;

function TPedido.GetNumero: Integer;
begin
  Result:= FNumero;
end;

function TPedido.GetValorDesconto: Currency;
begin
  Result:= FValorDesconto;
end;

function TPedido.GetValorTotal: Currency;
begin
  Result:= FValorTotal;
end;

end.
