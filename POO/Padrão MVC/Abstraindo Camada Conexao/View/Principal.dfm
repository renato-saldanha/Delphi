object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 201
  ClientWidth = 584
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object DBGrid1: TDBGrid
    AlignWithMargins = True
    Left = 5
    Top = 10
    Width = 574
    Height = 155
    Margins.Left = 5
    Margins.Top = 10
    Margins.Right = 5
    Align = alClient
    DataSource = DscGrid
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    AlignWithMargins = True
    Left = 5
    Top = 171
    Width = 574
    Height = 25
    Margins.Left = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alBottom
    TabOrder = 1
    ExplicitLeft = 8
    ExplicitTop = 136
    ExplicitWidth = 560
  end
  object DBConnection: TFDConnection
    Left = 336
    Top = 16
  end
  object DscGrid: TDataSource
    Left = 448
    Top = 8
  end
  object Qry: TFDQuery
    Connection = DBConnection
    Left = 456
    Top = 72
  end
end
