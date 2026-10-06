
unit Print;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ppEndUsr, ppBands, ppPrnabl, ppClass, ppCtrls, ppCache,
  ppComm, ppRelatv, ppProd, ppReport, StdCtrls, Mask, ppModule, daDatMod,
  ppDB, ppDBPipe, ppDBBDE, ExtCtrls, ppParameter;

type
  TFPrint = class(TForm)
    InvQ: TQuery;
    Label1: TLabel;
    Label3: TLabel;
    SDat: TMaskEdit;
    EDat: TMaskEdit;
    Ds: TDataSource;
    ppInvRep: TppReport;
    ppDesigner1: TppDesigner;
    Label2: TLabel;
    Label4: TLabel;
    SNo: TEdit;
    ENo: TEdit;
    ppBDEPipeline1: TppBDEPipeline;
    Button1: TButton;
    Button2: TButton;
    InvQBDEDesigner: TIntegerField;
    InvQBDEDesigner2: TIntegerField;
    InvQBDEDesigner3: TCurrencyField;
    InvQBDEDesigner4: TCurrencyField;
    InvQBDEDesigner5: TCurrencyField;
    InvQBDEDesigner6: TIntegerField;
    InvQBDEDesigner7: TStringField;
    InvQBDEDesigner8: TStringField;
    InvQBDEDesigner9: TFloatField;
    InvQBDEDesigner10: TStringField;
    InvQBDEDesigner11: TCurrencyField;
    InvQBDEDesigner12: TFloatField;
    InvQBDEDesigner13: TCurrencyField;
    InvQBDEDesigner14: TStringField;
    InvQBDEDesigner15: TStringField;
    InvQBDEDesigner16: TStringField;
    Bevel1: TBevel;
    Button3: TButton;
    ppParameterList1: TppParameterList;
    ppHeaderBand1: TppHeaderBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText7: TppDBText;
    ppDBText9: TppDBText;
    ppDBText11: TppDBText;
    ppDetailBand1: TppDetailBand;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText8: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppDBText10: TppDBText;
    Procedure NextTab(Sender:TObject;Var Key :Char);    
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure SDatEnter(Sender: TObject);
    procedure SDatExit(Sender: TObject);
    procedure EDatEnter(Sender: TObject);
    procedure EDatExit(Sender: TObject);
    procedure SNoKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    Function Make_Filter:String;
  public
    { Public declarations }
  end;

var
  FPrint: TFPrint;

implementation

uses ProVar, ForooshDM, Routins;

{$R *.DFM}
function TFPrint.Make_Filter: String;
Var
Str:String;
I:Integer;
begin
     Str:='Where (A.Nam = I.Nam)and (I."No" = G."No") ';
     I:=DateToInt(SDat.Text);
     If I>0 Then Str:=Str+' and Dat >= '+IntToStr(I);
     I:=DateToInt(EDat.Text);
     If I>0 Then Str:=Str+' and Dat <= '+IntToStr(I);
     If SNo.Text > ''  Then Str:=Str+' and I."No" >= '+SNo.Text;
     If ENo.Text > ''  Then Str:=Str+' and I."No" <= '+ENo.Text;
     If Pos(' and',Str) = 1 Then Delete(Str,1,4);
     Result:=Str;
end;

procedure TFPrint.NextTab(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       Key:=#0;
       SelectNext(Sender As TWinControl,True,True);
     End;
end;

procedure TFPrint.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFPrint.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     InvQ.DatabaseName:=CurrPath;
     ppInvRep.Template.FileName:=Rdir+'\Reports\Invoice.rtm';
     ppInvRep.Template.LoadFromFile;
end;


procedure TFPrint.SDatEnter(Sender: TObject);
begin
     GetMaskText(SDat);
end;

procedure TFPrint.SDatExit(Sender: TObject);
begin
     SetMaskText(SDat);
     If(Not Date_Check(SDat.Text))and(DateToInt(SDat.Text) > 0) Then SDat.SetFocus;
end;

procedure TFPrint.EDatEnter(Sender: TObject);
begin
     GetMaskText(EDat);
end;

procedure TFPrint.EDatExit(Sender: TObject);
begin
     SetMaskText(EDat);
     If(Not Date_Check(EDat.Text))And(DateToInt(EDat.Text)>0) Then EDat.SetFocus;
end;

procedure TFPrint.SNoKeyPress(Sender: TObject; var Key: Char);
begin
     NextTab(Sender,key);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
end;


procedure TFPrint.Button1Click(Sender: TObject);
begin
     InvQ.Close;
     InvQ.SQL.Strings[4]:=Make_Filter;
     ppInvRep.PrintReport;
end;

procedure TFPrint.Button2Click(Sender: TObject);
begin
     ppDesigner1.Show;
end;

procedure TFPrint.Button3Click(Sender: TObject);
begin
     Close;
end;

end.
