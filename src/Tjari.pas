unit Tjari;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DBCtrls, Db, DBTables;

type
  TFTjari = class(TForm)
    Fjarinam: TEdit;
    Label1: TLabel;
    Bexit1: TButton;
    Bmake: TButton;
    Label2: TLabel;
    Label3: TLabel;
    FDjari: TEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label5: TLabel;
    FBkod: TComboBox;
    FBank: TComboBox;
    QTJ: TQuery;
    procedure Bexit1Click(Sender: TObject);
    procedure BmakeClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTjari: TFTjari;

implementation

{$R *.DFM}
Uses Mplayer, FrooshDM, Routins, ProVar;

procedure TFTjari.Bexit1Click(Sender: TObject);
begin
     Close;
end;

procedure TFTjari.BmakeClick(Sender: TObject);
Const
CheqConst='çﬂ';
BankConst='Ã«—Ì';
var
Table:TTable;
begin
     If FBank.ItemIndex = -1 Then
     Begin
       Beep;
       ShowMessage('»«‰ﬂ ’ÕÌÕ «‰ Œ«» ‰‘œÂ «” ');
       Exit;
     End;
     Screen.Cursor:=crHourGlass;
    { TODO :  ’ÕÌÕ —Ê‘ ”«Œ  ÃœÊ· Ã«—Ì }
     Table:=TTable.Create(self);
     Table.DatabaseName:=CurrDb;
     Table.TableName :='Jari'+FJarinam.Text;
     If Table.Exists Then
     Begin
       Application.MessageBox('«Ì‰ Ã«—Ì ﬁ»·«  ⁄—Ì› ‘œÂ «” ','Â‘œ«—',mb_Ok);
       Exit;
     End;
     Try
      QTJ.SQL.Strings[0]:='CREATE TABLE [dbo].[Jari'+FJarinam.Text+'] (';
      QTJ.SQL.Strings[10]:='ALTER TABLE [dbo].[Jari'+FJarinam.Text+']  WITH NOCHECK ADD';
      QTJ.SQL.Strings[11]:='CONSTRAINT [PK_Jari'+FJarinam.Text+'] PRIMARY KEY  NONCLUSTERED ';
      QTJ.ExecSQL;
     Except
      Beep;
      Application.MessageBox('Ã«—Ì  ‘ﬂÌ· ‰‘œ','Â‘œ«—',mb_Ok);
      Screen.Cursor :=crDefault;
      Table.Free;
      Exit;
     End;

     Screen.Cursor :=crDefault;
     If Not OpenTable(Frodm.JariNam) Then
     Begin
       MessageDlg('Ã«—Ì  ‘ﬂÌ· ‰‘œ',mtError,[mbOk],0);
       Table.DeleteTable;
       Bexit1Click(Sender);
     End;
     Frodm.JariNam.Append;
     Frodm.JariNamNam.Value :=FJariNam.Text;
     Frodm.JariNamBNam.Value :=FBank.Text;
     Frodm.JariNamDjari.Value :=FDJari.Text;
     Frodm.JariNamBkod.Value :=FBKod.Text;
     Frodm.JariNamAccKod.AsFloat :=New_Account_Root(BankConst+FJariNam.Text,FBank.Text,0,1);
     Frodm.JariNamCheqKod.AsFloat :=New_Account_Root(CheqConst+FJariNam.Text,
       CheqConst+' '+FBank.Text,0,1);
     Frodm.JariNam.Post;
     QuickCloseOpen([10]);
     Application.MessageBox('Ã«—Ì  ‘ﬂÌ· ‘œ','Â‘œ«—',mb_Ok);
     Table.Free;
end;

procedure TFTjari.FormClose(Sender: TObject; var Action: TCloseAction);
begin
        Action:=caFree;
end;

procedure TFTjari.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     QTJ.DatabaseName:=CurrDb;
     FBKod.Items.Assign(CurrList);
     Fill_Comb(Frodm.Banks,'BNam',FBank.Items);
end;

procedure TFTjari.FormKeyPress(Sender: TObject; var Key: Char);
begin
     If Key In['/','.','\'] Then Key:=#0;
     If Key = #13 Then
     Begin
       Key:=#0;
       SelectNext(Sender As TWinControl,True,True);
     End;
end;

end.
