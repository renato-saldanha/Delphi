unit App.Util;

interface

uses
  FireDAC.Comp.Client, Data.DB, System.Classes, System.NetEncoding,  Vcl.ExtCtrls, Variants,
  System.SysUtils, vcl.Graphics,DataSet.Serialize;

procedure EncodeImg(AQry: TFDQuery; AColunas: array of String);
procedure DecodeImg(AQry: TFDMemTable; AColunas: array of String); overload;
procedure DecodeImg(AQry: TFDQuery; AColunas: array of String); overload;

implementation

uses
 Vcl.Imaging.jpeg;

procedure EncodeImg(AQry: TFDQuery; AColunas: array of String);
var
  I: Integer;
  StreamEntrada : TStream;
  StreamSaida: TStringStream;

  LMS: TMemoryStream;
  LHeader: array [0 .. 9] of byte;
  LStrHeader: String;
begin
  LMS := TMemoryStream.Create;
  LStrHeader := '';

  TBlobField(AQry.FieldByName('IMAGE')).SaveToStream(LMS);
  LMS.Position := 0;
  LMS.ReadBuffer(LHeader, length(LHeader));
  LMS.Position := 0;
  for I := Low(LHeader) to High(LHeader) do
    if (LHeader[I] > 32) and (LHeader[I] <= 128) then
      LStrHeader := LStrHeader + char(LHeader[I]);


  try
    AQry.First;
    while not AQry.Eof do
    begin
      for I := 0 to Length(AColunas) -1 do
      begin
        if AQry.FieldByName(AColunas[I]).IsBlob then
        begin
          AQry.Edit;
          StreamEntrada := AQry.CreateBlobStream(AQry.Fields[I], bmReadWrite);
          StreamSaida := TStringStream.Create;
          TNetEncoding.Base64.Encode(StreamEntrada, StreamSaida);
          StreamSaida.Position := 0;
          AQry.FieldByName(AColunas[I]).AsString := StreamSaida.DataString;
          AQry.Post;
  //        lJO.AddPair(AQry.Fields[I].DisplayName, StreamSaida.DataString);
        end;
      end;
      AQry.Next;
    end;
  except on E: Exception do
    raise Exception.Create(e.message);
  end;
end;

procedure DecodeImg(AQry: TFDMemTable; AColunas: array of String); overload;
var
  LI, LJ: Integer;
  LStreamEntrada : TStringStream;
  LFoto: TMemoryStream;
  img: TImage;
  LJpg : TJPEGImage;
  bmp: TBitMap;

  LMS: TMemoryStream;
  LHeader: array [0 .. 9] of byte;
  LStrHeader: String;
begin
  LMS := TMemoryStream.Create;
  LStrHeader := '';


  try
    img:= TImage.Create(nil);
    AQry.First;
    while not AQry.Eof do
    begin
      for LI := 0 to Length(AColunas) -1 do
      begin
//        if AQry.FieldByName(AColunas[LI]).IsBlob then
//        begin
          AQry.Edit;
          LStreamEntrada           := TStringStream.Create();
          LStreamEntrada.WriteString(AQry.FieldByName(AColunas[LI]).Value);
          LStreamEntrada.Position  := 0;
          LFoto                    := TMemoryStream.Create;
          TNetEncoding.Base64.Decode(LStreamEntrada, LFoto);
          LFoto.Position           := 0;
          LJpg := TJPEGImage.Create;
          ljpg.CompressionQuality :=  10;
//          LJpg.LoadFromStream(LFoto);
//          img.Picture.LoadFromStream(LFoto);

          TBlobField(AQry.FieldByName('IMAGE')).SaveToStream(LMS);
          LMS.Position := 0;
          LMS.ReadBuffer(LHeader, length(LHeader));
          LMS.Position := 0;
          for LJ := Low(LHeader) to High(LHeader) do
            if (LHeader[LJ] > 32) and (LHeader[LJ] <= 128) then
              LStrHeader := LStrHeader + char(LHeader[LJ]);

          AQry.FieldByName(AColunas[LI]).Assign(img.Picture);
          AQry.Post;
//        end;
      end;
      AQry.Next;
    end;
  except on E: Exception do
    raise Exception.Create(e.message);
  end;
end;

procedure DecodeImg(AQry: TFDQuery; AColunas: array of String); overload;
var
  LI, LJ: Integer;
  LStreamEntrada : TStringStream;
  LFoto: TMemoryStream;
  img: TImage;
  LJpg : TJPEGImage;
  Lbmp: TBitMap;

  LMS: TMemoryStream;
  LHeader: array [0 .. 9] of byte;
  LStrHeader: String;
begin
  LMS := TMemoryStream.Create;
  LStrHeader := '';


  try
    img:= TImage.Create(nil);
    AQry.First;
    while not AQry.Eof do
    begin
      for LI := 0 to Length(AColunas) -1 do
      begin
//        if AQry.FieldByName(AColunas[LI]).IsBlob then
//        begin
//          AQry.Edit;
          LStreamEntrada           := TStringStream.Create(VarToStr(AQry.FieldByName(AColunas[LI]).Value));
//          LStreamEntrada.WriteString();
          LStreamEntrada.Position  := 0;
          LFoto                    := TMemoryStream.Create;
          TNetEncoding.Base64.Decode(LStreamEntrada, LFoto);
          LFoto.Position           := 0;
//          LJpg := TJPEGImage.Create;
//          ljpg.CompressionQuality :=  10;
//          LJpg.LoadFromStream(LFoto);
//          img.Picture.LoadFromStream(LFoto);

          TMemoField(AQry.FieldByName('IMAGE')).SaveToStream(LFoto);
          LFoto.Position := 0;
          LFoto.ReadBuffer(LHeader, length(LHeader));
          LFoto.Position := 0;
          for LJ := Low(LHeader) to High(LHeader) do
            if (LHeader[LJ] > 32) and (LHeader[LJ] <= 128) then
              LStrHeader := LStrHeader + char(LHeader[LJ]);

          Lbmp := TBitmap.Create;
          Lbmp.LoadFromStream(LFoto);

//          AQry.FieldByName(AColunas[LI]).Assign(img.Picture);
//          AQry.Post;
//        end;
      end;
      AQry.Next;
    end;
   except on E: Exception do
    raise Exception.Create(e.message);
  end;

end;

end.