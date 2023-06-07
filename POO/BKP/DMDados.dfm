object DataModuleDados: TDataModuleDados
  OnCreate = DataModuleCreate
  Height = 195
  Width = 353
  object DBConnection: TFDConnection
    ConnectionName = 'DBMaximus'
    Params.Strings = (
      'Password=FTI@pg#1800'
      'Database=DBSERVLAR'
      'User_Name=postgres'
      'Server=192.168.0.100'
      'DriverID=PG')
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    FormatOptions.AssignedValues = [fvFmtDisplayNumeric]
    Connected = True
    LoginPrompt = False
    Left = 76
    Top = 8
  end
  object QryCadClienteBackup: TFDQuery
    CachedUpdates = True
    Connection = DBConnection
    SQL.Strings = (
      'select cb.cod_cliente,'
      '       cb.pasta_backup,'
      '       cb.ativo'
      'from fontdata.clientes_backup cb'
      'where cb.cod_cliente = :COD_CLIENTE'
      ' and cb.ativo = '#39'S'#39)
    Left = 72
    Top = 64
    ParamData = <
      item
        Name = 'COD_CLIENTE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object QryConsClienteBackup: TFDQuery
    AfterOpen = QryConsClienteBackupAfterOpen
    CachedUpdates = True
    Connection = DBConnection
    SQL.Strings = (
      'select cba.id,'
      '       cb.cod_cliente,       '
      '       c.nome,'
      '       c.fantasia,'
      '       cb.pasta_backup,'
      '       cba.data_ultimo_backup,'
      '       cba.tamanho_ultimo_backup,'
      '       cba.nome_arquivo,       '
      '       cba.limite_dias,'
      '       cba.limite_tamanho,'
      '       cast('#39#39' as varchar) arquivo,'
      '       ROW_NUMBER() OVER (PARTITION BY cb.cod_cliente) AS ordem,'
      '       cba.nome_arquivo,'
      '       cba.ativo'
      'FROM  fontdata.clientes_backup cb '
      
        'inner join fontdata.clientes_backup_arquivos cba on cba.cod_clie' +
        'nte  = cb.cod_cliente  '
      'inner join clientes c on c.codigo = cb.cod_cliente '
      'where cb.ativo = '#39'S'#39' '
      '  and cba.monitorar_arquivo = '#39'S'#39
      '  &Macro '
      'order by ordem, cba.data_ultimo_backup desc  ')
    Left = 160
    Top = 120
    MacroData = <
      item
        Value = Null
        Name = 'MACRO'
        DataType = mdIdentifier
      end>
  end
  object QrySincClienteBackupArquivo: TFDQuery
    AfterOpen = QrySincClienteBackupArquivoAfterOpen
    CachedUpdates = True
    Connection = DBConnection
    SQL.Strings = (
      'select cba.id,'
      '       cba.cod_cliente,       '
      '       cba.data_ultimo_backup,'
      '       cba.tamanho_ultimo_backup,'
      '       cba.nome_arquivo'
      'FROM  fontdata.clientes_backup_arquivos cba '
      'where 1 = 1 '
      '  &Macro '
      'order by cba.data_ultimo_backup desc ')
    Left = 232
    Top = 64
    MacroData = <
      item
        Value = Null
        Name = 'MACRO'
        DataType = mdIdentifier
      end>
  end
  object QryCadClienteBackupArquivo: TFDQuery
    AfterOpen = QryCadClienteBackupArquivoAfterOpen
    CachedUpdates = True
    Connection = DBConnection
    SQL.Strings = (
      'select cba.id,'
      '       cba.ativo,'
      '       cba.cod_cliente,'
      '       cba.nome_arquivo,'
      '       cba.limite_dias,'
      '       cba.limite_tamanho,'
      '       cba.data_ultimo_backup,'
      '       cast('#39#39' as varchar) arquivo,'
      
        '       ROW_NUMBER() OVER (PARTITION BY cba.cod_cliente) AS ordem' +
        ','
      '       cba.monitorar_arquivo, '
      '       cba.tamanho_ultimo_backup       '
      'from fontdata.clientes_backup_arquivos cba '
      'where cba.cod_cliente = :cod_cliente'
      '  &Macro'
      'order by cba.data_ultimo_backup, cba.id desc ')
    Left = 72
    Top = 120
    ParamData = <
      item
        Name = 'COD_CLIENTE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    MacroData = <
      item
        Value = Null
        Name = 'MACRO'
      end>
  end
  object QryConsClienteBackupArquivos: TFDQuery
    CachedUpdates = True
    Connection = DBConnection
    SQL.Strings = (
      'select cba.id,'
      '       cba.cod_cliente,'
      '       cba.nome_arquivo,'
      '       cba.limite_dias,'
      '       cba.limite_tamanho,'
      '       cba.data_ultimo_backup,'
      
        '       ROW_NUMBER() OVER (PARTITION BY cba.cod_cliente) AS ordem' +
        ',       '
      '       cba.tamanho_ultimo_backup,'
      '       cba.ativo'
      'from fontdata.clientes_backup_arquivos cba'
      'where cba.cod_cliente = :cod_cliente'
      '  &Macro'
      'order by cba.data_ultimo_backup, cba.id desc ')
    Left = 232
    Top = 120
    ParamData = <
      item
        Name = 'COD_CLIENTE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    MacroData = <
      item
        Value = Null
        Name = 'MACRO'
        DataType = mdIdentifier
      end>
  end
  object QryGeral: TFDQuery
    Connection = DBConnection
    Left = 160
    Top = 64
  end
  object WaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 160
    Top = 8
  end
  object PGDriver: TFDPhysPgDriverLink
    Left = 232
    Top = 8
  end
end
