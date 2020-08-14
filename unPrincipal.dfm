object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Gerador de Classes'
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
    Height = 254
    Align = alTop
    BevelOuter = bvNone
    Color = cl3DDkShadow
    ParentBackground = False
    TabOrder = 0
    object cxGroupBox1: TcxGroupBox
      Left = 562
      Top = 64
      Caption = 'Gerar'
      PanelStyle.OfficeBackgroundKind = pobkGradient
      ParentBackground = False
      ParentColor = False
      Style.BorderColor = clSkyBlue
      Style.BorderStyle = ebsFlat
      Style.Color = clYellow
      Style.LookAndFeel.Kind = lfUltraFlat
      Style.LookAndFeel.NativeStyle = False
      Style.LookAndFeel.SkinName = 'UserSkin'
      Style.Shadow = False
      Style.TransparentBorder = True
      StyleDisabled.BorderColor = clHotLight
      StyleDisabled.LookAndFeel.Kind = lfUltraFlat
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.SkinName = 'UserSkin'
      TabOrder = 0
      Height = 181
      Width = 582
      object label235: TLabel
        Left = 58
        Top = 75
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
      object Label1: TLabel
        Left = 7
        Top = 25
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
      object btn1: TcxButton
        Left = 394
        Top = 118
        Width = 153
        Height = 27
        Caption = 'Gerar Selecionado'
        Colors.Default = clGrayText
        Colors.DefaultText = clGrayText
        Colors.Normal = clGrayText
        Colors.NormalText = clGrayText
        Colors.Hot = clGrayText
        Colors.HotText = clGrayText
        Colors.Pressed = clGrayText
        Colors.PressedText = clGrayText
        Colors.Disabled = clGrayText
        Colors.DisabledText = clGrayText
        Enabled = False
        TabOrder = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btn1Click
      end
      object edtApp: TcxTextEdit
        Left = 133
        Top = 73
        TabOrder = 1
        Text = 'ServerReact'
        Width = 200
      end
      object edtPath: TcxTextEdit
        Left = 133
        Top = 23
        TabOrder = 2
        Text = 'c:\Classes'
        Width = 438
      end
      object cheSeparaPasta: TCheckBox
        Left = 134
        Top = 50
        Width = 235
        Height = 17
        Caption = 'Separar arquivos por pasta (Nome Tabela)'
        Checked = True
        State = cbChecked
        TabOrder = 3
      end
      object cheEntidade: TCheckBox
        Left = 134
        Top = 100
        Width = 67
        Height = 17
        Caption = 'Entidades'
        Checked = True
        State = cbChecked
        TabOrder = 4
      end
      object cheController: TCheckBox
        Left = 134
        Top = 123
        Width = 75
        Height = 17
        Caption = 'Controller'
        Checked = True
        State = cbChecked
        TabOrder = 5
      end
      object cheModel: TCheckBox
        Left = 207
        Top = 123
        Width = 43
        Height = 17
        Caption = 'Model'
        Enabled = False
        TabOrder = 6
      end
      object cheInterface: TCheckBox
        Left = 264
        Top = 123
        Width = 74
        Height = 17
        Caption = 'Interfaces'
        Enabled = False
        TabOrder = 7
      end
      object btn2: TcxButton
        Left = 394
        Top = 70
        Width = 153
        Height = 27
        Caption = 'Gerar Todos'
        Colors.Default = clGrayText
        Colors.DefaultText = clGrayText
        Colors.Normal = clGrayText
        Colors.NormalText = clGrayText
        Colors.Hot = clGrayText
        Colors.HotText = clGrayText
        Colors.Pressed = clGrayText
        Colors.PressedText = clGrayText
        Colors.Disabled = clGrayText
        Colors.DisabledText = clGrayText
        Enabled = False
        TabOrder = 8
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btn2Click
      end
      object cheVideo: TCheckBox
        Left = 134
        Top = 146
        Width = 161
        Height = 17
        Caption = 'Gerar apenas em video'
        TabOrder = 9
      end
      object cheAutoInc: TCheckBox
        Left = 207
        Top = 100
        Width = 90
        Height = 17
        Caption = 'Gerar AutoInc'
        Checked = True
        State = cbChecked
        TabOrder = 10
      end
    end
    object cxGroupBox2: TcxGroupBox
      Left = 11
      Top = 64
      Caption = 'Configura'#231#245'es de Conex'#227'o'
      Style.BorderStyle = ebsNone
      Style.LookAndFeel.NativeStyle = False
      Style.LookAndFeel.SkinName = 'UserSkin'
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.SkinName = 'UserSkin'
      TabOrder = 1
      Transparent = True
      Height = 178
      Width = 542
      object Label2: TLabel
        Left = 39
        Top = 25
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
      object Label3: TLabel
        Left = 295
        Top = 25
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
      object Label4: TLabel
        Left = 29
        Top = 52
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
      object Label5: TLabel
        Left = 294
        Top = 52
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
      object Label6: TLabel
        Left = 65
        Top = 79
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
      object Label7: TLabel
        Left = 158
        Top = 79
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
      object Label8: TLabel
        Left = 8
        Top = 107
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
      object edtDriverID: TcxTextEdit
        Left = 103
        Top = 23
        TabOrder = 0
        Text = 'PG'
        Width = 184
      end
      object edtUserName: TcxTextEdit
        Left = 103
        Top = 50
        TabOrder = 1
        Text = 'postgres'
        Width = 184
      end
      object edtDatabase: TcxTextEdit
        Left = 367
        Top = 23
        TabOrder = 2
        Text = 'box'
        Width = 162
      end
      object edtPassword: TcxTextEdit
        Left = 367
        Top = 50
        TabOrder = 3
        Text = 'd@t@box1825'
        Width = 162
      end
      object edtServer: TcxTextEdit
        Left = 212
        Top = 77
        TabOrder = 4
        Text = '192.168.2.150'
        Width = 317
      end
      object edtPort: TcxTextEdit
        Left = 103
        Top = 77
        TabOrder = 5
        Text = '8152'
        Width = 48
      end
      object btnConectar: TcxButton
        Left = 416
        Top = 131
        Width = 113
        Height = 27
        Caption = 'Conectar'
        Colors.Default = clGrayText
        Colors.DefaultText = clGrayText
        Colors.Normal = clGrayText
        Colors.NormalText = clGrayText
        Colors.Hot = clGrayText
        Colors.HotText = clGrayText
        Colors.Pressed = clGrayText
        Colors.PressedText = clGrayText
        Colors.Disabled = clGrayText
        Colors.DisabledText = clGrayText
        TabOrder = 6
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btnConectarClick
      end
      object edtSchemaName: TcxTextEdit
        Left = 103
        Top = 104
        TabOrder = 7
        Text = 'public'
        Width = 426
      end
    end
    object Panel3: TPanel
      Left = 11
      Top = 9
      Width = 1133
      Height = 46
      TabOrder = 2
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
  end
  object grdGridTabelas: TcxGrid
    Left = 0
    Top = 254
    Width = 265
    Height = 411
    Align = alLeft
    TabOrder = 1
    object grdGridTabelasView: TcxGridDBTableView
      PopupMenu = PopupMenu1
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.First.Hint = 'Primeiro Registro'
      Navigator.Buttons.First.ImageIndex = 12
      Navigator.Buttons.PriorPage.Visible = False
      Navigator.Buttons.Prior.Hint = 'Registro Anterior'
      Navigator.Buttons.Prior.ImageIndex = 13
      Navigator.Buttons.Next.Hint = 'Pr'#243'ximo Registro'
      Navigator.Buttons.Next.ImageIndex = 14
      Navigator.Buttons.NextPage.Visible = False
      Navigator.Buttons.Last.Hint = 'Ultimo Registro'
      Navigator.Buttons.Last.ImageIndex = 15
      Navigator.Buttons.Insert.Visible = False
      Navigator.Buttons.Delete.Visible = False
      Navigator.Buttons.Edit.Visible = False
      Navigator.Buttons.Post.Visible = False
      Navigator.Buttons.Cancel.Visible = False
      Navigator.Buttons.Refresh.ImageIndex = 11
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Hint = 'Salvar posi'#231#227'o do registro Selecionado'
      Navigator.Buttons.SaveBookmark.Visible = False
      Navigator.Buttons.GotoBookmark.Hint = 'Ir para a posi'#231#227'o do Registro Salvo'
      Navigator.Buttons.GotoBookmark.Visible = False
      Navigator.Buttons.Filter.ImageIndex = 5
      Navigator.Buttons.Filter.Visible = True
      Navigator.Visible = True
      DataController.DataSource = dsLista_Tabelas
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsView.NavigatorOffset = 0
      OptionsView.NoDataToDisplayInfoText = 'Nenhum registro encontrado'
      OptionsView.GridLines = glVertical
      OptionsView.GroupByBox = False
      object grdGridTabelasViewOK: TcxGridDBColumn
        DataBinding.FieldName = 'OK'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ValueChecked = 'Sim'
        Properties.ValueUnchecked = 'N'#227'o'
        Width = 24
        IsCaptionAssigned = True
      end
      object grdGridTabelasViewTABELA: TcxGridDBColumn
        Caption = 'TABELAS'
        DataBinding.FieldName = 'TABELA'
        HeaderAlignmentHorz = taCenter
        Width = 245
      end
    end
    object grdGridTabelasPrimeiroNivel: TcxGridLevel
      GridView = grdGridTabelasView
    end
  end
  object Panel2: TPanel
    Left = 265
    Top = 254
    Width = 10
    Height = 411
    Align = alLeft
    BevelOuter = bvNone
    Color = cl3DDkShadow
    ParentBackground = False
    TabOrder = 2
  end
  object script: TcxMemo
    Left = 275
    Top = 254
    Align = alClient
    Properties.ScrollBars = ssVertical
    TabOrder = 3
    Height = 411
    Width = 881
  end
  object FDConexao: TFDConnection
    ConnectionName = 'postgres'
    Params.Strings = (
      'User_Name=postgres'
      'Server='
      'Port='
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
      'varchar(3) '#39'Sim'#39' as "OK",'
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
    object qryLista_TabelasOK: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'OK'
      Origin = '"OK"'
      Size = 3
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
    Top = 272
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
    Left = 328
    Top = 408
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
