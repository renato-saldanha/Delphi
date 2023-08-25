object FormPrincipal: TFormPrincipal
  Left = 0
  Top = 0
  Caption = 'SisBackup'
  ClientHeight = 589
  ClientWidth = 917
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Menu = MnuPrincipal
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object PnlEstatisticas: TPanel
    Left = 0
    Top = 484
    Width = 917
    Height = 86
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 4
    object PnlEstatistica2: TPanel
      AlignWithMargins = True
      Left = 166
      Top = 4
      Width = 227
      Height = 78
      Margins.Left = 1
      Margins.Right = 5
      Align = alLeft
      BevelInner = bvRaised
      BevelOuter = bvNone
      TabOrder = 1
      object Label4: TLabel
        Left = 10
        Top = 6
        Width = 74
        Height = 15
        Caption = 'Qtde.Normais'
      end
      object Label6: TLabel
        Left = 10
        Top = 23
        Width = 129
        Height = 15
        Caption = 'Qtde.Tamanho Diferente'
      end
      object Label7: TLabel
        Left = 10
        Top = 41
        Width = 81
        Height = 15
        Caption = 'Qtde.Atrasados'
      end
      object Label8: TLabel
        Left = 10
        Top = 58
        Width = 25
        Height = 15
        Caption = 'Total'
      end
      object LblQtdeNormal: TLabel
        Left = 180
        Top = 6
        Width = 7
        Height = 15
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblQtdeTamanhoDiferente: TLabel
        Left = 180
        Top = 23
        Width = 7
        Height = 15
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 30444
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblQtdeAtrasado: TLabel
        Left = 180
        Top = 41
        Width = 7
        Height = 15
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblTotal: TLabel
        Left = 180
        Top = 58
        Width = 7
        Height = 15
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object PnlEstatistica: TPanel
      AlignWithMargins = True
      Left = 6
      Top = 4
      Width = 154
      Height = 78
      Margins.Left = 5
      Margins.Right = 5
      Align = alLeft
      BevelInner = bvRaised
      BevelOuter = bvNone
      TabOrder = 0
      object Label2: TLabel
        Left = 37
        Top = 6
        Width = 41
        Height = 15
        Caption = 'Normal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 37
        Top = 24
        Width = 108
        Height = 15
        Caption = 'Tamanho Diferente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 37
        Top = 42
        Width = 93
        Height = 15
        Caption = 'Backup Atrasado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Panel2: TPanel
        Left = 8
        Top = 6
        Width = 25
        Height = 14
        BevelOuter = bvNone
        Color = clBlack
        ParentBackground = False
        TabOrder = 0
      end
      object Panel3: TPanel
        Left = 8
        Top = 24
        Width = 25
        Height = 14
        BevelOuter = bvNone
        Color = 30444
        ParentBackground = False
        TabOrder = 1
      end
      object Panel4: TPanel
        Left = 8
        Top = 42
        Width = 25
        Height = 14
        BevelOuter = bvNone
        Color = clRed
        ParentBackground = False
        TabOrder = 2
      end
    end
  end
  object DbgDados: TDBGrid
    Left = 0
    Top = 121
    Width = 917
    Height = 363
    Align = alClient
    DataSource = DscDados
    DrawingStyle = gdsGradient
    FixedColor = clOlive
    GradientEndColor = clWhite
    GradientStartColor = clWindow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    PopupMenu = pm
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDrawColumnCell = DbgDadosDrawColumnCell
    Columns = <
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'cod_cliente'
        Title.Alignment = taRightJustify
        Title.Caption = 'Codigo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Title.Caption = 'Cliente'
        Width = 224
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'fantasia'
        Title.Caption = 'Fantasia'
        Width = 153
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome_arquivo'
        Title.Caption = 'Arquivo'
        Width = 205
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'data_ultimo_backup'
        Title.Alignment = taCenter
        Title.Caption = 'Ultimo Backup'
        Width = 123
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'tamanho_ultimo_backup'
        Title.Alignment = taRightJustify
        Title.Caption = 'Tamanho'
        Width = 108
        Visible = True
      end>
  end
  object PnlCabecalho: TPanel
    Left = 0
    Top = 0
    Width = 917
    Height = 121
    Align = alTop
    BevelKind = bkSoft
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 394
      Top = 61
      Width = 45
      Height = 15
      Caption = 'Situa'#231#227'o'
    end
    object SpbCodigoCliente: TSpeedButton
      Tag = 1
      Left = 107
      Top = 33
      Width = 30
      Height = 21
      Cursor = crHandPoint
      Hint = 'Pesquisa Caixa Cadastrados'
      Flat = True
      Glyph.Data = {
        C6050000424DC605000000000000360400002800000014000000140000000100
        0800000000009001000000000000000000000001000000010000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A600D4F0FF00B1E2F8008ED4DF006BC9D10048B8C30025AABD0000AAC5000092
        AF00007A930000626200004A4A0000323200D4E3FF00B1C7FF008EABFF006B8F
        FF004873FF002557FF000055FF000049DC00003DB90000319600002573000019
        5000D4D4FF00B1B1FF008E8EFF006B6BFF004848FF002525FF000000FE000000
        DC000000B900000096000000730000005000E3D4FF00C7B1FF00AB8EFF008F6B
        FF007348FF005725FF005500FF004900DC003D00B90031009600250073001900
        5000F0D4FF00E2B1FF00D48EFF00C66BFF00B848FF00AA25FF00AA00FF009200
        DC007A00B900620096004A00730032005000FFD4FF00FFB1FF00FF8EFF00FF6B
        FF00FF48FF00FF25FF00FE00FE00DC00DC00B900B90096009600730073005000
        5000FFD4F000FFB1E200FF8ED400FF6BC600FF48B800FF25AA00FF00AA00DC00
        9200B9007A009600620073004A0050003200FFD4E300FFB1C700FF8EAB00FF6B
        8F00FF487300FF255700FF005500DC004900B9003D0096003100730025005000
        1900FFD4D400FFB1B100FF8E8E00FF6B6B00FF484800FF252500FE000000DC00
        0000B9000000960000007300000050000000FFE3D400FFC7B100FFAB8E00FF8F
        6B00FF734800FF572500FF550000DC490000B93D000096310000732500005019
        0000FFF0D400FFE2B100FFD48E00FFC66B00FFB84800FFAA2500FFAA0000DC92
        0000B97A000096620000734A000050320000FFFFD400FFFFB100FFFF8E00FFFF
        6B00FFFF4800FFFF2500FEFE0000DCDC0000B9B9000096960000737300005050
        0000F0FFD400E2FFB100D4FF8E00C6FF6B00B8FF4800AAFF2500AAFF000092DC
        00007AB90000629600004A73000032500000E3FFD400C7FFB100ABFF8E008FFF
        6B0073FF480057FF250055FF000049DC00003DB9000031960000257300001950
        0000D4FFD400B1FFB1008EFF8E006BFF6B0048FF480025FF250000FE000000DC
        000000B90000009600000073000000500000D4FFE300B1FFC7008EFFAB006BFF
        8F0048FF730025FF570000FF550000DC490000B93D0000963100007325000050
        1900D4FFF000B1FFE2008EFFD4006BFFC60048FFB80025FFAA0000FFAA0000DC
        920000B97A000096620000734A0000503200D4FFFF00B1FFFF008EFFFF006BFF
        FF0048FFFF0025FFFF0000FEFE0000DCDC0000B9B90000969600007373000050
        5000F2F2F200E6E6E600DADADA00CECECE00C2C2C200B6B6B600AAAAAA009E9E
        9E0092929200868686007A7A7A006E6E6E0062626200565656004A4A4A003E3E
        3E0032323200262626001A1A1A000E0E0E00F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010101010101
        01010101010101010101F100F1EA010101010101010101010101010101F10013
        15F10101010101010101010101010101F100110B130001010101010101010101
        010101F100110B1200F1010101010101010101010101F100110B1200F1010101
        010101010101010101F100110B1200F10101010101E8ECEEEEEEEEECF100110B
        1200F10101010101EAEEF000000000F10013111200F10101010101EAF000EDE7
        E4E4E7ED00F01400F10101010101E8EE00E7E46A6A6A6AE4E70000F101010101
        0101ECF0EDE46A6A00006A6AE4EDF1EC010101010101EE00E76A6A6B00006B6A
        6AE700EE010101010101EE00E46A0000000000006AE400EE010101010101EE00
        E46A0000000000006AE400EE010101010101EE00E76AFFFF00006B6A6AE700EE
        010101010101ECF0EDE46AFF00006A6AE4EDF0EC010101010101E8EE00E7E46A
        6A6A6AE4E700EEE801010101010101EAF000EDE7E4E4E7ED00F0EA0101010101
        01010101EAEEF000000000F0EEEA0101010101010101010101E8ECEEEEEEEEEC
        E8010101010101010101}
      ParentShowHint = False
      ShowHint = True
      OnClick = SpbCodigoClienteClick
    end
    object Lbl1: TLabel
      Left = 16
      Top = 61
      Width = 115
      Height = 15
      Caption = 'Lim. Dias sem Backup'
    end
    object Lbl2: TLabel
      Left = 193
      Top = 61
      Width = 157
      Height = 15
      Caption = 'Tam.Lim.V'#225'lido entre Backups'
    end
    object LbeCodCliente: TLabeledEdit
      Left = 16
      Top = 31
      Width = 89
      Height = 23
      Color = 8454143
      EditLabel.Width = 37
      EditLabel.Height = 15
      EditLabel.Caption = 'Cliente'
      NumbersOnly = True
      TabOrder = 2
      Text = '000000'
      OnExit = LbeCodClienteExit
      OnKeyDown = LbeCodClienteKeyDown
    end
    object EdtNomeCliente: TEdit
      Left = 140
      Top = 31
      Width = 365
      Height = 23
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 3
      Text = 'TODOS'
    end
    object BtnPesquisar: TBitBtn
      Left = 628
      Top = 12
      Width = 145
      Height = 44
      Caption = '[F5] - Pesquisar Registros'
      TabOrder = 0
      OnClick = BtnPesquisarClick
    end
    object CbxLimiteDias: TComboBox
      Left = 16
      Top = 79
      Width = 145
      Height = 23
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 4
      Text = 'Todos'
      Items.Strings = (
        'Todos')
    end
    object CbxLimiteTamanho: TComboBox
      Left = 193
      Top = 79
      Width = 164
      Height = 23
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 5
      Text = 'Todos'
      Items.Strings = (
        'Todos')
    end
    object BtnSincronizarDadosInternos: TBitBtn
      Left = 780
      Top = 12
      Width = 123
      Height = 94
      Caption = '[F6] - Sincronizar Dados Internos'
      TabOrder = 1
      WordWrap = True
      OnClick = BtnSincronizarDadosInternosClick
    end
  end
  object CbxAtivo: TComboBox
    Left = 396
    Top = 81
    Width = 111
    Height = 23
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 2
    Text = 'Todos'
    Items.Strings = (
      'Todos')
  end
  object BtnLimparCampos: TBitBtn
    Left = 630
    Top = 64
    Width = 145
    Height = 44
    Caption = '[Ctrl+L] Limpar Campos'
    TabOrder = 1
    OnClick = BtnLimparCamposClick
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 570
    Width = 917
    Height = 19
    Panels = <>
  end
  object MnuPrincipal: TMainMenu
    Left = 712
    Top = 8
    object MnuCadastro: TMenuItem
      Caption = 'Cadastros'
      object MnuCadastrodeBackups: TMenuItem
        Caption = 'Backup'
        OnClick = MnuCadastrodeBackupsClick
      end
    end
  end
  object DscDados: TDataSource
    DataSet = DataModuleDados.QryConsClienteBackup
    Left = 456
    Top = 320
  end
  object pm: TPopupMenu
    Left = 640
    Top = 16
    object AbrirlocalArquivo1: TMenuItem
      Caption = 'Abrir local Arquivo'
      OnClick = AbrirlocalArquivo1Click
    end
  end
end
