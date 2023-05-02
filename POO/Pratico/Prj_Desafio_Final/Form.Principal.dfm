object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 165
  ClientWidth = 303
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object CbxTipoReceita: TComboBox
    Left = 12
    Top = 16
    Width = 118
    Height = 23
    TabOrder = 2
    Text = 'CbxTipoReceita'
    OnChange = CbxTipoReceitaChange
  end
  object EdtValor: TEdit
    Left = 10
    Top = 48
    Width = 121
    Height = 23
    TabOrder = 0
    Text = '10'
    TextHint = '10'
  end
  object BtnCalcular: TButton
    Left = 10
    Top = 112
    Width = 121
    Height = 49
    Caption = 'Calcular'
    TabOrder = 1
    OnClick = BtnCalcularClick
  end
  object Memo1: TMemo
    Left = 136
    Top = 16
    Width = 161
    Height = 145
    Lines.Strings = (
      'Memo1')
    TabOrder = 3
  end
end
