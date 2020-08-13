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
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1156
    Height = 233
    Align = alTop
    BevelOuter = bvNone
    Color = cl3DDkShadow
    ParentBackground = False
    TabOrder = 0
    object cxGroupBox1: TcxGroupBox
      Left = 563
      Top = 64
      Caption = 'Gerar'
      PanelStyle.OfficeBackgroundKind = pobkGradient
      ParentBackground = False
      ParentColor = False
      Style.BorderColor = clSkyBlue
      Style.BorderStyle = ebsFlat
      Style.Color = clYellow
      Style.LookAndFeel.Kind = lfOffice11
      Style.LookAndFeel.NativeStyle = False
      Style.LookAndFeel.SkinName = 'Office2019Colorful'
      Style.Shadow = False
      Style.TransparentBorder = True
      StyleDisabled.BorderColor = clHotLight
      StyleDisabled.LookAndFeel.Kind = lfOffice11
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.SkinName = 'Office2019Colorful'
      TabOrder = 0
      Height = 158
      Width = 582
      object label235: TLabel
        Left = 58
        Top = 52
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
      object Label8: TLabel
        Left = 345
        Top = 52
        Width = 68
        Height = 16
        Caption = 'Entidades:'
        Color = clLime
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object btn2: TcxButton
        Left = 345
        Top = 78
        Width = 226
        Height = 27
        Caption = 'Gerar Model e Controller Selecionado'
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
        OnClick = btn2Click
      end
      object btn1: TcxButton
        Left = 133
        Top = 111
        Width = 200
        Height = 27
        Caption = 'Criar Todas Classes Entidades'
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
        TabOrder = 1
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
        Top = 50
        TabOrder = 2
        Text = 'ReactServer'
        Width = 200
      end
      object edtPath: TcxTextEdit
        Left = 133
        Top = 23
        TabOrder = 3
        Text = 'c:\Classes'
        Width = 438
      end
      object edtEntidade: TcxTextEdit
        Left = 418
        Top = 50
        Enabled = False
        TabOrder = 4
        Text = 'Entidades'
        Width = 153
      end
      object btn3: TcxButton
        Left = 345
        Top = 111
        Width = 226
        Height = 27
        Caption = 'Gerar Todos os Models e Controllers'
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
        TabOrder = 5
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btn3Click
      end
      object btn4: TcxButton
        Left = 133
        Top = 78
        Width = 200
        Height = 27
        Caption = 'Criar Classe Entidade Selecionada'
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
        TabOrder = 6
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btn4Click
      end
    end
    object cxGroupBox2: TcxGroupBox
      Left = 11
      Top = 64
      Caption = 'Configura'#231#245'es de Conex'#227'o'
      Style.BorderStyle = ebsNone
      Style.LookAndFeel.NativeStyle = False
      Style.LookAndFeel.SkinName = 'Office2019Colorful'
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.SkinName = 'Office2019Colorful'
      TabOrder = 1
      Height = 158
      Width = 542
      object Label2: TLabel
        Left = 22
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
        Left = 12
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
        Left = 48
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
        Left = 141
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
      object edtDriverID: TcxTextEdit
        Left = 86
        Top = 23
        TabOrder = 0
        Text = 'PG'
        Width = 184
      end
      object edtUserName: TcxTextEdit
        Left = 86
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
        Text = '1234'
        Width = 162
      end
      object edtServer: TcxTextEdit
        Left = 195
        Top = 77
        TabOrder = 4
        Text = '192.168.2.150'
        Width = 334
      end
      object edtPort: TcxTextEdit
        Left = 86
        Top = 77
        TabOrder = 5
        Text = '5432'
        Width = 48
      end
      object btnConectar: TcxButton
        Left = 416
        Top = 109
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
    end
    object Panel3: TPanel
      Left = 11
      Top = 9
      Width = 1134
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
    Top = 233
    Width = 265
    Height = 432
    Align = alLeft
    TabOrder = 1
    object grdGridTabelasView: TcxGridDBTableView
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
    Top = 233
    Width = 10
    Height = 432
    Align = alLeft
    BevelOuter = bvNone
    Color = cl3DDkShadow
    ParentBackground = False
    TabOrder = 2
  end
  object script: TcxMemo
    Left = 275
    Top = 233
    Align = alClient
    TabOrder = 3
    Height = 432
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
    Left = 754
    Top = 248
  end
  object qryLista_Campos: TFDQuery
    CachedUpdates = True
    Connection = FDConexao
    FetchOptions.AssignedValues = [evRecsMax, evDetailCascade, evDetailServerCascade]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate, uvGeneratorName, uvCheckRequired]
    UpdateOptions.CheckRequired = False
    UpdateOptions.KeyFields = 'COLUNA'
    SQL.Strings = (
      'SELECT'
      '        a.attname as "COLUNA",'
      
        '        pg_catalog.format_type(a.atttypid, a.atttypmod) as "TIPO' +
        '"'
      '    FROM'
      '        pg_catalog.pg_attribute a'
      '    WHERE'
      '        a.attnum > 0'
      '        AND NOT a.attisdropped'
      '        AND a.attrelid = ('
      '            SELECT c.oid'
      '            FROM pg_catalog.pg_class c'
      
        '                LEFT JOIN pg_catalog.pg_namespace n ON n.oid = c' +
        '.relnamespace'
      '            WHERE c.relname = '#39'CAD_CEST'#39
      '                AND pg_catalog.pg_table_is_visible(c.oid)'
      '        )'
      #9)
    Left = 750
    Top = 405
    object qryLista_CamposCOLUNA: TWideStringField
      FieldName = 'COLUNA'
      Origin = '"COLUNA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 64
    end
    object qryLista_CamposTIPO: TWideMemoField
      AutoGenerateValue = arDefault
      FieldName = 'TIPO'
      Origin = '"TIPO"'
      ReadOnly = True
      BlobType = ftWideMemo
    end
  end
  object dsLista_Campos: TDataSource
    DataSet = qryLista_Campos
    Left = 752
    Top = 464
  end
  object dsLista_Tabelas: TDataSource
    DataSet = qryLista_Tabelas
    Left = 752
    Top = 352
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
    Left = 750
    Top = 301
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
end
