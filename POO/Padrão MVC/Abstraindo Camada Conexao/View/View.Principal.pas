unit View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,

  Controller.Interfaces, Model.Connection.DBExpress, Controller, Model.Connection.FireDac;

type
  TFormPrincipal = class(TForm)
    DbgDBExpress: TDBGrid;
    DBNavigator: TDBNavigator;
    BtnAbrirDBExpress: TButton;
    BtnAbrirFireDac: TButton;
    DbgFireDac: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnAbrirDBExpressClick(Sender: TObject);
    procedure BtnAbrirFireDacClick(Sender: TObject);
  private
    { Private declarations }
    FController: IController;
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation


{$R *.dfm}

procedure TFormPrincipal.BtnAbrirDBExpressClick(Sender: TObject);
begin
  FController                   := TController<TModelConnectionDBExpress>.New;
  FController.DataSet
    .DBGrid(DBgDBExpress)
    .DBNavigator(DBNavigator)
    .Open('SELECT * FROM usuarios');
end;

procedure TFormPrincipal.BtnAbrirFireDacClick(Sender: TObject);
begin
  FController                   := TController<TModelConnectionFireDac>.New;
  FController.DataSet
    .DBGrid(DBgFireDac)
    .DBNavigator(DBNavigator)
    .Open('SELECT * FROM usuarios');
end;

procedure TFormPrincipal.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown   := True;
end;

procedure TFormPrincipal.FormShow(Sender: TObject);
begin
//
end;

end.
