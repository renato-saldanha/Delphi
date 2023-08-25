object FormCadastro: TFormCadastro
  Left = 0
  Top = 0
  Caption = 'Cadastro'
  ClientHeight = 272
  ClientWidth = 373
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  TextHeight = 15
  object EdtNome: TDBLabeledEdit
    Left = 16
    Top = 40
    Width = 121
    Height = 23
    TabOrder = 0
    EditLabel.Width = 33
    EditLabel.Height = 15
    EditLabel.Caption = 'Nome'
    EditLabel.Layout = tlCenter
  end
  object EdtEndereco: TDBLabeledEdit
    Left = 16
    Top = 96
    Width = 121
    Height = 23
    TabOrder = 1
    EditLabel.Width = 49
    EditLabel.Height = 15
    EditLabel.Caption = 'Endere'#231'o'
    EditLabel.Layout = tlCenter
  end
  object EdtCidade: TDBLabeledEdit
    Left = 16
    Top = 152
    Width = 121
    Height = 23
    TabOrder = 2
    EditLabel.Width = 37
    EditLabel.Height = 15
    EditLabel.Caption = 'Cidade'
    EditLabel.Layout = tlCenter
  end
  object EdtInteresses: TDBLabeledEdit
    Left = 16
    Top = 208
    Width = 353
    Height = 23
    TabOrder = 3
    EditLabel.Width = 51
    EditLabel.Height = 15
    EditLabel.Caption = 'Interesses'
    EditLabel.Layout = tlCenter
  end
  object Panel1: TPanel
    Left = 0
    Top = 231
    Width = 373
    Height = 41
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 4
    object BtnSair: TButton
      Left = 272
      Top = 4
      Width = 97
      Height = 33
      Caption = 'Sai&r'
      TabOrder = 0
    end
    object BtnSalvar: TButton
      Left = 169
      Top = 4
      Width = 97
      Height = 33
      Caption = '&Salvar'
      TabOrder = 1
      OnClick = BtnSalvarClick
    end
  end
  object ImgCadastro: TDBImage
    Left = 169
    Top = 8
    Width = 200
    Height = 167
    DataSource = FormPrincipal.DscDados
    Proportional = True
    Stretch = True
    TabOrder = 5
  end
  object btnEscolherImagem: TButton
    Left = 169
    Top = 181
    Width = 80
    Height = 21
    Caption = 'Selecionar'
    TabOrder = 6
    OnClick = btnEscolherImagemClick
  end
  object BtnLimpar: TButton
    Left = 289
    Top = 181
    Width = 80
    Height = 21
    Caption = 'Limpar'
    TabOrder = 7
    OnClick = BtnLimparClick
  end
  object OpenDialog1: TOpenDialog
    Left = 256
    Top = 184
  end
  object Adapter: TFDTableAdapter
    DatSTableName = 'clientes'
    ColumnMappings = <
      item
        SourceColumnName = 'id'
        UpdateColumnName = 'id'
        DatSColumnName = 'id'
      end
      item
        SourceColumnName = 'nome'
        UpdateColumnName = 'nome'
        DatSColumnName = 'nome'
      end
      item
        SourceColumnName = 'endereco'
        UpdateColumnName = 'endereco'
        DatSColumnName = 'endereco'
      end
      item
        SourceColumnName = 'cidade'
        UpdateColumnName = 'cidade'
        DatSColumnName = 'cidade'
      end
      item
        SourceColumnName = 'interesses'
        UpdateColumnName = 'interesses'
        DatSColumnName = 'interesses'
      end
      item
        SourceColumnName = 'imagem'
        UpdateColumnName = 'imagem'
        DatSColumnName = 'imagem'
      end>
    Left = 248
    Top = 120
  end
end