object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 186
  ClientWidth = 296
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Button1: TButton
    Left = 96
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Local'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 96
    Top = 88
    Width = 75
    Height = 41
    Caption = 'Abstraido '
    TabOrder = 1
    WordWrap = True
    OnClick = Button2Click
  end
end
