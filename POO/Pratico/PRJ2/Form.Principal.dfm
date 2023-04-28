object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 153
  ClientWidth = 289
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
    TabOrder = 1
    Text = 'CbxTipoPreco'
    OnChange = CbxTipoPrecoChange
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
    Width = 130
    Height = 145
    TabOrder = 3
  end
  object NbxPrecoVenda: TNumberBox
    Left = 4
    Top = 32
    Width = 146
    Height = 23
    Mode = nbmCurrency
    TabOrder = 0
    Value = 10.000000000000000000
  end
end
