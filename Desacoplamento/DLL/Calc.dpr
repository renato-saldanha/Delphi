library Calc;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters.

  Important note about VCL usage: when this DLL will be implicitly
  loaded and this DLL uses TWicImage / TImageCollection created in
  any unit initialization section, then Vcl.WicImageInit must be
  included into your library's USES clause. }

uses
  System.SysUtils,
  System.Classes;

{$R *.res}

function Somar(AV1, AV2: Double): Double; stdcall; overload; // usado para mudar a leitura dos parametros para inicio da direita para a esquerda
begin
  Result := AV1 + AV2;
end;

function Somar(AV1, AV2: Integer): Integer; stdcall; overload;
begin
  Result := AV1 + AV2;
end;

exports Somar(AV1, AV2: Integer) name 'SomarInteger';
exports Somar(AV1, AV2: Double) name 'SomarDouble';

begin
end.
