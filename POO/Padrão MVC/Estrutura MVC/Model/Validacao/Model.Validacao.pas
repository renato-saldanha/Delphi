unit Model.Validacao;

interface

uses
  Model.Validacao.Interfaces, Vcl.StdCtrls,
  System.SysUtils, System.Variants, Model.CEP, Model.Component.Interfaces;

type
  TModelValidacao = class(TInterfacedObject, IModelValidacao)
  private
    FEditValidacao: TCustomEdit;
    FCEP: IModelCEP;
    FComponente: IModelComponente;
    procedure SetComponente(const Value: IModelComponente);
  public
    class function New: IModelValidacao;
    constructor Create;
    destructor Destroy; override;

    function NotNull: IModelComponente;
    function CEP: IModelComponente;
    function &End: IModelComponente;

    property Componente: IModelComponente read FComponente write SetComponente;
  end;

implementation

{ TModelValidacao }

constructor TModelValidacao.Create;
begin

end;

destructor TModelValidacao.Destroy;
begin

  inherited;
end;

class function TModelValidacao.New: IModelValidacao;
begin
  Result := Self.Create;
end;

function TModelValidacao.&End: IModelComponente;
var
  LValor: Variant;
begin
  Result := Self;

  LValor := StringReplace(FEditValidacao.Text, '-', '', [rfReplaceAll]).Replace('.', '').Replace('_', '');
  if (LValor = '') or (LValor = null) then
  begin
    FEditValidacao.SetFocus;
    raise Exception.Create('Campo ' + Copy(FEditValidacao.Name, 4, Length(FEditValidacao.Name) - 1) +
      ' não pode ser nulo!');
  end;

  if Assigned(FCEP) then
    FCEP.CEPValido(FEditValidacao);
end;

function TModelValidacao.CEP: IModelComponente;
begin
  Result := Self;
  FCEP := TModelCEP.New;
end;

function TModelValidacao.NotNull: IModelComponente;
begin
  Result := Self;
end;

procedure TModelValidacao.SetComponente(const Value: IModelComponente);
begin
  FComponente := Value;
end;

end.
