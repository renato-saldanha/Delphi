object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Memo1: TMemo
    Left = 0
    Top = 8
    Width = 313
    Height = 297
    TabOrder = 0
  end
  object Button1: TButton
    Left = 96
    Top = 352
    Width = 75
    Height = 25
    Caption = 'writer'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Memo2: TMemo
    Left = 312
    Top = 8
    Width = 313
    Height = 297
    TabOrder = 2
  end
  object Button2: TButton
    Left = 432
    Top = 352
    Width = 75
    Height = 25
    Caption = 'Reader'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 264
    Top = 352
    Width = 75
    Height = 25
    Caption = 'Builder'
    TabOrder = 4
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 96
    Top = 383
    Width = 75
    Height = 25
    Caption = 'Iterator'
    TabOrder = 5
    OnClick = Button4Click
  end
end
