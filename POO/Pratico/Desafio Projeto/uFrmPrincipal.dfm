object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 156
  ClientWidth = 301
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object CbxTipoPreco: TComboBox
    Left = 5
    Top = 5
    Width = 145
    Height = 23
    TabOrder = 0
    Text = 'CbxTipoPreco'
    OnChange = CbxTipoPrecoChange
  end
  object EdtPreco: TEdit
    Left = 5
    Top = 34
    Width = 145
    Height = 23
    TabOrder = 1
    Text = '10'
  end
  object BtnVerPreco: TButton
    Left = 5
    Top = 111
    Width = 145
    Height = 39
    Caption = 'Ver Pre'#231'o'
    TabOrder = 2
    OnClick = BtnVerPrecoClick
  end
  object Memo: TMemo
    Left = 156
    Top = 5
    Width = 138
    Height = 145
    Lines.Strings = (
      'Memo')
    TabOrder = 3
  end
end
