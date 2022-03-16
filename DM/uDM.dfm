object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 198
  Width = 426
  object Conexao: TFDConnection
    Params.Strings = (
      'Database=MV'
      'User_Name=postgres'
      'Password=123'
      'DriverID=PG')
    LoginPrompt = False
    BeforeConnect = ConexaoBeforeConnect
    Left = 48
    Top = 24
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 176
    Top = 16
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorHome = 'C:\WorkArea\Prototipos\ProjetoTeste\Win32\Debug'
    Left = 48
    Top = 72
  end
  object fdDados: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'SELECT * FROM "DEPARTAMENTOS"'
      'ORDER BY id_departamento ASC')
    Left = 175
    Top = 80
  end
  object dsDados: TDataSource
    DataSet = fdDados
    Left = 175
    Top = 132
  end
  object fdDepartamentos: TFDQuery
    IndexesActive = False
    Connection = Conexao
    SQL.Strings = (
      'SELECT * FROM "DEPARTAMENTOS"'
      'ORDER BY id_departamento ASC')
    Left = 255
    Top = 80
  end
  object dsDepartamentos: TDataSource
    DataSet = fdDepartamentos
    Left = 255
    Top = 140
  end
  object fdEmpregados: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'select '
      '  e.id_empregado, '
      '  e.cod_departamento, '
      '  e.cod_emp_funcao, '
      '  e.nm_empregado, '
      '  e.nm_funcao, '
      '  e.data_admissao, '
      '  e.salario, '
      '  e.comissao, '
      '  d.id_departamento, '
      '  d.nm_departamento '
      'from '
      '  "EMPREGADOS" e '
      '  inner join "DEPARTAMENTOS" d on ('
      '    e.cod_departamento = d.id_departamento'
      '  )')
    Left = 360
    Top = 80
    object fdEmpregadosid_empregado: TIntegerField
      FieldName = 'id_empregado'
      Origin = 'id_empregado'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object fdEmpregadoscod_departamento: TIntegerField
      FieldName = 'cod_departamento'
      Origin = 'cod_departamento'
    end
    object fdEmpregadoscod_emp_funcao: TIntegerField
      FieldName = 'cod_emp_funcao'
      Origin = 'cod_emp_funcao'
    end
    object fdEmpregadosnm_empregado: TWideStringField
      FieldName = 'nm_empregado'
      Origin = 'nm_empregado'
      Size = 100
    end
    object fdEmpregadosnm_funcao: TWideStringField
      FieldName = 'nm_funcao'
      Origin = 'nm_funcao'
      Size = 100
    end
    object fdEmpregadosdata_admissao: TDateField
      FieldName = 'data_admissao'
      Origin = 'data_admissao'
    end
    object fdEmpregadossalario: TFMTBCDField
      FieldName = 'salario'
      Origin = 'salario'
      DisplayFormat = '#,###,##0.00'
      currency = True
      Precision = 64
      Size = 5
    end
    object fdEmpregadoscomissao: TFMTBCDField
      FieldName = 'comissao'
      Origin = 'comissao'
      DisplayFormat = '#,###,##0.00'
      Precision = 64
      Size = 5
    end
    object fdEmpregadosid_departamento: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'id_departamento'
      Origin = 'id_departamento'
    end
    object fdEmpregadosnm_departamento: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'nm_departamento'
      Origin = 'nm_departamento'
      Size = 100
    end
  end
  object dsEmpregados: TDataSource
    DataSet = fdEmpregados
    Left = 360
    Top = 136
  end
end
