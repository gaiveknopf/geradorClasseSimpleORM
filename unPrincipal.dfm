object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'ClassGenerator'
  ClientHeight = 665
  ClientWidth = 1156
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1156
    Height = 329
    Align = alTop
    BevelOuter = bvNone
    Color = cl3DDkShadow
    ParentBackground = False
    TabOrder = 0
    object Panel3: TPanel
      Left = 11
      Top = 9
      Width = 1133
      Height = 46
      TabOrder = 0
      object Label9: TLabel
        Left = 338
        Top = 11
        Width = 445
        Height = 25
        Caption = 'Gerador de Classes SimpleORM - Postgres '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBtnHighlight
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object GroupBox1: TGroupBox
      Left = 16
      Top = 61
      Width = 540
      Height = 220
      Caption = 'Configura'#231#227'o de Conex'#227'o'
      Color = clWhite
      DoubleBuffered = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentColor = False
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 1
      object Label2: TLabel
        Left = 39
        Top = 28
        Width = 59
        Height = 16
        Caption = 'DriverID:'
        Color = clLime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label4: TLabel
        Left = 29
        Top = 60
        Width = 69
        Height = 16
        Caption = 'Username:'
        Color = clLime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label6: TLabel
        Left = 65
        Top = 92
        Width = 33
        Height = 16
        Caption = 'Port:'
        Color = clLime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label8: TLabel
        Left = 8
        Top = 124
        Width = 90
        Height = 16
        Caption = 'SchemaName:'
        Color = clLime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label3: TLabel
        Left = 295
        Top = 28
        Width = 67
        Height = 16
        Caption = 'Database:'
        Color = clLime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label5: TLabel
        Left = 294
        Top = 60
        Width = 68
        Height = 16
        Caption = 'Password:'
        Color = clLime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label7: TLabel
        Left = 158
        Top = 92
        Width = 49
        Height = 16
        Caption = 'Server:'
        Color = clLime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object edtDriverID: TEdit
        Left = 103
        Top = 23
        Width = 186
        Height = 26
        TabOrder = 0
        Text = 'PG'
      end
      object edtDatabase: TEdit
        Left = 367
        Top = 23
        Width = 165
        Height = 26
        TabOrder = 1
        Text = 'box'
      end
      object edtUserName: TEdit
        Left = 103
        Top = 55
        Width = 186
        Height = 26
        TabOrder = 2
        Text = 'postgres'
      end
      object edtPassword: TEdit
        Left = 367
        Top = 55
        Width = 165
        Height = 26
        TabOrder = 3
        Text = '1234'
      end
      object edtPort: TEdit
        Left = 103
        Top = 87
        Width = 49
        Height = 26
        TabOrder = 4
        Text = '5432'
      end
      object edtServer: TEdit
        Left = 212
        Top = 87
        Width = 320
        Height = 26
        TabOrder = 5
        Text = 'localhost'
      end
      object edtSchemaName: TEdit
        Left = 104
        Top = 119
        Width = 428
        Height = 26
        TabOrder = 6
        Text = 'public'
      end
      object btnConectar: TButton
        Left = 398
        Top = 158
        Width = 134
        Height = 37
        Caption = 'Conectar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
        OnClick = btnConectarClick
      end
    end
    object GroupBox2: TGroupBox
      Left = 572
      Top = 61
      Width = 572
      Height = 220
      Caption = 'Gerar'
      Color = clWhite
      DoubleBuffered = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentColor = False
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 2
      object Label10: TLabel
        Left = 66
        Top = 83
        Width = 70
        Height = 16
        Caption = 'Nome App:'
        Color = clLime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label11: TLabel
        Left = 15
        Top = 33
        Width = 121
        Height = 16
        Caption = 'Caminho Arquivos:'
        Color = clLime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object btn2: TButton
        Left = 426
        Top = 176
        Width = 138
        Height = 36
        Caption = 'Gerar Todos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = btn2Click
      end
      object edtPath: TEdit
        Left = 141
        Top = 28
        Width = 423
        Height = 26
        TabOrder = 1
        Text = 'c:\Classes'
      end
      object edtApp: TEdit
        Left = 141
        Top = 83
        Width = 423
        Height = 26
        TabOrder = 2
        Text = 'ServerReact'
      end
      object cheSeparaPasta: TCheckBox
        Left = 141
        Top = 60
        Width = 348
        Height = 17
        Caption = 'Separar arquivos por pasta (Nome Tabela)'
        Checked = True
        State = cbChecked
        TabOrder = 3
      end
      object cheEntidade: TCheckBox
        Left = 141
        Top = 116
        Width = 84
        Height = 17
        Caption = 'Entidades'
        Checked = True
        State = cbChecked
        TabOrder = 4
      end
      object cheAutoInc: TCheckBox
        Left = 285
        Top = 116
        Width = 120
        Height = 17
        Caption = 'Gerar AutoInc'
        Checked = True
        State = cbChecked
        TabOrder = 5
      end
      object cheController: TCheckBox
        Left = 141
        Top = 139
        Width = 84
        Height = 17
        Caption = 'Controller'
        Checked = True
        State = cbChecked
        TabOrder = 6
      end
      object cheReactList: TCheckBox
        Left = 285
        Top = 139
        Width = 92
        Height = 17
        Caption = 'React List'
        TabOrder = 7
      end
      object cheReactForm: TCheckBox
        Left = 411
        Top = 139
        Width = 102
        Height = 17
        Caption = 'React Form'
        TabOrder = 8
      end
      object cheVideo: TCheckBox
        Left = 49
        Top = 182
        Width = 195
        Height = 17
        AllowGrayed = True
        Caption = 'Gerar apenas em video'
        Color = clMedGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 9
      end
      object btn1: TButton
        Left = 282
        Top = 176
        Width = 138
        Height = 36
        Caption = 'Gerar Selecionado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 10
        OnClick = btn1Click
      end
    end
  end
  object Panel2: TPanel
    Left = 320
    Top = 329
    Width = 15
    Height = 336
    Align = alLeft
    BevelOuter = bvNone
    Color = cl3DDkShadow
    ParentBackground = False
    TabOrder = 1
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 329
    Width = 320
    Height = 336
    Align = alLeft
    DataSource = dsLista_Tabelas
    PopupMenu = PopupMenu1
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    OnColEnter = DBGrid1ColEnter
    OnDrawColumnCell = DBGrid1DrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'OK'
        Title.Alignment = taCenter
        Width = 33
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TABELA'
        Title.Alignment = taCenter
        Width = 247
        Visible = True
      end>
  end
  object MemVideo: TMemo
    Left = 335
    Top = 329
    Width = 821
    Height = 336
    Align = alClient
    ScrollBars = ssVertical
    TabOrder = 3
  end
  object FDConexao: TFDConnection
    ConnectionName = 'postgres'
    Params.Strings = (
      'User_Name=postgres'
      'Server=192.168.2.150'
      'Port=8152'
      'Password=d@t@box1825'
      'DriverID=PG')
    FetchOptions.AssignedValues = [evMode]
    ResourceOptions.AssignedValues = [rvAutoReconnect]
    ResourceOptions.AutoReconnect = True
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate, uvUpdateMode]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    LoginPrompt = False
    Left = 1034
    Top = 336
  end
  object dsLista_Tabelas: TDataSource
    DataSet = qryLista_Tabelas
    Left = 1032
    Top = 440
  end
  object qryLista_Tabelas: TFDQuery
    CachedUpdates = True
    Connection = FDConexao
    FetchOptions.AssignedValues = [evRecsMax, evDetailCascade, evDetailServerCascade]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate, uvGeneratorName, uvCheckRequired]
    UpdateOptions.CheckRequired = False
    UpdateOptions.KeyFields = 'TABELA'
    SQL.Strings = (
      'SELECT'
      ' '#39'1'#39' as "OK",'
      'TABLE_NAME AS TABELA'
      'FROM'
      '   INFORMATION_SCHEMA.TABLES   '
      'WHERE table_schema = '#39'public'#39
      'ORDER BY'
      '   TABELA ASC')
    Left = 1030
    Top = 389
    object qryLista_TabelasTABELA: TWideStringField
      FieldName = 'TABELA'
      Origin = '"TABELA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 64
    end
    object qryLista_TabelasOK: TWideMemoField
      AutoGenerateValue = arDefault
      FieldName = 'OK'
      Origin = '"OK"'
      OnGetText = qryLista_TabelasOKGetText
      BlobType = ftWideMemo
    end
  end
  object dsCFG_Geral: TDataSource
    Left = 1067
    Top = 712
  end
  object FDMIQ: TFDMetaInfoQuery
    Connection = FDConexao
    MetaInfoKind = mkTableFields
    CatalogName = 'box'
    ObjectName = 'CAD_USUARIO'
    Left = 1032
    Top = 280
    object FDMIQRECNO: TIntegerField
      FieldName = 'RECNO'
      ReadOnly = True
    end
    object FDMIQCATALOG_NAME: TWideStringField
      FieldName = 'CATALOG_NAME'
      ReadOnly = True
      Size = 128
    end
    object FDMIQSCHEMA_NAME: TWideStringField
      FieldName = 'SCHEMA_NAME'
      ReadOnly = True
      Size = 128
    end
    object FDMIQTABLE_NAME: TWideStringField
      FieldName = 'TABLE_NAME'
      ReadOnly = True
      Size = 128
    end
    object FDMIQCOLUMN_NAME: TWideStringField
      FieldName = 'COLUMN_NAME'
      ReadOnly = True
      Size = 128
    end
    object FDMIQCOLUMN_POSITION: TIntegerField
      FieldName = 'COLUMN_POSITION'
      ReadOnly = True
    end
    object FDMIQCOLUMN_DATATYPE: TIntegerField
      FieldName = 'COLUMN_DATATYPE'
      ReadOnly = True
    end
    object FDMIQCOLUMN_TYPENAME: TWideStringField
      FieldName = 'COLUMN_TYPENAME'
      ReadOnly = True
      Size = 128
    end
    object FDMIQCOLUMN_ATTRIBUTES: TLongWordField
      FieldName = 'COLUMN_ATTRIBUTES'
      ReadOnly = True
    end
    object FDMIQCOLUMN_PRECISION: TIntegerField
      FieldName = 'COLUMN_PRECISION'
      ReadOnly = True
    end
    object FDMIQCOLUMN_SCALE: TIntegerField
      FieldName = 'COLUMN_SCALE'
      ReadOnly = True
    end
    object FDMIQCOLUMN_LENGTH: TIntegerField
      FieldName = 'COLUMN_LENGTH'
      ReadOnly = True
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 1032
    Top = 504
    object SelecionarTodos1: TMenuItem
      Caption = 'Marcar Todos'
      OnClick = SelecionarTodos1Click
    end
    object DesmarcarTodos1: TMenuItem
      Caption = 'Desmarcar Todos'
      OnClick = DesmarcarTodos1Click
    end
  end
end
