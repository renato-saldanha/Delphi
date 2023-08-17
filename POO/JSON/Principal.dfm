object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 379
  ClientWidth = 362
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Btn1: TButton
    Left = 8
    Top = 344
    Width = 75
    Height = 25
    Caption = 'Processar'
    TabOrder = 0
    OnClick = Btn1Click
  end
  object Memo1: TMemo
    Left = 8
    Top = 8
    Width = 171
    Height = 177
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object Memo2: TMemo
    Left = 183
    Top = 8
    Width = 171
    Height = 177
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
  end
  object Button1: TButton
    Left = 144
    Top = 344
    Width = 75
    Height = 25
    Caption = 'Get'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Memo3: TMemo
    Left = 183
    Top = 191
    Width = 171
    Height = 147
    Lines.Strings = (
      'Memo1')
    TabOrder = 4
  end
  object Button2: TButton
    Left = 279
    Top = 344
    Width = 75
    Height = 25
    Caption = 'Array'
    TabOrder = 5
    OnClick = Button2Click
  end
  object Memo4: TMemo
    Left = 8
    Top = 191
    Width = 171
    Height = 147
    Lines.Strings = (
      'Memo1')
    TabOrder = 6
  end
end
