inherited ServiceCliente: TServiceCliente
  inherited DBConnection: TFDConnection
    Params.Strings = (
      'Database=teste'
      'DriverID=pG'
      'User_Name=postgres'
      'Password=FTI@pg#1800'
      'Server=localhost')
  end
  object QryCliente: TFDQuery
    Connection = DBConnection
    SQL.Strings = (
      
        'select id, nome, endereco, cidade, interesses, imagem, '#39#39'::varch' +
        'ar(320) AS defs'
      'from clientes')
    Left = 152
    Top = 96
  end
end
