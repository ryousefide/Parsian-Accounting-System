unit ExpDbg;

interface
Uses Dialogs,Db,DbGrids,DbTables;

Procedure GridExport (Dbg:TDbGrid);
Procedure GHeader_Write(Dbg:TDbGrid);
Procedure GDataToCSV(Dbg:TDbGrid);
implementation
Var
st:String;
f:TextFile;

Procedure GridExport (Dbg:TDbGrid);
Var
 Sd:TSaveDialog;
begin
   sd:= TSaveDialog.Create(Dbg.Owner);
   sd.InitialDir:='My Documents';
   sd.Filter:='Exel File (*.csv)|*.CSV';
   If sd.Execute Then
   Begin
    //AssignFile(f,Sd.FileName);
    //ReWrite(f);
    Case Sd.FilterIndex Of
    0 : ShowMessage('First Choose');
    1 : Begin
         AssignFile(f,Sd.FileName+'.csv');
         ReWrite(f);
         GHeader_Write(Dbg);// ShowMessage('Secend Choose');
         GDataToCSV(Dbg);
        End;
    End;
   End;
end;

Procedure GHeader_Write(Dbg:TDbGrid);
Var
I:Integer;
begin
     st:='';
     For I:=0 To dbg.Columns.Count-1 Do
      St:=St+dbg.Columns[i].Title.Caption+';';
     WriteLn(f,St);
end;

Procedure GDataToCSV(Dbg:TDbGrid);
Var
I,J:Integer;
Dset:TDataSet;
begin
     st:='';
     DSet:=TDataSet.Create(Dbg.Parent.Owner);
     DSet:=Dbg.DataSource.DataSet;
     DSet.First;
     For I:=1 To DSet.RecordCount Do
     Begin
      For J:=0 To Dbg.Columns.Count-1 Do
       St:=St+Dbg.Columns[J].Field.AsString+';';
      WriteLn(f,St);
      St:='';
      DSet.Next;
     End;
     CloseFile(f);
end;

end.
