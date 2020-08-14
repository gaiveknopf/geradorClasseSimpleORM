unit unPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, IniFiles,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinTheAsphaltWorld, dxSkinTheBezier, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges, Data.DB, cxDBData, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.PG, FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, cxGridCustomTableView, cxGridTableView, cxGridServerModeTableView, FireDAC.Comp.Client, dxServerModeData, dxServerModeFireDACDataSource, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridDBTableView, cxGrid, FireDAC.DApt, Vcl.Menus, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.Comp.DataSet, cxContainer, cxTextEdit, cxCheckBox, cxMemo, cxGroupBox, dxGDIPlusClasses, cxImage,
  cxDBEdit, cxMaskEdit, cxButtonEdit, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinOffice2019Colorful, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringtime, dxSkinStardust, dxSkinSummer2008;

type
  TfrmPrincipal = class(TForm)
    FDConexao: TFDConnection;
    Panel1: TPanel;
    dsLista_Tabelas: TDataSource;
    qryLista_Tabelas: TFDQuery;
    grdGridTabelas: TcxGrid;
    grdGridTabelasView: TcxGridDBTableView;
    grdGridTabelasPrimeiroNivel: TcxGridLevel;
    Panel2: TPanel;
    script: TcxMemo;
    cxGroupBox1: TcxGroupBox;
    label235: TLabel;
    cxGroupBox2: TcxGroupBox;
    btn1: TcxButton;
    dsCFG_Geral: TDataSource;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtDriverID: TcxTextEdit;
    edtUserName: TcxTextEdit;
    edtDatabase: TcxTextEdit;
    edtPassword: TcxTextEdit;
    edtServer: TcxTextEdit;
    edtPort: TcxTextEdit;
    btnConectar: TcxButton;
    qryLista_TabelasTABELA: TWideStringField;
    grdGridTabelasViewTABELA: TcxGridDBColumn;
    edtApp: TcxTextEdit;
    Label1: TLabel;
    edtPath: TcxTextEdit;
    qryLista_TabelasOK: TWideStringField;
    grdGridTabelasViewOK: TcxGridDBColumn;
    Panel3: TPanel;
    Label9: TLabel;
    FDMIQ: TFDMetaInfoQuery;
    FDMIQRECNO: TIntegerField;
    FDMIQCATALOG_NAME: TWideStringField;
    FDMIQSCHEMA_NAME: TWideStringField;
    FDMIQTABLE_NAME: TWideStringField;
    FDMIQCOLUMN_NAME: TWideStringField;
    FDMIQCOLUMN_POSITION: TIntegerField;
    FDMIQCOLUMN_DATATYPE: TIntegerField;
    FDMIQCOLUMN_TYPENAME: TWideStringField;
    FDMIQCOLUMN_ATTRIBUTES: TLongWordField;
    FDMIQCOLUMN_PRECISION: TIntegerField;
    FDMIQCOLUMN_SCALE: TIntegerField;
    FDMIQCOLUMN_LENGTH: TIntegerField;
    cheSeparaPasta: TCheckBox;
    cheEntidade: TCheckBox;
    cheController: TCheckBox;
    cheModel: TCheckBox;
    cheInterface: TCheckBox;
    btn2: TcxButton;
    cheVideo: TCheckBox;
    edtSchemaName: TcxTextEdit;
    Label8: TLabel;
    cheAutoInc: TCheckBox;
    PopupMenu1: TPopupMenu;
    SelecionarTodos1: TMenuItem;
    DesmarcarTodos1: TMenuItem;
    procedure btnConectarClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure SelecionarTodos1Click(Sender: TObject);
    procedure DesmarcarTodos1Click(Sender: TObject);
  private
    procedure Conecta_Bancos;
    procedure Gera_Entidade(aTable: string);

    procedure Gera_Interface(aTable: string);
    procedure Gera_Model(aTable: string);

    procedure Verifica_AutoInc(autoIncField : string);
    procedure Gera_Controller(aTableName: string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;
  FClasse: TStringList;
  FPrivate: TStringList;
  FBody: TStringList;
  FInterface: TStringList;
  FProperty: TStringList;
  FPropertyInterface: TStringList;
  FProcedureLimpar: TStringList;
  FPK: TStringList;
  FTableName: String;
  FUnitName: String;
  FTipoCampo: String;
  FProjeto: String;

  VAutoInc : Boolean;

  VEntidade : TMemo;
  VController : TMemo;
  VInterface : TMemo;
  VModel : TMemo;

  SeqField : string;

implementation

{$R *.dfm}

procedure TfrmPrincipal.Gera_Entidade(aTable : string);
var
  FProperty: TStringList;
  FPropertyInterface: TStringList;
  FProcedureLimpar: TStringList;
  FPK: TStringList;
  FUnitName: String;
  FTipoCampo: String;
  MPK: String;
  I: Integer;
begin
  FInterface := TStringList.Create;
  FBody := TStringList.Create;
  FPrivate := TStringList.Create;
  FClasse := TStringList.Create;
  FProperty := TStringList.Create;
  FPropertyInterface := TStringList.Create;
  FProcedureLimpar := TStringList.Create;
  FPK := TStringList.Create;
  FClasse := TStringList.Create;

  FProcedureLimpar.Add('');

  (FDMIQ.Connection).GetKeyFieldNames('', edtSchemaName.Text, aTable, '', FPK);

  FDMIQ.Active := False;

  FDMIQ.MetaInfoKind := mkTableFields;
  FDMIQ.ObjectName := aTable;

  FDMIQ.Active := True;

  while not(FDMIQ.Eof) do
  begin
    if (FDMIQ.FieldByName('COLUMN_TYPENAME').AsString.Trim.ToUpper.Contains('INT')) then
    begin
      FTipoCampo := 'Integer';
      FProcedureLimpar.Add('  Self.' + UpperCase(FDMIQ.FieldByName('COLUMN_NAME').AsString) + ' := 0;');
    end
    else
    if ((FDMIQ.FieldByName('COLUMN_TYPENAME').AsString.Trim.ToUpper = 'NUMERIC') or
        (FDMIQ.FieldByName('COLUMN_TYPENAME').AsString.Trim.ToUpper = 'DECIMAL') or
        (FDMIQ.FieldByName('COLUMN_TYPENAME').AsString.Trim.ToUpper = 'FLOAT') or
        (FDMIQ.FieldByName('COLUMN_TYPENAME').AsString.Trim.ToUpper = 'DOUBLE PRECISION') or
        (FDMIQ.FieldByName('COLUMN_TYPENAME').AsString.Trim.ToUpper = 'DOUBLE'))
    then
    begin
      FTipoCampo := 'Currency';
      FProcedureLimpar.Add('  Self.' + UpperCase(FDMIQ.FieldByName('COLUMN_NAME').AsString) + ' := 0;');
    end
    else
    if (FDMIQ.FieldByName('COLUMN_TYPENAME').AsString.Trim.ToUpper = 'BIGINT') then
    begin
      FTipoCampo := 'Int64';
      FProcedureLimpar.Add('  Self.' + UpperCase(FDMIQ.FieldByName('COLUMN_NAME').AsString) + '(0);');
    end
    else
    if (FDMIQ.FieldByName('COLUMN_TYPENAME').AsString.Trim.ToUpper = 'BLOB SUB_TYPE 1') or
      (FDMIQ.FieldByName('COLUMN_TYPENAME').AsString.Trim.ToUpper = 'BLOB SUB_TYPE 2') or
      (FDMIQ.FieldByName('COLUMN_TYPENAME').AsString.Trim.ToUpper = 'BLOB SUB_TYPE 0') or
      (FDMIQ.FieldByName('COLUMN_TYPENAME').AsString.Trim.ToUpper = 'VARCHAR') or
      (FDMIQ.FieldByName('COLUMN_TYPENAME').AsString.Trim.ToUpper = 'CHAR')
    then
    begin
      FTipoCampo := 'String';
      FProcedureLimpar.Add('  Self.' + UpperCase(FDMIQ.FieldByName('COLUMN_NAME').AsString) + ' := '''';');
    end
    else
    if (FDMIQ.FieldByName('COLUMN_TYPENAME').AsString.Trim.ToUpper = 'VARBINARY') then
    begin
      FTipoCampo := 'TMemoField';
      FProcedureLimpar.Add('  Self.' + UpperCase(FDMIQ.FieldByName('COLUMN_NAME').AsString) + ' := '''';');
    end
    else
    if (FDMIQ.FieldByName('COLUMN_TYPENAME').AsString.Trim.ToUpper = 'DATE') or
       (FDMIQ.FieldByName('COLUMN_TYPENAME').AsString.Trim.ToUpper = 'TIME') or
       (FDMIQ.FieldByName('COLUMN_TYPENAME').AsString.Trim.ToUpper = 'TIMESTAMP') or
       (FDMIQ.FieldByName('COLUMN_TYPENAME').AsString.Trim.ToUpper = 'DATETIME')
    then
    begin
      FTipoCampo := 'TDateTime';
      FProcedureLimpar.Add('  Self.' + UpperCase(FDMIQ.FieldByName('COLUMN_NAME').AsString) + ' := 0;');
    end;

    FInterface.Add('    procedure Set' + UpperCase(FDMIQ.FieldByName('COLUMN_NAME').AsString) + ' (const Value :' + FTipoCampo + ');');
    FInterface.Add('    function Get' + UpperCase(FDMIQ.FieldByName('COLUMN_NAME').AsString) + ' :' + FTipoCampo + ';');
    FInterface.Add('');

    for I := 0 to FPK.Count-1 do
    begin
      if FPK[I].Trim.ToUpper = FDMIQ.FieldByName('COLUMN_NAME').AsString.Trim.ToUpper then
      begin
        SeqField := '';
        VAutoInc := False;

        if cheAutoInc.Checked then Verifica_AutoInc(FDMIQ.FieldByName('COLUMN_NAME').AsString);

        if VAutoInc = True then
        begin
          SeqField := FDMIQ.FieldByName('COLUMN_NAME').AsString;
          MPK := '    [Campo(' + UpperCase(FDMIQ.FieldByName('COLUMN_NAME').AsString.QuotedString) + '), PK, AutoInc]';
        end
        else
          MPK := '    [Campo(' + UpperCase(FDMIQ.FieldByName('COLUMN_NAME').AsString.QuotedString) + '), PK, ]';


        VAutoInc := False;

        Break;
      end
      else
        MPK := '    [Campo(' + UpperCase(FDMIQ.FieldByName('COLUMN_NAME').AsString.QuotedString) + ')]';
    end;
    FProperty.Add(MPK);

    FProperty.Add('    property ' + UpperCase(FDMIQ.FieldByName('COLUMN_NAME').AsString) + ' :' + FTipoCampo + ' read Get' +
      UpperCase(FDMIQ.FieldByName('COLUMN_NAME').AsString) + ' write Set' + UpperCase(FDMIQ.FieldByName('COLUMN_NAME').AsString) + ';');

    FPropertyInterface.Add('    property ' + UpperCase(FDMIQ.FieldByName('COLUMN_NAME').AsString) + ' :' + FTipoCampo + ' read Get' +
      UpperCase(FDMIQ.FieldByName('COLUMN_NAME').AsString) + ' write Set' + UpperCase(FDMIQ.FieldByName('COLUMN_NAME').AsString) + ';');

    FBody.Add('procedure T' + UpperCase(aTable) + '.Set' + UpperCase(FDMIQ.FieldByName('COLUMN_NAME').AsString) + ' (const Value :' + FTipoCampo + ');');

    FBody.Add('begin');
    FBody.Add('  F' + UpperCase(FDMIQ.FieldByName('COLUMN_NAME').AsString) + ' := Value;');
    FBody.Add('end;');
    FBody.Add('');

    FBody.Add('function T' + UpperCase(aTable) + '.Get' + UpperCase(FDMIQ.FieldByName('COLUMN_NAME').AsString) + ' :' + FTipoCampo + ';');
    FBody.Add('begin');
    FBody.Add('  Result := F' + UpperCase(FDMIQ.FieldByName('COLUMN_NAME').AsString) + ';');
    FBody.Add('end;');
    FBody.Add('');

    FPrivate.Add('    F' + UpperCase(FDMIQ.FieldByName('COLUMN_NAME').AsString) + ' :' + FTipoCampo + ';');
    FDMIQ.Next;
  end;

  FClasse.Clear;
  FClasse.Add('unit ' + edtApp.Text + '.Model.Entidade.' + UpperCase(aTable) + ';');
  FClasse.Add('');
  FClasse.Add('interface');
  FClasse.Add('');
  FClasse.Add('uses ');
  FClasse.Add('  SimpleAttributes;');
  FClasse.Add('');
  FClasse.Add('type');
  FClasse.Add('  [Tabela(''' + UpperCase(aTable) + ''')]');
  FClasse.Add('  T' + UpperCase(aTable) + ' = class');
  FClasse.Add('  private');
  FClasse.Add(FPrivate.Text);
  FClasse.Add(FInterface.Text);
  FClasse.Add('  public');
  FClasse.Add('    constructor Create;');
  FClasse.Add('    destructor Destroy; override;');
  FClasse.Add('    procedure Limpar;');
  FClasse.Add(FProperty.Text);
  FClasse.Add('end;');
  FClasse.Add('');
  FClasse.Add('implementation');
  FClasse.Add('');
  FClasse.Add('constructor T' + UpperCase(aTable) + '.Create;');
  FClasse.Add('begin');
  FClasse.Add('  Limpar;');
  FClasse.Add('end;');
  FClasse.Add('');
  FClasse.Add('destructor T' + UpperCase(aTable) + '.Destroy;');
  FClasse.Add('begin');
  FClasse.Add('');
  FClasse.Add('  inherited;');
  FClasse.Add('end;');
  FClasse.Add('');
  FClasse.Add(FBody.Text);
  FClasse.Add('procedure T' + UpperCase(aTable) + '.Limpar;');
  FClasse.Add('begin');
  FClasse.Add(FProcedureLimpar.Text);
  FClasse.Add('end;');
  FClasse.Add('');
  FClasse.Add('end.');

  VEntidade.Text := FClasse.Text;

  script.Text := FClasse.Text;

  FDMIQ.Active := False;
end;


procedure TfrmPrincipal.Gera_Interface(aTable: string);
begin

end;

procedure TfrmPrincipal.Gera_Model(aTable: string);
begin

end;

procedure TfrmPrincipal.SelecionarTodos1Click(Sender: TObject);
begin
  qryLista_Tabelas.First;
  while not qryLista_Tabelas.Eof do
    begin
      qryLista_tabelas.Edit;
      qryLista_TabelasOK.asString := 'Sim';
      qryLista_tabelas.Post;

      qryLista_tabelas.Next;
    end;
end;

procedure TfrmPrincipal.Verifica_AutoInc(autoIncField : string);
var
  FClasse: TStringList;
  i: integer;
  sequence : string;
begin
  sequence := qryLista_TabelasTABELA.AsString + '_' + autoIncField + '_seq';

  FClasse := TStringList.Create;
  FDConexao.GetGeneratorNames('', edtSchemaName.Text, sequence, FClasse);

  if FClasse.count = 1 then
    begin
      VAutoInc := True;
    end;
end;

procedure TfrmPrincipal.btnConectarClick(Sender: TObject);
begin
  if btnConectar.Caption = 'Conectar' then
    begin
      FDConexao.Connected := False;
      Conecta_Bancos;
      btnConectar.Caption := 'Desconectar';
      btn1.Enabled := True;
      btn2.Enabled := True;
      qryLista_Tabelas.Open();
    end
  else
    begin
      FDConexao.Connected := False;
      btnConectar.Caption := 'Conectar';
      btn1.Enabled := False;
      btn2.Enabled := False;
    end;
end;

procedure TfrmPrincipal.Conecta_Bancos;
begin
  // Parametros BD
  if (edtDriverID.Text = '') or (edtDriverID.Text = '') or (edtDriverID.Text = '') or (edtDriverID.Text = '') or (edtDriverID.Text = '') or (edtDriverID.Text = '') then
    begin
      ShowMessage('Preencha os campos referente ao servidor');
    end
  else
    begin
      FDConexao.Params.DriverID := edtDriverID.Text;
      FDConexao.Params.Database := edtDatabase.Text;
      FDConexao.Params.UserName := edtUserName.Text;
      FDConexao.Params.Password := edtPassword.Text;
      FDConexao.Params.Values['Port'] := edtPort.Text;
      FDConexao.Params.Values['Server'] := edtServer.Text;

      try
        // Tenta conectar no Banco de Dados
        FDConexao.Connected := True;
      except
        // Se a conexão falhar mostra mensagem
        on e: Exception do
        begin
          ShowMessage(e.Message);
        end;
      end;
    end;
end;

procedure TfrmPrincipal.DesmarcarTodos1Click(Sender: TObject);
begin
  qryLista_Tabelas.First;
  while not qryLista_Tabelas.Eof do
    begin
      qryLista_tabelas.Edit;
      qryLista_TabelasOK.asString := 'Não';
      qryLista_tabelas.Post;

      qryLista_tabelas.Next;
    end;
end;

procedure TfrmPrincipal.btn2Click(Sender: TObject);
begin
  qryLista_Tabelas.First;
  while not qryLista_Tabelas.Eof do
    begin
      if qryLista_TabelasOK.asString = 'Sim' then
        begin
          //Gera Entidade
          if cheEntidade.Checked then Gera_Entidade(qryLista_TabelasTABELA.AsString);
          if cheController.Checked then Gera_Controller(qryLista_TabelasTABELA.AsString);

//          if cheInterface.Checked then Gera_Entidade(qryLista_TabelasTABELA.AsString);
//          if cheModel.Checked then Gera_Entidade(qryLista_TabelasTABELA.AsString);

          //Separado Por Pasta
          if cheSeparaPasta.Checked then
          begin
            if cheVideo.Checked = false then
            begin
              //Entidade
              if cheEntidade.Checked then
              begin
                if not DirectoryExists(edtPath.Text) then
                  CreateDir(edtPath.Text);
                if not DirectoryExists(edtPath.Text + '\src') then
                  CreateDir(edtPath.Text + '\src');
                if not DirectoryExists(edtPath.Text + '\src\' + qryLista_TabelasTABELA.asString) then
                  CreateDir(edtPath.Text + '\src\' + qryLista_TabelasTABELA.asString);
                VEntidade.Lines.SaveToFile(edtPath.Text + '\src\' + qryLista_TabelasTABELA.asString + '\' + edtApp.Text + '.Model.Entidades.' + UpperCase(qryLista_TabelasTABELA.asString) + '.pas');
              end;
              //Controller
              if cheController.Checked then
              begin
                if not DirectoryExists(edtPath.Text) then
                  CreateDir(edtPath.Text);
                if not DirectoryExists(edtPath.Text + '\src') then
                  CreateDir(edtPath.Text + '\src');
                if not DirectoryExists(edtPath.Text + '\src\' + qryLista_TabelasTABELA.asString) then
                  CreateDir(edtPath.Text + '\src\' + qryLista_TabelasTABELA.asString);
                VController.Lines.SaveToFile(edtPath.Text + '\src\' + qryLista_TabelasTABELA.asString + '\' + edtApp.Text + '.Controller.' + UpperCase(qryLista_TabelasTABELA.asString) + '.pas');
              end;
              //Interface
              if cheInterface.Checked then
              begin

              end;
              //Model
              if cheModel.Checked then
              begin

              end;
            end;
          end
          else
          //Todos na mesma pasta
          begin
            if cheVideo.Checked = false then
            begin
              //Entidade
              if cheEntidade.Checked then
              begin
                if not DirectoryExists(edtPath.Text) then
                  CreateDir(edtPath.Text);
                if not DirectoryExists(edtPath.Text + '\src') then
                  CreateDir(edtPath.Text + '\src');
                VEntidade.Lines.SaveToFile(edtPath.Text + '\src\' + edtApp.Text + '.Model.Entidades.' + UpperCase(qryLista_TabelasTABELA.asString) + '.pas');
              end;
              //Controller
              if cheController.Checked then
              begin
                if not DirectoryExists(edtPath.Text) then
                  CreateDir(edtPath.Text);
                if not DirectoryExists(edtPath.Text + '\src') then
                  CreateDir(edtPath.Text + '\src');
                VController.Lines.SaveToFile(edtPath.Text + '\src\' + qryLista_TabelasTABELA.asString + '\' + edtApp.Text + '.Controller.' + UpperCase(qryLista_TabelasTABELA.asString) + '.pas');
              end;
              //Interface
              if cheInterface.Checked then
              begin

              end;
              //Model
              if cheModel.Checked then
              begin

              end;
            end;
          end;
        end;
      qryLista_Tabelas.Next;
    end;

  ShowMessage('Arquivos gerados com sucesso');
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  VEntidade := TMemo.Create(Self);
  VController := TMemo.Create(Self);
  VInterface := TMemo.Create(Self);
  VModel := TMemo.Create(Self);
end;

procedure TfrmPrincipal.Gera_Controller(aTableName : string);
var
  ArqController : TStringList;
begin
  ArqController := TStringList.Create;
  try
    ArqController.Add('unit ServerReact.Controller.' + aTableName.toUpper + ';');
    ArqController.Add('');
    ArqController.Add('interface');
    ArqController.Add('');
    ArqController.Add('uses');
    ArqController.Add('Horse,');
    ArqController.Add('System.JSON,');
    ArqController.Add('ServerReact.Model.DAOGeneric,');
    ArqController.Add('ServerReact.Model.Entidades.' + aTableName.toUpper + ';');
    ArqController.Add('');
    ArqController.Add('procedure Registry(App : THorse);');
    ArqController.Add('procedure Get(Req: THorseRequest; Res: THorseResponse; Next: TProc);');
    ArqController.Add('procedure GetID(Req: THorseRequest; Res: THorseResponse; Next: TProc);');
    ArqController.Add('procedure Insert(Req: THorseRequest; Res: THorseResponse; Next: TProc);');
    ArqController.Add('procedure Update(Req: THorseRequest; Res: THorseResponse; Next: TProc);');
    ArqController.Add('procedure Delete(Req: THorseRequest; Res: THorseResponse; Next: TProc);');
    ArqController.Add('');
    ArqController.Add('implementation');
    ArqController.Add('');
    ArqController.Add('procedure Registry(App : THorse);');
    ArqController.Add('begin');
    ArqController.Add('  App.Get(''/' + LowerCase(aTableName) + ''', Get);');
    ArqController.Add('  App.Get(''/' + LowerCase(aTableName) + '/:id'', GetId);');
    ArqController.Add('  App.Post(''/' + LowerCase(aTableName)  + ''', Insert);');
    ArqController.Add('  App.Put(''/' + LowerCase(aTableName)  + '/:id'', Update);');
    ArqController.Add('  App.Delete(''/' + LowerCase(aTableName)  + '/:id'', Delete);');
    ArqController.Add('end;');
    ArqController.Add('');
    ArqController.Add('procedure Get(Req: THorseRequest; Res: THorseResponse; Next: TProc);');
    ArqController.Add('var');
    ArqController.Add('  FDAO : iDAOGeneric<T' + aTableName.toUpper + '>;');
    ArqController.Add('begin');
    ArqController.Add('  FDAO := TDAOGeneric<T' + aTableName.toUpper + '>.New;');
    ArqController.Add('  Res.Send<TJsonArray>(FDAO.Find);');
    ArqController.Add('end;');
    ArqController.Add('');
    ArqController.Add('procedure GetID(Req: THorseRequest; Res: THorseResponse; Next: TProc);');
    ArqController.Add('var');
    ArqController.Add('  FDAO : iDAOGeneric<T' + aTableName.toUpper + '>;');
    ArqController.Add('begin');
    ArqController.Add('  FDAO := TDAOGeneric<T' + aTableName.toUpper + '>.New;');
    ArqController.Add('  Res.Send<TJsonObject>(FDAO.Find(Req.Params.Items[''id'']));');
    ArqController.Add('end;');
    ArqController.Add('');
    ArqController.Add('procedure Insert(Req: THorseRequest; Res: THorseResponse; Next: TProc);');
    ArqController.Add('var');
    ArqController.Add('  FDAO : iDAOGeneric<T' + aTableName.toUpper + '>;');
    ArqController.Add('begin');
    ArqController.Add('  FDAO := TDAOGeneric<T' + aTableName.toUpper + '>.New;');
    ArqController.Add('  Res.Send<TJsonObject>(FDAO.Insert(Req.Body<TJsonObject>));');
    ArqController.Add('end;');
    ArqController.Add('');
    ArqController.Add('procedure Update(Req: THorseRequest; Res: THorseResponse; Next: TProc);');
    ArqController.Add('var');
    ArqController.Add('  FDAO : iDAOGeneric<T' + aTableName.toUpper + '>;');
    ArqController.Add('begin');
    ArqController.Add('  FDAO := TDAOGeneric<T' + aTableName.toUpper + '>.New;');
    ArqController.Add('  Res.Send<TJsonObject>(FDAO.Update(Req.Body<TJsonObject>));');
    ArqController.Add('end;');
    ArqController.Add('');
    ArqController.Add('procedure Delete(Req: THorseRequest; Res: THorseResponse; Next: TProc);');
    ArqController.Add('var');
    ArqController.Add('  FDAO : iDAOGeneric<T' + aTableName.toUpper + '>;');
    ArqController.Add('begin');
    ArqController.Add('  FDAO := TDAOGeneric<T' + aTableName.toUpper + '>.New;');
    if SeqField = '' then
    ArqController.Add('  Res.Send<TJsonObject>(FDAO.Delete(''{ Colocar Campo ID Correto }'', Req.Params.Items[''id'']));')
    else
    ArqController.Add('  Res.Send<TJsonObject>(FDAO.Delete(''' + SeqField + ''', Req.Params.Items[''id'']));');
    ArqController.Add('end;');
    ArqController.Add('');
    ArqController.Add('end.');
  finally
    if script.Text <> '' then script.Lines.Add('');
    script.Text := script.Text + ArqController.Text;
    VController.Text := ArqController.Text;
    ArqController.Free;
  end;
end;

procedure TfrmPrincipal.btn1Click(Sender: TObject);
begin
  //Gera Entidade
  if cheEntidade.Checked then Gera_Entidade(qryLista_TabelasTABELA.AsString);
  if cheController.Checked then Gera_Controller(qryLista_TabelasTABELA.AsString);

//  if cheModel.Checked then Gera_Entidade(qryLista_TabelasTABELA.AsString);

//  if cheInterface.Checked then Gera_Entidade(qryLista_TabelasTABELA.AsString);


  //Separado Por Pasta
  if cheSeparaPasta.Checked then
  begin
    if cheVideo.Checked = false then
    begin
      //Entidade
      if cheEntidade.Checked then
      begin
        if not DirectoryExists(edtPath.Text) then
          CreateDir(edtPath.Text);
        if not DirectoryExists(edtPath.Text + '\src') then
          CreateDir(edtPath.Text + '\src');
        if not DirectoryExists(edtPath.Text + '\src\' + qryLista_TabelasTABELA.asString) then
          CreateDir(edtPath.Text + '\src\' + qryLista_TabelasTABELA.asString);
        VEntidade.Lines.SaveToFile(edtPath.Text + '\src\' + qryLista_TabelasTABELA.asString + '\' + edtApp.Text + '.Model.Entidades.' + UpperCase(qryLista_TabelasTABELA.asString) + '.pas');
      end;
      //Controller
      if cheController.Checked then
      begin
        if not DirectoryExists(edtPath.Text) then
          CreateDir(edtPath.Text);
        if not DirectoryExists(edtPath.Text + '\src') then
          CreateDir(edtPath.Text + '\src');
        if not DirectoryExists(edtPath.Text + '\src\' + qryLista_TabelasTABELA.asString) then
          CreateDir(edtPath.Text + '\src\' + qryLista_TabelasTABELA.asString);
        VController.Lines.SaveToFile(edtPath.Text + '\src\' + qryLista_TabelasTABELA.asString + '\' + edtApp.Text + '.Controller.' + UpperCase(qryLista_TabelasTABELA.asString) + '.pas');
      end;
      //Interface
      if cheInterface.Checked then
      begin

      end;
      //Model
      if cheModel.Checked then
      begin

      end;
    end;
  end
  else
  //Todos na mesma pasta
  begin
    if cheVideo.Checked = false then
    begin
      //Entidade
      if cheEntidade.Checked then
      begin
        if not DirectoryExists(edtPath.Text) then
          CreateDir(edtPath.Text);
        if not DirectoryExists(edtPath.Text + '\src') then
          CreateDir(edtPath.Text + '\src');
        VEntidade.Lines.SaveToFile(edtPath.Text + '\src\' + edtApp.Text + '.Model.Entidades.' + UpperCase(qryLista_TabelasTABELA.asString) + '.pas');
      end;
      //Controller
      if cheController.Checked then
      begin
        if not DirectoryExists(edtPath.Text) then
          CreateDir(edtPath.Text);
        if not DirectoryExists(edtPath.Text + '\src') then
          CreateDir(edtPath.Text + '\src');
        VController.Lines.SaveToFile(edtPath.Text + '\src\' + qryLista_TabelasTABELA.asString + '\' + edtApp.Text + '.Controller.' + UpperCase(qryLista_TabelasTABELA.asString) + '.pas');
      end;
      //Interface
      if cheInterface.Checked then
      begin

      end;
      //Model
      if cheModel.Checked then
      begin

      end;
    end;
  end;

  ShowMessage('Arquivos gerados com sucesso');
end;

end.
