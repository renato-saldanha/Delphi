object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 191
  ClientWidth = 369
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object Memo1: TMemo
    Left = 161
    Top = 8
    Width = 185
    Height = 175
    TabOrder = 0
  end
  object Button1: TButton
    Left = 8
    Top = 66
    Width = 145
    Height = 33
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 8
    Width = 145
    Height = 23
    TabOrder = 2
    OnChange = ComboBox1Change
    Items.Strings = (
      'Simples Nacional'
      'Lucro Presumido'
      'Lucro Real')
  end
  object EdtValorImposto: TEdit
    Left = 8
    Top = 37
    Width = 145
    Height = 23
    TabOrder = 3
    Text = '10'
  end
end
