object FormPrincipal: TFormPrincipal
  Left = 0
  Top = 0
  Caption = 'Principal'
  ClientHeight = 244
  ClientWidth = 737
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object Image1: TImage
    Left = 496
    Top = 30
    Width = 209
    Height = 179
  end
  object DbgDados: TDBGrid
    Left = 24
    Top = 61
    Width = 443
    Height = 120
    DataSource = DscDados
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object LbeDescricao: TLabeledEdit
    Left = 24
    Top = 32
    Width = 337
    Height = 23
    EditLabel.Width = 70
    EditLabel.Height = 15
    EditLabel.Caption = 'LbeDescricao'
    TabOrder = 1
    Text = ''
    OnKeyDown = LbeDescricaoKeyDown
  end
  object BtnNovo: TButton
    Left = 54
    Top = 200
    Width = 99
    Height = 41
    Caption = '&Novo'
    TabOrder = 2
    OnClick = BtnNovoClick
  end
  object BtnAlterar: TButton
    Left = 186
    Top = 200
    Width = 99
    Height = 41
    Caption = '&Alterar'
    TabOrder = 3
  end
  object BtnExcluir: TButton
    Left = 318
    Top = 200
    Width = 99
    Height = 41
    Caption = 'E&xcluir'
    TabOrder = 4
    OnClick = BtnExcluirClick
  end
  object BtnPesquisar: TBitBtn
    Left = 392
    Top = 30
    Width = 75
    Height = 27
    Caption = 'Pesquisar'
    TabOrder = 5
    OnClick = BtnPesquisarClick
  end
  object DscDados: TDataSource
    DataSet = mmDados
    OnDataChange = DscDadosDataChange
    Left = 408
    Top = 112
  end
  object mmDados: TFDMemTable
    FetchOptions.AssignedValues = [evMode, evAutoFetchAll]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 296
    Top = 80
  end
end