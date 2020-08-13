unit unPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, IniFiles,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinOffice2019Colorful, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringtime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinTheBezier, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges, Data.DB, cxDBData, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.PG, FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, cxGridCustomTableView, cxGridTableView, cxGridServerModeTableView, FireDAC.Comp.Client, dxServerModeData, dxServerModeFireDACDataSource, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridDBTableView, cxGrid, FireDAC.DApt, Vcl.Menus, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.Comp.DataSet, cxContainer, cxTextEdit, cxCheckBox, cxMemo, cxGroupBox, dxGDIPlusClasses, cxImage,
  cxDBEdit, cxMaskEdit, cxButtonEdit, Vcl.DBCtrls;

type
  TfrmPrincipal = class(TForm)
    FDConexao: TFDConnection;
    Panel1: TPanel;
    qryLista_Campos: TFDQuery;
    dsLista_Campos: TDataSource;
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
    btn2: TcxButton;
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
    qryLista_CamposCOLUNA: TWideStringField;
    qryLista_CamposTIPO: TWideMemoField;
    grdGridTabelasViewTABELA: TcxGridDBColumn;
    edtApp: TcxTextEdit;
    Label1: TLabel;
    edtPath: TcxTextEdit;
    qryLista_TabelasOK: TWideStringField;
    grdGridTabelasViewOK: TcxGridDBColumn;
    Label8: TLabel;
    edtEntidade: TcxTextEdit;
    Panel3: TPanel;
    Label9: TLabel;
    btn3: TcxButton;
    procedure btnConectarClick(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
  private
    procedure Conecta_Bancos;
    procedure GerarController(aTableName: string);
    procedure GerarClassController(aPath, aTableName: string);
    function EliminaBrancos(sTexto: String): String;
    function RemoveAcento(s: string): string;
    procedure Gera_Model_Controller;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;
  FQuery : TFDQuery;

implementation

{$R *.dfm}

function TfrmPrincipal.RemoveAcento(s: string): string;
var
  i : integer;
  aux, novo : string;
begin
  aux := AnsiUpperCase(s);
    for i := 1 to length(aux) do
    begin
      case aux[i] of
      'Б', 'В', 'Г', 'А', 'Д', 'б', 'в', 'г', 'а', 'д': aux[i] := 'A';
      'Й', 'К', 'И', 'Л', 'й', 'к', 'и', 'л', '&': aux[i] := 'E';
      'Н', 'О', 'М', 'П', 'н', 'о', 'м', 'п': aux[i] := 'I';
      'У', 'Ф', 'Х', 'Т', 'Ц', 'у', 'ф', 'х', 'т', 'ц': aux[i] := 'O';
      'Ъ', 'Ы', 'Щ', 'Ь', 'ъ', 'ы', 'щ', 'ь': aux[i] := 'U';
      'З', 'з': aux[i] := 'C';
      'С', 'с': aux[i] := 'N';
      'Э', 'э': aux[i] := 'Y';
      else
        if ord(aux[i]) > 127 then
          aux[i] := #32;
      end;
    end;
  RemoveAcento := aux;
end;

function TfrmPrincipal.EliminaBrancos(sTexto: String): String;
// Elimina todos os espaзos em branco da string
//(inclusive os espaзos entre as palavras)
var
nPos : Integer;
begin
  nPos := 1;
  while Pos(' ',sTexto) > 0 do
  begin
    nPos := Pos(' ',sTexto);
    (*Text[nPos] := ''; *)
    Delete(sTexto,nPos,1);
  end;
  Result := sTexto;
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
      btn3.Enabled := True;

      qryLista_Tabelas.Open();
      qryLista_Campos.Open('SELECT ' +
                           'a.attname as "COLUNA", ' +
                           'pg_catalog.format_type(a.atttypid, a.atttypmod) as TIPO ' +
                           'FROM ' +
                           'pg_catalog.pg_attribute a ' +
                           'WHERE ' +
                           'a.attnum > 0 ' +
                           'AND NOT a.attisdropped ' +
                           'AND a.attrelid = ( ' +
                           'SELECT c.oid ' +
                           'FROM pg_catalog.pg_class c ' +
                           'LEFT JOIN pg_catalog.pg_namespace n ON n.oid = c.relnamespace ' +
                           'WHERE c.relname = ' + QuotedStr(qryLista_TabelasTABELA.asString) + ' ' +
                           'AND pg_catalog.pg_table_is_visible(c.oid) ' +
                           ')');
    end
  else
    begin
      FDConexao.Connected := False;
      btnConectar.Caption := 'Conectar';
      btn1.Enabled := False;
      btn2.Enabled := False;
      btn3.Enabled := False;
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
        // Se a conexгo falhar mostra mensagem
        on e: Exception do
        begin
          ShowMessage(e.Message);
        end;
      end;
    end;
end;

procedure TfrmPrincipal.btn3Click(Sender: TObject);
begin
  if edtApp.Text = '' then
    begin
      ShowMessage('Preencha o campo nome do aplicativo');
      abort
     end;
  qryLista_Tabelas.First;
  while not qryLista_Tabelas.Eof do
  begin
    Gera_Model_Controller;

    qryLista_Tabelas.Next;
  end;

  ShowMessage('Models e Controllers criados com sucesso');
end;

procedure TfrmPrincipal.btn2Click(Sender: TObject);
var
  Tabelas : TStringList;
  I : Integer;
begin
  if edtApp.Text = '' then
    begin
      ShowMessage('Preencha o campo nome do aplicativo');
      abort
     end;

  Gera_Model_Controller;

  ShowMessage('Model e Controller criados com sucesso');
end;

procedure TfrmPrincipal.Gera_Model_Controller;
var
 campo, tabela : string;
 i, j : Integer;
begin
  for j := 0 to qryLista_Tabelas.RecordCount -1 do
  begin
    Application.ProcessMessages;
    if qryLista_TabelasOK.asString = 'Sim' then
    begin
      tabela := RemoveAcento(qryLista_TabelasTABELA.AsString);

      script.Lines.Clear;
      script.lines.add('unit ' + edtApp.Text + '.Model.' + tabela + '.Interfaces;');
      script.lines.add('');
      script.lines.add('interface');
      script.lines.add('');
      script.lines.add('uses');
      script.lines.add('  ' + edtApp.Text + '.' + edtEntidade.Text + '.' + tabela + ', SimpleInterface, Data.DB;');
      script.lines.add('');
      script.lines.add('type');
      script.lines.add('  iModel'+ tabela +' = interface');
      script.lines.add('    [gerar assinatura ctrl+shift+g]');
      script.lines.add('    function Entidade : T' + tabela + ';');
      script.lines.add('    function DAO : iSimpleDAO<T' + tabela + '>;');
      script.lines.add('    function DataSource(aDataSource : TDataSource) : iModel' + tabela + ';');
      script.lines.add('  end;');
      script.lines.add('');
      script.lines.add('implementation');
      script.lines.add('');
      script.lines.add('end.');

            if not DirectoryExists(edtPath.Text) then
              CreateDir(edtPath.Text);
            if not DirectoryExists(edtPath.Text + '\src') then
              CreateDir(edtPath.Text + '\src');
            script.Lines.SaveToFile(edtPath.Text+'\src\' + edtApp.Text + '.Model.' + tabela + '.Interfaces.pas');

      script.Lines.Clear;
      script.lines.add('unit ' + edtApp.Text + '.Model.' + tabela + ';');
      script.lines.add('');
      script.lines.add('interface');
      script.lines.add('');
      script.lines.add('uses');
      script.lines.add('  ' + edtApp.Text + '.Model.' + tabela + '.Interfaces, ' + edtApp.Text + '.Entidades.' + tabela + ', SimpleInterface,');
      script.lines.add('  Data.DB, SimpleDAO, SimpleQueryRestDW;');
      script.lines.add('');
      script.lines.add('type');
      script.lines.add('  TModel' + tabela + ' = class(TInterfacedObject, iModel' + tabela + ')');
      script.lines.add('    private');
      script.lines.add('      FEntidade : T' + tabela + ';');
      script.lines.add('      FDAO : iSimpleDAO<T' + tabela + '>;');
      script.lines.add('      FDataSource : TDataSource;');
      script.lines.add('    public');
      script.lines.add('      constructor Create;');
      script.lines.add('      destructor Destroy; override;');
      script.lines.add('      class function New : iModel' + tabela + ';');
      script.lines.add('      function Entidade: T' + tabela + ';');
      script.lines.add('      function DAO: iSimpleDAO<T' + tabela + '>;');
      script.lines.add('      function DataSource(aDataSource: TDataSource): iModel' + tabela + ';');
      script.lines.add('  end;');
      script.lines.add('');
      script.lines.add('implementation');
      script.lines.add('');
      script.lines.add('{ TModel' + tabela + ' }');
      script.lines.add('');
      script.lines.add('uses System.SysUtils;');
      script.lines.add('');
      script.lines.add('constructor TModel' + tabela + '.Create;');
      script.lines.add('begin');
      script.lines.add('  FEntidade := T' + tabela + '.Create;');
      script.lines.add('  FDAO := TSimpleDAO<T' + tabela + '>.New;');
      script.lines.add('end;');
      script.lines.add('');
      script.lines.add('function TModel' + tabela + '.DAO: iSimpleDAO<T' + tabela + '>;');
      script.lines.add('begin');
      script.lines.add('  Result := FDAO;');
      script.lines.add('end;');
      script.lines.add('');
      script.lines.add('function TModel' + tabela + '.DataSource(aDataSource: TDataSource): iModel' + tabela + ';');
      script.lines.add('begin');
      script.lines.add('  Result := Self;');
      script.lines.add('  FDataSource := aDataSource;');
      script.lines.add('  FDAO.DataSource(FDatasource);');
      script.lines.add('end;');
      script.lines.add('');
      script.lines.add('destructor TModel' + tabela + '.Destroy;');
      script.lines.add('begin');
      script.lines.add('  Freeandnil(FEntidade);');
      script.lines.add('  inherited;');
      script.lines.add('end;');
      script.lines.add('');
      script.lines.add('function TModel' + tabela + '.Entidade: T' + tabela + ';');
      script.lines.add('begin');
      script.lines.add('  Result := FEntidade;');
      script.lines.add('end;');
      script.lines.add('');
      script.lines.add('class function TModel' + tabela + '.New : iModel' + tabela + ';');
      script.lines.add('begin');
      script.lines.add('  Result := Self.Create;');
      script.lines.add('end;');
      script.lines.add('');
      script.lines.add('end.');

          if not DirectoryExists(edtPath.Text) then
            CreateDir(edtPath.Text);
          if not DirectoryExists(edtPath.Text + '\src') then
            CreateDir(edtPath.Text + '\src');
          script.Lines.SaveToFile(edtPath.Text + '\src\' + edtApp.Text + '.Model.' + tabela + '.pas');

      script.Lines.Clear;
      script.lines.add('unit ' + edtApp.Text + '.Controller.' + tabela + '.Interfaces;');
      script.lines.add('');
      script.lines.add('interface');
      script.lines.add('');
      script.lines.add('uses');
      script.lines.add('  Data.DB, ' + edtApp.Text + '.Entidades.' + tabela + ', System.JSON, System.Generics.Collections, Vcl.Forms;');
      script.lines.add('');
      script.lines.add('type');
      script.lines.add('  iController' + tabela + ' = interface');
      script.lines.add('    [GERAR ASSINATURA]');
      script.lines.add('    function DataSource (aDataSource : TDataSource) : iController' + tabela + '; overload;');
      script.lines.add('    function DataSource : TDataSource; overload;');
      script.lines.add('    function Buscar : iController' + tabela + '; overload;');
      script.lines.add('    function Buscar(aID : integer) : iController' + tabela + '; overload;');
      script.lines.add('    function Buscar(aFiltro : TJsonobject; aOrdem : string) : iController' + tabela + '; overload;');
      script.lines.add('    function Buscar(aSQL : string) : iController' + tabela + '; overload;');
      script.lines.add('    function Insert : iController' + tabela + ';');
      script.lines.add('    function Delete : iController' + tabela + ';');
      script.lines.add('    function Update : iController' + tabela + ';');
      script.lines.add('    function Clear: iController' + tabela + ';');
      script.lines.add('    function Ultimo(where : string) : iController' + tabela + ';');
      script.lines.add('    function ' + tabela + ' : T' + tabela + ';');
      script.lines.add('    function FromJsonObject(aJson : TJsonObject) : iController' + tabela + ';');
      script.lines.add('    function List : TObjectList<T' + tabela + '>;');
      script.lines.add('    function ExecSQL(sql : string) : iController' + tabela + ';');
      script.lines.add('    function BindForm(aForm : TForm) : iController' + tabela + ';');
      script.lines.add('  end;');
      script.lines.add('');
      script.lines.add('implementation');
      script.lines.add('');
      script.lines.add('end.');

          if not DirectoryExists(edtPath.Text) then
            CreateDir(edtPath.Text);
          if not DirectoryExists(edtPath.Text + '\src') then
            CreateDir(edtPath.Text + '\src');
          script.Lines.SaveToFile(edtPath.Text + '\src\' + edtApp.Text + '.Controller.' + tabela + '.Interfaces.pas');

      script.Lines.Clear;
      script.lines.add('unit ' + edtApp.Text + '.Controller.' + tabela + ';');
      script.lines.add('');
      script.lines.add('interface');
      script.lines.add('');
      script.lines.add('uses');
      script.lines.add('  ' + edtApp.Text + '.Controller.' + tabela + '.Interfaces, Data.DB, ' + edtApp.Text + '.Entidades.' + tabela + ',');
      script.lines.add('  ' + edtApp.Text + '.Model.' + tabela + '.Interfaces, System.Generics.Collections,');
      script.lines.add('  System.Json, REST.Json, Vcl.Forms, SimpleRTTI;');
      script.lines.add('');
      script.lines.add('type');
      script.lines.add('  TController' + tabela + ' = class(TInterfacedObject, iController' + tabela + ')');
      script.lines.add('  private');
      script.lines.add('    FModel : iModel' + tabela + ';');
      script.lines.add('    FDataSource : TDataSource;');
      script.lines.add('    FList : TObjectList<T' + tabela + '>;');
      script.lines.add('    FEntidade : T' + tabela + ';');
      script.lines.add('  public');
      script.lines.add('    constructor Create;');
      script.lines.add('    destructor Destroy; override;');
      script.lines.add('    class function New: iController' + tabela + ';');
      script.lines.add('    function DataSource(aDataSource: TDataSource): iController' + tabela + '; overload;');
      script.lines.add('    function DataSource : TDataSource; overload;');
      script.lines.add('    function Buscar: iController' + tabela + '; overload;');
      script.lines.add('    function Buscar(aID : integer) : iController' + tabela + '; overload;');
      script.lines.add('    function Buscar(aFiltro : TJsonobject; aOrdem : string) : iController' + tabela + '; overload;');
      script.lines.add('    function Buscar(aSQL : string) : iController' + tabela + '; overload;');
      script.lines.add('    function Insert: iController' + tabela + ';');
      script.lines.add('    function Delete: iController' + tabela + ';');
      script.lines.add('    function Update: iController' + tabela + ';');
      script.lines.add('    function Clear: iController' + tabela + ';');
      script.lines.add('    function Ultimo(where : string) : iController' + tabela + ';');
      script.lines.add('    function ' + tabela + ': T' + tabela + ';');
      script.lines.add('    function FromJsonObject(aJson : TJsonObject) : iController' + tabela + ';');
      script.lines.add('    function List : TObjectList<T' + tabela + '>;');
      script.lines.add('    function ExecSQL(sql : string) : iController' + tabela + ';');
      script.lines.add('    function BindForm(aForm : TForm) : iController' + tabela + ';');
      script.lines.add('');
      script.lines.add('  end;');
      script.lines.add('');
      script.lines.add('implementation');
      script.lines.add('');
      script.lines.add('uses');
      script.lines.add('  ' + edtApp.Text + '.Model, System.SysUtils;');
      script.lines.add('');
      script.lines.add('{ TController' + tabela + ' }');
      script.lines.add('');

      script.lines.add('function TController' + tabela + '.Buscar: iController' + tabela + ';');
      script.lines.add('begin');
      script.lines.add('  Result := Self;');
      script.lines.add('');
      script.lines.add('  if not Assigned(FList) then');
      script.lines.add('    FList := TObjectList<T' + tabela + '>.Create;');
      script.lines.add('');
      script.lines.add('  FModel.DAO.Find(FList);');
      script.lines.add('end;');
      script.lines.add('');

      script.lines.add('function TController' + tabela + '.Buscar(aID: integer): iController' + tabela + ';');
      script.lines.add('var aux : string;');
      script.lines.add('begin');
      script.lines.add('  Result := Self;');
      script.lines.add('');
      script.lines.add('  if Assigned(FEntidade) then');
      script.lines.add('    Freeandnil(FEntidade);');
      script.lines.add('');
      script.lines.add('  FEntidade := FModel.DAO.Find(aID);');
      script.lines.add('end;');
      script.lines.add('');

      script.lines.add('function TController' + tabela + '.Buscar(aFiltro : TJsonobject; aOrdem : string) : iController'+tabela+';');
      script.lines.add('var');
      script.lines.add('  Item: TJSONPair;');
      script.lines.add('  sql : string;');
      script.lines.add('begin');
      script.lines.add('  Result := Self;');
      script.lines.add('  if not Assigned(FList) then');
      script.lines.add('    FList := TObjectList<T' + tabela + '>.Create;');
      script.lines.add('  try');
      script.lines.add('    for Item in afiltro do');
      script.lines.add('    begin');
      script.lines.add('      if item.JsonString.Value = ''SQL'' then');
      script.lines.add('      begin');
      script.lines.add('        sql := (Item.JsonValue.Value);');
      script.lines.add('      end');
      script.lines.add('      else');
      script.lines.add('      begin');
      script.lines.add('        if sql <> '' then');
      script.lines.add('          sql := sql + '' and '';');
      script.lines.add('');
      script.lines.add('        if UpperCase(Item.JsonString.Value) = ''DESCRICAO'' then   // verificar o campo de descriзгo');
      script.lines.add('          sql := sql + UpperCase(Item.JsonString.Value) + '' containing '' + Quotedstr(Item.JsonValue.Value)');
      script.lines.add('        else');
      script.lines.add('          sql := sql + UpperCase(Item.JsonString.Value) + '' = '' + Quotedstr(Item.JsonValue.Value);');
      script.lines.add('      end;');
      script.lines.add('    end;');
      script.lines.add('    FModel.DAO.SQL.Where(sql).OrderBy(aOrdem).&End.Find(FList);');
      script.lines.add('  finally');
      script.lines.add('    Item.Free;');
      script.lines.add('  end;');
      script.lines.add('end;');
      script.lines.add('');

      script.lines.add('function TController' + tabela + '.Buscar(aSQL : string) : iController' + tabela + ';');
      script.lines.add('begin');
      script.lines.add('  Result := Self;');
      script.lines.add('  try');
      script.lines.add('    FModel.DAO.Find(aSQL, FList);');
      script.lines.add('  except');
      script.lines.add('  end;');
      script.lines.add('end;');
      script.lines.add('');

      script.lines.add('function TController' + tabela + '.BindForm(aForm: TForm): iController' + tabela + ';');
      script.lines.add('begin');
      script.lines.add('  Result := Self;');
      script.lines.add('  Clear;');
      script.lines.add('  TSimpleRTTI<' + tabela + '>.New(nil).BindFormToClass(aForm, FEntidade);');
      script.lines.add('end;');
      script.lines.add('');

      script.lines.add('function TController' + tabela + '.' + tabela + ': T' + tabela + ';');
      script.lines.add('begin');
      script.lines.add('  Result := FEntidade;');
      script.lines.add('end;');
      script.lines.add('');

      script.lines.add('function TController' + tabela + '.Clear: iController' + tabela + ';');
      script.lines.add('begin');
      script.lines.add('  if Assigned(FEntidade) then');
      script.lines.add('    Freeandnil(FEntidade);');
      script.lines.add('  FEntidade := T' + tabela + '.Create;');
      script.lines.add('end;');
      script.lines.add('');

      script.lines.add('constructor TController' + tabela + '.Create;');
      script.lines.add('begin');
      script.lines.add('  FModel := TModel.New.' + tabela + ';');
      script.lines.add('  FList := TObjectList<T' + tabela + '>.Create;');
      script.lines.add('  FEntidade := T' + tabela + '.Create;');
      script.lines.add('end;');
      script.lines.add('');

      script.lines.add('function TController' + tabela + '.DataSource(');
      script.lines.add('  aDataSource: TDataSource): iController' + tabela +';');
      script.lines.add('begin');
      script.lines.add('  Result := Self;');
      script.lines.add('  FDataSource := aDataSource;');
      script.lines.add('  FModel.DataSource(FDataSource);');
      script.lines.add('end;');
      script.lines.add('');

      script.lines.add('function TController' + tabela + '.DataSource: TDataSource;');
      script.lines.add('begin');
      script.lines.add('  Result := FDataSource;');
      script.lines.add('end;');
      script.lines.add('');

      script.lines.add('function TController' + tabela + '.Delete: iController' + tabela + ';');
      script.lines.add('begin');
      script.lines.add('  Result := Self;');
      script.lines.add('  try');
      script.lines.add('    FModel.DAO.Delete(FEntidade);');
      script.lines.add('  except');
      script.lines.add('    raise Exception.Create(''Erro ao excluir o registro'');');
      script.lines.add('  end;');
      script.lines.add('end;');
      script.lines.add('');

      script.lines.add('destructor TController' + tabela + '.Destroy;');
      script.lines.add('begin');
      script.lines.add('  if Assigned(FList) then');
      script.lines.add('    Freeandnil(FList);');
      script.lines.add('');
      script.lines.add('  if Assigned(FEntidade) then');
      script.lines.add('    Freeandnil(FEntidade);');
      script.lines.add('');
      script.lines.add('  inherited;');
      script.lines.add('end;');
      script.lines.add('');

      script.lines.add('function TController' + tabela + '.Insert: iController' + tabela + ';');
      script.lines.add('begin');
      script.lines.add('  Result := Self;');
      script.lines.add('  FModel.DAO.Insert(FEntidade);');
      script.lines.add('end;');
      script.lines.add('');

      script.lines.add('function TController' + tabela + '.List : TObjectList<T' + tabela + '>;');
      script.lines.add('begin');
      script.lines.add('  Result := FList;');
      script.lines.add('end;');
      script.lines.add('');

      script.lines.add('class function TController' + tabela + '.New: iController' + tabela +';');
      script.lines.add('begin');
      script.lines.add('  Result := Self.Create;');
      script.lines.add('end;');
      script.lines.add('');

      script.lines.add('function TController' + tabela + '.ExecSQL(sql : string): iController' + tabela + ';');
      script.lines.add('begin');
      script.lines.add('  FModel.DAO.ExecSQL(sql);');
      script.lines.add('  Result := Self;');
      script.lines.add('end;');
      script.lines.add('');

      script.lines.add('function TController' + tabela + '.Update: iController' + tabela + ';');
      script.lines.add('begin');
      script.lines.add('  Result := Self;');
      script.lines.add('  FModel.DAO.Update(FEntidade);');
      script.lines.add('end;');
      script.lines.add('');

      script.lines.add('function TController' + tabela + '.Ultimo(where : string) : iController' + tabela + ';');
      script.lines.add('begin');
      script.lines.add('  Result := Self;');
      script.lines.add('  if not Assigned(FEntidade) then');
      script.lines.add('    Freeandnil(FEntidade);');
      script.lines.add('  if where = '' then');
      script.lines.add('    where := '' xxx_CODIGO = (select max(xxx_CODIGO) from ' + tabela +')'';');
      script.lines.add('  FEntidade := FModel.DAO.Max(where);');
      script.lines.add('end;');
      script.lines.add('');

      script.lines.add('function TController' + tabela +'.FromJsonObject(aJson : TJsonObject) : iController' + tabela + ';');
      script.lines.add('begin');
      script.lines.add('  FEntidade := TJson.JsonToObject<T' + tabela + '>(aJson);');
      script.lines.add('end;');
      script.lines.add('');
      script.lines.add('end.');



          if not DirectoryExists(edtPath.Text) then
            CreateDir(edtPath.Text);
          if not DirectoryExists(edtPath.Text + '\src') then
            CreateDir(edtPath.Text + '\src');
          script.Lines.SaveToFile(edtPath.Text + '\src\' + edtApp.Text + '.Controller.' + tabela + '.pas');

      script.Lines.Clear;


      script.lines.add('Model Interfaces');
      script.lines.add('');
      script.lines.add('function ' + tabela + ' : iModel' + tabela + ';');
      script.lines.add('');
      script.lines.add('Model');
      script.lines.add('');
      script.lines.add('function ' + tabela + ' : iModel' + tabela + ';');
      script.lines.add('');
      script.lines.add('function TModel.' + tabela +' : iModel' + tabela + ';');
      script.lines.add('begin');
      script.lines.add('  Result := TModel' + tabela + '.New;');
      script.lines.add('end;');
      script.lines.add('');
      script.lines.add('');
      script.lines.add('');
      script.lines.add('Controller Interfaces');
      script.lines.add('');
      script.lines.add('function ' + tabela + ' : iController' + tabela + ';');
      script.lines.add('');
      script.lines.add('Controller');
      script.lines.add('');
      script.lines.add('function ' + tabela + ' : iController' + tabela + ';');
      script.lines.add('');
      script.lines.add('function TController.' + tabela + ' : iController' + tabela + ';');
      script.lines.add('begin');
      script.lines.add('  Result := TController' + tabela + '.New;');
      script.lines.add('end;');
      script.lines.add('');
      script.lines.add('');

    end;
  end;
end;

procedure TfrmPrincipal.btn1Click(Sender: TObject);
var
I, J : integer;
Campo, Tipo : string;
PK : boolean;
qryPK : TFDQuery;
begin
  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := FDConexao;

  qryLista_Tabelas.First;
  while not qryLista_Tabelas.Eof do
  begin
    Application.ProcessMessages;

    if qryLista_TabelasOK.AsString = 'Sim' then
      begin
        FQuery.Close;
        FQuery.Open('SELECT * FROM ' + qryLista_TabelasTABELA.asString);

        script.lines.Clear;

        script.Lines.Add('unit ' + edtApp.Text + '.' + edtEntidade.Text + '.' + RemoveAcento(qryLista_TabelasTABELA.asString) + ';');
        script.Lines.Add('');
        script.Lines.Add('interface');
        script.Lines.Add('');
        script.Lines.Add('uses');
        script.Lines.Add('  System.Generics.Collections, System.Classes, Rest.Json, System.JSON, SimpleAttributes;');
        script.Lines.Add('');
        script.Lines.Add('type');
        script.Lines.Add('  [Tabela(' + QuotedStr(RemoveAcento(qryLista_TabelasTABELA.asString)) + ')]');
        script.Lines.Add('  T' + RemoveAcento(qryLista_TabelasTABELA.asString) + ' = class');
        script.Lines.Add('  private');

        for I := 0 to FQuery.FieldCount -1 do
        begin
          if FQuery.Fields[i].ClassName = 'TIntegerField' then
            Tipo := 'integer;'
          else if FQuery.Fields[i].ClassName = 'TSmallintField' then
            Tipo := 'integer;'
          else if FQuery.Fields[i].ClassName = 'TLargeintField' then
            Tipo := 'integer;'
          else if FQuery.Fields[i].ClassName = 'TIBStringField' then
            Tipo := 'string;'
          else if FQuery.Fields[i].ClassName = 'TDateField' then
            Tipo := 'TDate;'
          else if FQuery.Fields[i].ClassName = 'TIBBCDField' then
            Tipo := 'real;'
          else if FQuery.Fields[i].ClassName = 'TFMTBCDField' then
            Tipo := 'real;'
          else if FQuery.Fields[i].ClassName = 'TCurrencyField' then
            Tipo := 'real;'
          else if FQuery.Fields[i].ClassName = 'TSingleField' then
            Tipo := 'real;'
          else if FQuery.Fields[i].ClassName = 'TStringField' then
            Tipo := 'string;'
          else
            Tipo := 'string;'+ '   {' + FQuery.Fields[i].ClassName + '}';

          script.Lines.Add('    F' + RemoveAcento(FQuery.Fields[i].FieldName) + ': ' + Tipo );
        end;

        script.Lines.Add('');
        script.Lines.Add('  public');
        script.Lines.Add('    constructor Create;');
        script.Lines.Add('    destructor Destroy; override;');
        script.Lines.Add('');
        script.Lines.Add('  published');
        script.Lines.Add('{verificar o se o campo й AutoInc}');
        script.Lines.Add('{Exemplo: [Campo('+QuotedStr('NOME_CAMPO')+'), PK, AutoInc] }');
        for I := 0 to FQuery.FieldCount -1 do
        begin
          //Verifica se й chave primaria
          qryPK := TFDQuery.Create(nil);
          qryPK.Connection := FDConexao;
          qryPK.Open('SELECT ' +
                     'A.attname ' +
                     'FROM ' +
                     'pg_index i ' +
                     'JOIN pg_attribute A ON A.attrelid = i.indrelid ' +
                     'AND A.attnum = ANY ( i.indkey ) ' +
                     'WHERE ' +
                     'i.indrelid = ' + QuotedStr(qryLista_TabelasTABELA.asString) + ' :: regclass ' +
                     'AND attname = '+ QuotedStr(FQuery.Fields[i].FieldName) + ' ' +
                     'AND i.indisprimary');

          if not qryPK.IsEmpty then pk := True else pk := False;
          qryPK.Free;

          if FQuery.Fields[i].ClassName = 'TIntegerField' then
            campo := 'integer'
          else if FQuery.Fields[i].ClassName = 'TSmallintField' then
            campo := 'integer'
          else if FQuery.Fields[i].ClassName = 'TLargeintField' then
            campo := 'integer'
          else if FQuery.Fields[i].ClassName = 'TIBStringField' then
            campo := 'string'
          else if FQuery.Fields[i].ClassName = 'TDateField' then
            campo := 'TDate'
          else if FQuery.Fields[i].ClassName = 'TIBBCDField' then
            campo := 'real'
          else if FQuery.Fields[i].ClassName = 'TFMTBCDField' then
            campo := 'real'
          else if FQuery.Fields[i].ClassName = 'TCurrencyField' then
            campo := 'real'
          else if FQuery.Fields[i].ClassName = 'TSingleField' then
            campo := 'real'
          else if FQuery.Fields[i].ClassName = 'TStringField' then
            campo := 'string'
          else
            campo := 'string';

          if PK = True then
            script.Lines.Add('    [Campo(' + quotedstr(RemoveAcento(FQuery.Fields[i].FieldName)) + '), PK]')
          else
            script.Lines.Add('    [Campo(' + quotedstr(RemoveAcento(FQuery.Fields[i].FieldName))+')]');

          script.Lines.Add('    property ' + RemoveAcento(FQuery.Fields[i].FieldName)
                                     +': ' + Tipo + ' read F' + RemoveAcento(FQuery.Fields[i].FieldName)
                                     +' write F' + RemoveAcento(FQuery.Fields[i].FieldName) + ';');
        end;

        script.Lines.Add('');
        script.Lines.Add('    function ToJSONObject: TJsonObject;');
        script.Lines.Add('    function ToJsonString: string;');
        script.Lines.Add('');
        script.Lines.Add('  end;');
        script.Lines.Add('');
        script.Lines.Add('implementation');
        script.Lines.Add('');
        script.Lines.Add('constructor T'+RemoveAcento(qryLista_TabelasTABELA.asString)+'.Create;');
        script.Lines.Add('begin');
        script.Lines.Add('');
        script.Lines.Add('end;');
        script.Lines.Add('');
        script.Lines.Add('destructor T'+RemoveAcento(qryLista_TabelasTABELA.asString)+'.Destroy;');
        script.Lines.Add('begin');
        script.Lines.Add('');
        script.Lines.Add('  inherited;');
        script.Lines.Add('end;');
        script.Lines.Add('');
        script.Lines.Add('function T'+RemoveAcento(qryLista_TabelasTABELA.asString)+'.ToJSONObject: TJsonObject;');
        script.Lines.Add('begin');
        script.Lines.Add('  Result := TJson.ObjectToJsonObject(Self);');
        script.Lines.Add('end;');
        script.Lines.Add('');
        script.Lines.Add('function T'+RemoveAcento(qryLista_TabelasTABELA.asString)+'.ToJsonString: string;');
        script.Lines.Add('begin');
        script.Lines.Add('  result := TJson.ObjectToJsonString(self);');
        script.Lines.Add('end;');
        script.Lines.Add('');
        script.Lines.Add('end.');

        if not DirectoryExists(edtPath.Text) then
          CreateDir(edtPath.Text);
        if not DirectoryExists(edtPath.Text + '\src') then
          CreateDir(edtPath.Text + '\src');
        if not DirectoryExists(edtPath.Text + '\src\Entidades') then
          CreateDir(edtPath.Text + '\src\Entidades');

        script.Lines.SaveToFile(edtPath.Text + '\src\Entidades\' + edtApp.Text + '.' + edtEntidade.Text + '.' + RemoveAcento(qryLista_TabelasTABELA.asString) + '.pas');

      end;
    qryLista_Tabelas.Next;
  end;

  ShowMessage('Classes criadas com sucesso');
end;

procedure TfrmPrincipal.GerarController(aTableName: string);
var
 path : string;
begin
  Path := edtPath.Text;
  if not DirectoryExists(Path) then
    ForceDirectories(Path);

  Path := edtPath.Text + '/src';
  if not DirectoryExists(Path) then
    ForceDirectories(Path);


  Path := Path + '/Controller';
  if not DirectoryExists(Path) then
    ForceDirectories(Path);

  GerarClassController(Path, aTableName);
end;

procedure TfrmPrincipal.GerarClassController(aPath, aTableName : string);
var
  ArqController : TStringList;
begin
  ArqController := TStringList.Create;
  try
    ArqController.Add('unit ServerReact.Controller.' + aTableName + ';');
    ArqController.Add('');
    ArqController.Add('interface');
    ArqController.Add('');
    ArqController.Add('uses');
    ArqController.Add('Horse,');
    ArqController.Add('System.JSON,');
    ArqController.Add('ServerReact.Model.DAOGeneric,');
    ArqController.Add('ServerReact.Model.Entidades.' + aTableName + ';');
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
    ArqController.Add('App.Get(''/' + LowerCase(aTableName) + ''', Get);');
    ArqController.Add('App.Get(''/' + LowerCase(aTableName) + '/:id'', GetId);');
    ArqController.Add('App.Post(''/' + LowerCase(aTableName)  + ''', Insert);');
    ArqController.Add('App.Put(''/' + LowerCase(aTableName)  + '/:id'', Update);');
    ArqController.Add('App.Delete(''/' + LowerCase(aTableName)  + '/:id'', Delete);');
    ArqController.Add('end;');
    ArqController.Add('');
    ArqController.Add('procedure Get(Req: THorseRequest; Res: THorseResponse; Next: TProc);');
    ArqController.Add('var');
    ArqController.Add('FDAO : iDAOGeneric<T' + UpperCase(aTableName) + '>;');
    ArqController.Add('begin');
    ArqController.Add('FDAO := TDAOGeneric<T' + UpperCase(aTableName) + '>.New;');
    ArqController.Add('Res.Send<TJsonArray>(FDAO.Find);');
    ArqController.Add('end;');
    ArqController.Add('');
    ArqController.Add('procedure GetID(Req: THorseRequest; Res: THorseResponse; Next: TProc);');
    ArqController.Add('var');
    ArqController.Add('FDAO : iDAOGeneric<T' + UpperCase(aTableName) + '>;');
    ArqController.Add('begin');
    ArqController.Add('FDAO := TDAOGeneric<T' + UpperCase(aTableName) + '>.New;');
    ArqController.Add('Res.Send<TJsonObject>(FDAO.Find(Req.Params.Items[''id'']));');
    ArqController.Add('end;');
    ArqController.Add('');
    ArqController.Add('procedure Insert(Req: THorseRequest; Res: THorseResponse; Next: TProc);');
    ArqController.Add('var');
    ArqController.Add('FDAO : iDAOGeneric<' + UpperCase(aTableName) + '>;');
    ArqController.Add('begin');
    ArqController.Add('FDAO := TDAOGeneric<T' + UpperCase(aTableName) + '>.New;');
    ArqController.Add('Res.Send<TJsonObject>(FDAO.Insert(Req.Body<TJsonObject>));');
    ArqController.Add('end;');
    ArqController.Add('');
    ArqController.Add('procedure Update(Req: THorseRequest; Res: THorseResponse; Next: TProc);');
    ArqController.Add('var');
    ArqController.Add('FDAO : iDAOGeneric<T' + UpperCase(aTableName) + '>;');
    ArqController.Add('begin');
    ArqController.Add('FDAO := TDAOGeneric<T' + UpperCase(aTableName) + '>.New;');
    ArqController.Add('Res.Send<TJsonObject>(FDAO.Update(Req.Body<TJsonObject>));');
    ArqController.Add('end;');
    ArqController.Add('');
    ArqController.Add('procedure Delete(Req: THorseRequest; Res: THorseResponse; Next: TProc);');
    ArqController.Add('var');
    ArqController.Add('FDAO : iDAOGeneric<T' + UpperCase(aTableName) + '>;');
    ArqController.Add('begin');
    ArqController.Add('FDAO := TDAOGeneric<T' + UpperCase(aTableName) + '>.New;');
    ArqController.Add('Res.Send<TJsonObject>(FDAO.Delete(''id'', Req.Params.Items[''id'']));');
    ArqController.Add('end;');
    ArqController.Add('');
    ArqController.Add('end.');
  finally
    ArqController.SaveToFile(aPath + '/' + edtApp.Text + '.Controller.' + UpperCase(aTableName) + '.pas');
    ArqController.Free;
  end;
end;

end.
