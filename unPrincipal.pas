unit unPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, IniFiles,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.PG, FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait,  FireDAC.Comp.Client, FireDAC.DApt, Vcl.Menus, Vcl.StdCtrls, Vcl.ExtCtrls, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.Comp.DataSet, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TfrmPrincipal = class(TForm)
    FDConexao: TFDConnection;
    Panel1: TPanel;
    dsLista_Tabelas: TDataSource;
    qryLista_Tabelas: TFDQuery;
    Panel2: TPanel;
    dsCFG_Geral: TDataSource;
    qryLista_TabelasTABELA: TWideStringField;
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
    PopupMenu1: TPopupMenu;
    SelecionarTodos1: TMenuItem;
    DesmarcarTodos1: TMenuItem;
    DBGrid1: TDBGrid;
    qryLista_TabelasOK: TWideMemoField;
    MemVideo: TMemo;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    edtDriverID: TEdit;
    edtDatabase: TEdit;
    edtUserName: TEdit;
    edtPassword: TEdit;
    edtPort: TEdit;
    edtServer: TEdit;
    edtSchemaName: TEdit;
    btnConectar: TButton;
    GroupBox2: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    btn2: TButton;
    edtPath: TEdit;
    edtApp: TEdit;
    cheSeparaPasta: TCheckBox;
    cheEntidade: TCheckBox;
    cheAutoInc: TCheckBox;
    cheController: TCheckBox;
    cheReactList: TCheckBox;
    cheReactForm: TCheckBox;
    cheVideo: TCheckBox;
    btn1: TButton;
    procedure btnConectarClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure SelecionarTodos1Click(Sender: TObject);
    procedure DesmarcarTodos1Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1ColEnter(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure qryLista_TabelasOKGetText(Sender: TField; var Text: string; DisplayText: Boolean);
  private
    procedure Conecta_Bancos;
    procedure Gera_Entidade(aTable: string);

    procedure Gera_Interface(aTable: string);
    procedure Gera_Model(aTable: string);

    procedure Verifica_AutoInc(autoIncField : string);
    procedure Gera_Controller(aTableName: string);

    procedure GerarJS(aTableName : String; Fields : TStringList);
    procedure Gerar_Lista_React;
    procedure GeraFormReact(aTableName: String; Fields: TStringList);
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

  vEntidade : TMemo;
  vController : TMemo;
  vReactList : TMemo;
  vReactForm : TMemo;

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
  FClasse.Add('unit ' + edtApp.Text + '.Model.Entidades.' + UpperCase(aTable) + ';');
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

  MemVideo.Text := FClasse.Text;

  FDMIQ.Active := False;
end;


procedure TfrmPrincipal.Gera_Interface(aTable: string);
begin

end;

procedure TfrmPrincipal.Gera_Model(aTable: string);
begin

end;

procedure TfrmPrincipal.qryLista_TabelasOKGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
 Text := EmptyStr;
end;

procedure TfrmPrincipal.SelecionarTodos1Click(Sender: TObject);
begin
  qryLista_Tabelas.First;
  while not qryLista_Tabelas.Eof do
    begin
      qryLista_tabelas.Edit;
      qryLista_TabelasOK.asString := '1';
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

procedure TfrmPrincipal.Gerar_Lista_React;
var
  Tabelas, Fields: TStringList;
  I: Integer;
begin
  FDConexao.Connected := True;
  Tabelas := TStringList.Create;
  try
    FDConexao.GetTableNames('', '', '', Tabelas, [osMy]);
    for I := 0 to Pred(Tabelas.Count) -1 do
    begin
      Fields := TStringList.Create;
      try
        FDConexao.GetFieldNames('', '', Tabelas[i], '', Fields);
        GerarJS(Tabelas[I], Fields);

        if cheSeparaPasta.Checked then
        begin
          if cheVideo.Checked = false then
          begin
            //ReactList
            if not DirectoryExists(edtPath.Text) then
              CreateDir(edtPath.Text);
            if not DirectoryExists(edtPath.Text + '\src') then
              CreateDir(edtPath.Text + '\src');
            if not DirectoryExists(edtPath.Text + '\src\' + qryLista_TabelasTABELA.asString) then
              CreateDir(edtPath.Text + '\src\' + qryLista_TabelasTABELA.asString);
            vReactList.Lines.SaveToFile(edtPath.Text + '\src\' + qryLista_TabelasTABELA.asString + '\list.js');
          end;
        end
        else
        //Todos na mesma pasta
        begin
          if cheVideo.Checked = false then
          begin
            //ReactList
            if not DirectoryExists(edtPath.Text) then
              CreateDir(edtPath.Text);
            if not DirectoryExists(edtPath.Text + '\src') then
              CreateDir(edtPath.Text + '\src');
            vReactList.Lines.SaveToFile(edtPath.Text + '\src\' + qryLista_TabelasTABELA.asString + '_list.js');
          end;
        end;
      finally
        Fields.Free;
      end;
    end;
  finally
    FDConexao.Connected := False;
    Tabelas.Free;
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

procedure TfrmPrincipal.DBGrid1CellClick(Column: TColumn);
begin
  if(UpperCase(Column.FieldName) = 'OK') then
  begin
    qryLista_Tabelas.Edit;
    if(qryLista_Tabelas.FieldByName('OK').AsInteger = 1) then
    begin
      qryLista_Tabelas.FieldByName('OK').AsInteger := 0;
    end
    else
    begin
      qryLista_Tabelas.FieldByName('OK').AsInteger := 1;
    end;
   qryLista_Tabelas.Post;
  end;
end;

procedure TfrmPrincipal.DBGrid1ColEnter(Sender: TObject);
begin
  if UpperCase(TDBGrid(Sender).SelectedField.FieldName) = 'OK' then
    TDBGrid(Sender).Options := TDBGrid(Sender).Options - [dgEditing]
  else
    TDBGrid(Sender).Options := TDBGrid(Sender).Options + [dgEditing];
end;

procedure TfrmPrincipal.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
 var
  Check: Integer;
  R: TRect;
begin
  if ((Sender as TDBGrid).DataSource.Dataset.IsEmpty) then
    Exit;

  if(UpperCase(Column.FieldName) = 'OK') then
  begin
    TDBGrid(Sender).Canvas.FillRect(Rect);
    if (TDBGrid(Sender).DataSource.DataSet.FieldByName('OK').AsInteger = 1) then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, -2, -2);
    DrawFrameControl(TDBGrid(Sender).Canvas.Handle, R, DFC_BUTTON,
      DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmPrincipal.DesmarcarTodos1Click(Sender: TObject);
begin
  qryLista_Tabelas.First;
  while not qryLista_Tabelas.Eof do
    begin
      qryLista_tabelas.Edit;
      qryLista_TabelasOK.asString := '0';
      qryLista_tabelas.Post;

      qryLista_tabelas.Next;
    end;
end;

procedure TfrmPrincipal.btn2Click(Sender: TObject);
var
  Tabelas, Fields: TStringList;
begin
  qryLista_Tabelas.First;
  while not qryLista_Tabelas.Eof do
    begin
      if qryLista_TabelasOK.asString = '1' then
        begin
          //Gera Entidade
          if cheEntidade.Checked then Gera_Entidade(qryLista_TabelasTABELA.AsString);
          if cheController.Checked then Gera_Controller(qryLista_TabelasTABELA.AsString);
          if cheReactList.Checked then
          begin
            Fields := TStringList.Create;
            try
              FDConexao.GetFieldNames('', '', qryLista_TabelasTABELA.asString, '', Fields);
              GerarJS(qryLista_TabelasTABELA.asString, Fields);
            finally
              Fields.Free;
            end;
          end;
          if cheReactForm.Checked then
          begin
            Fields := TStringList.Create;
            try
              FDConexao.GetFieldNames('', '', qryLista_TabelasTABELA.asString, '', Fields);
              GeraFormReact(qryLista_TabelasTABELA.asString, Fields);
            finally
              Fields.Free;
            end;
          end;
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
            end;
          end;
        end;
      qryLista_Tabelas.Next;
    end;

  ShowMessage('Arquivos gerados com sucesso');
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  vEntidade := TMemo.Create(Self);
  vController := TMemo.Create(Self);
  vReactList := TMemo.Create(Self);
  VReactForm := TMemo.Create(Self);
end;

procedure TfrmPrincipal.GerarJS(aTableName: String; Fields: TStringList);
var
  i: integer;
 vTable, vField : string;
 FReact : TStringList;
begin
   FReact := TStringList.Create;
   try
      vTable := LowerCase(aTableName);
      FReact.Add('import React, { Component } from ''react'';');
      FReact.Add('import api from ''../../services/api'';');
      FReact.Add('import { Link } from ''react-router-dom'';');
      FReact.Add('');
      FReact.Add('const $ = require(''jquery'');');
      FReact.Add('$.dataTable = require(''datatables.net'');');
      FReact.Add('');
      FReact.Add('export default class ' + vTable + 'Table extends Component {');
      FReact.Add('state = {');
      FReact.Add('_' + vTable + ': [],');
      FReact.Add('}');
      FReact.Add('');
      FReact.Add('async componentDidMount() {');
      FReact.Add('await this.get' + vTable + '();');
      FReact.Add('this.$el = $(this.el);');
      FReact.Add('this.$el.DataTable({})');
      FReact.Add('}');
      FReact.Add('');
      FReact.Add('');
      FReact.Add('async get' + vTable + '() {');
      FReact.Add('const response = await api.get(''/' + vTable + ''');');
      FReact.Add('this.setState({ _' + vTable + ': response.data });');
      FReact.Add('}');
      FReact.Add('');
      FReact.Add('onDelete(id) {');
      FReact.Add('api.delete(`/' + vTable + '/${id}`)');
      FReact.Add('.then(res => {');
      FReact.Add('this.get' + vTable + '();');
      FReact.Add('})');
      FReact.Add('}');
      FReact.Add('');
      FReact.Add('render() {');
      FReact.Add('return (');
      FReact.Add('<div className="' + vTable + 'TableClass">');
      FReact.Add('<h3>Lista de ' + vTable + ' ({this.state._' + vTable + '.length})</h3>');
      FReact.Add('<br />');
      FReact.Add('<div className="row">');
      FReact.Add('<div className="col-sm-12">');
      FReact.Add('<Link to={`/' + vTable + '/new`} className="btn btn-success">Novo</Link>');
      FReact.Add('</div>');
      FReact.Add('</div>');
      FReact.Add('<br />');
      FReact.Add('<table className="display " width="100%" ref={el => this.el = el}>');
      FReact.Add('{/* <table className="table table-hover table-dark"> */}');
      FReact.Add('<thead>');
      FReact.Add('<tr>');

      for I := 0 to Pred(Fields.Count) do
      begin
        FReact.Add('<th scope="col">' + Fields[i] + '</th>');
      end;

      FReact.Add('<th scope="col">Ações</th>');
      FReact.Add('</tr>');
      FReact.Add('</thead>');
      FReact.Add('<tbody>');
      FReact.Add('{this.state._' + vTable + '.map(' + vTable + ' => (');
      FReact.Add('<tr key={' + vTable + '.usu_codigo}>');

      for I := 0 to Pred(Fields.Count) do
      begin
        FReact.Add('<td scope="row">{' + vTable + '.' + Fields[I] + '}</td>');
      end;

      FReact.Add('<td >');
      FReact.Add('<Link to={`/' + vTable + '/${' + vTable + '.usu_codigo}`}><i className="far fa-edit"></i></Link> <wbr></wbr>');
      FReact.Add('<Link to={`/' + vTable + '/`} onClick={() => this.onDelete(' + vTable + '.usu_codigo)} ><i className="far fa-trash-alt"></i></Link>');
      FReact.Add('</td>');
      FReact.Add('</tr>');
      FReact.Add('))}');
      FReact.Add('</tbody>');
      FReact.Add('</table>');
      FReact.Add('</div>');
      FReact.Add(')');
      FReact.Add('}');
      FReact.Add('}');

      vReactList.Text := FReact.Text;

      MemVideo.Text := FReact.Text;

      if cheVideo.checked = false then
      if cheSeparaPasta.Checked then
      begin
          if cheReactList.Checked then
          begin
            if not DirectoryExists(edtPath.Text) then
              CreateDir(edtPath.Text);
            if not DirectoryExists(edtPath.Text + '\src') then
              CreateDir(edtPath.Text + '\src');
            if not DirectoryExists(edtPath.Text + '\src\' + qryLista_TabelasTABELA.asString) then
              CreateDir(edtPath.Text + '\src\' + qryLista_TabelasTABELA.asString);
            vReactList.Lines.SaveToFile(edtPath.Text + '\src\' + qryLista_TabelasTABELA.asString + '\list.js');
          end;
      end
      else
      begin
          if cheReactList.Checked then
          begin
            if not DirectoryExists(edtPath.Text) then
              CreateDir(edtPath.Text);
            if not DirectoryExists(edtPath.Text + '\src') then
              CreateDir(edtPath.Text + '\src');
            vReactList.Lines.SaveToFile(edtPath.Text + '\src\' + qryLista_TabelasTABELA.asString + '_list.js');
          end;
      end;
   finally
      FReact.Free;
      FDMIQ.Active := False;
   end;
end;

procedure TfrmPrincipal.GeraFormReact(aTableName: String; Fields: TStringList);
var
  i: integer;
 vTable, vField : string;
 FReact : TStringList;
begin
   FReact := TStringList.Create;
   try
      vTable := LowerCase(aTableName);
      FReact.Add('import React, { Component } from ''react'';');
      FReact.Add('import api from ''../../services/api'';');
      FReact.Add('import { Link, withRouter } from ''react-router-dom'';');
      FReact.Add('');
      FReact.Add('class ' + vTable + 'Form extends Component {');
      FReact.Add('Tipo = '''';');
      FReact.Add('');
      FReact.Add('state = {');
      FReact.Add('data: {');

      for I := 0 to Pred(Fields.Count) do
      begin
        FReact.Add('' + Fields[I] + ': '''',');
      end;

      FReact.Add('},');
      FReact.Add('flags: {');
      FReact.Add('new: null');
      FReact.Add('}');
      FReact.Add('}');
      FReact.Add('');
      FReact.Add('dataChange(ev) {');
      FReact.Add('let name = [ev.target.name];');
      FReact.Add('let value = ev.target.value;');
      FReact.Add('this.setState(prevState => ({');
      FReact.Add('data: { ...prevState.data, [name]: value }');
      FReact.Add('}))');
      FReact.Add('}');
      FReact.Add('');
      FReact.Add('async componentDidMount() {');
      FReact.Add('const { id } = this.props.match.params;');
      FReact.Add('if (typeof id !== "undefined") {');
      FReact.Add('this.Tipo = ''Alteração'';');
      FReact.Add('await api.get(`/' + vTable + '/${id}`)');
      FReact.Add('.then(res => {');
      FReact.Add('this.setState({ data: res.data })');
      FReact.Add('this.setState({ flags: { new: false } })');
      FReact.Add('})');
      FReact.Add('} else {');
      FReact.Add('this.setState({ flags: { new: true } })');
      FReact.Add('this.Tipo = ''Cadastro'';');
      FReact.Add('}');
      FReact.Add('}');
      FReact.Add('');
      FReact.Add('handleSubmit = event => {');
      FReact.Add('event.preventDefault();');
      FReact.Add('if (this.state.flags.new) {');
      FReact.Add('api.post(`/' + vTable + '`, this.state.data)');
      FReact.Add('.then(res => {');
      FReact.Add('this.props.history.push(''/' + vTable + ''')');
      FReact.Add('})');
      FReact.Add('} else {');
      FReact.Add('api.put(`/' + vTable + '/${this.state.data.CAMPO_CODIGO}`, this.state.data)');
      FReact.Add('.then(res => {');
      FReact.Add('this.props.history.push(''/' + vTable + ''')');
      FReact.Add('})');
      FReact.Add('}');
      FReact.Add('}');
      FReact.Add('');
      FReact.Add('');
      FReact.Add('');
      FReact.Add('render() {');
      FReact.Add('return (');
      FReact.Add('<div className="col-sm-12">');
      FReact.Add('<h3>{this.Tipo} de ' + vTable + '</h3>');
      FReact.Add('<form onSubmit={this.handleSubmit}>');

      for I := 0 to Pred(Fields.Count) do
      begin
        FReact.Add('<div className="form-group">');
        FReact.Add('<label>' + Fields[I] + '</label>');
        FReact.Add('<input type="text" name="' + Fields[I] + '" value={this.state.data.' + Fields[I] + '} onChange={this.dataChange.bind(this)} className="form-control" />');
        FReact.Add('</div>');
      end;

      FReact.Add('<button type="submit" className="btn btn-primary">Submit</button>');
      FReact.Add('<Link className="btn btn-danger" to={`/' + vTable + '`} >Back</Link>');
      FReact.Add('</form>');
      FReact.Add('</div>');
      FReact.Add(')');
      FReact.Add('}');
      FReact.Add('}');
      FReact.Add('');
      FReact.Add('export default withRouter(' + vTable + 'Form)');


      vReactList.Text := FReact.Text;

      MemVideo.Text := FReact.Text;

      if cheVideo.checked = false then
      if cheSeparaPasta.Checked then
      begin
          if cheReactForm.Checked then
          begin
            if not DirectoryExists(edtPath.Text) then
              CreateDir(edtPath.Text);
            if not DirectoryExists(edtPath.Text + '\src') then
              CreateDir(edtPath.Text + '\src');
            if not DirectoryExists(edtPath.Text + '\src\' + qryLista_TabelasTABELA.asString) then
              CreateDir(edtPath.Text + '\src\' + qryLista_TabelasTABELA.asString);
            vReactList.Lines.SaveToFile(edtPath.Text + '\src\' + qryLista_TabelasTABELA.asString + '\form.js');
          end;
      end
      else
      begin
          if cheReactForm.Checked then
          begin
            if not DirectoryExists(edtPath.Text) then
              CreateDir(edtPath.Text);
            if not DirectoryExists(edtPath.Text + '\src') then
              CreateDir(edtPath.Text + '\src');
            vReactList.Lines.SaveToFile(edtPath.Text + '\src\' + qryLista_TabelasTABELA.asString + '_form.js');
          end;
      end;
   finally
      FReact.Free;
      FDMIQ.Active := False;
   end;
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
    if MemVideo.Text <> '' then MemVideo.Lines.Add('');
    MemVideo.Text := MemVideo.Text + ArqController.Text;
    VController.Text := ArqController.Text;
    ArqController.Free;
  end;
end;

procedure TfrmPrincipal.btn1Click(Sender: TObject);
var
  Tabelas, Fields: TStringList;
begin
  //Gera Entidade
  if cheEntidade.Checked then Gera_Entidade(qryLista_TabelasTABELA.AsString);
  if cheController.Checked then Gera_Controller(qryLista_TabelasTABELA.AsString);
  if cheReactList.Checked then
  begin
    Fields := TStringList.Create;
    try
      FDConexao.GetFieldNames('', '', qryLista_TabelasTABELA.asString, '', Fields);
      GerarJS(qryLista_TabelasTABELA.asString, Fields);
    finally
      Fields.Free;
    end;
  end;
  if cheReactForm.Checked then
  begin
    Fields := TStringList.Create;
    try
      FDConexao.GetFieldNames('', '', qryLista_TabelasTABELA.asString, '', Fields);
      GeraFormReact(qryLista_TabelasTABELA.asString, Fields);
    finally
      Fields.Free;
    end;
  end;
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
        VController.Lines.SaveToFile(edtPath.Text + '\src\' + edtApp.Text + '.Controller.' + UpperCase(qryLista_TabelasTABELA.asString) + '.pas');
      end;
    end;
  end;

  ShowMessage('Arquivos gerados com sucesso');
end;

end.
