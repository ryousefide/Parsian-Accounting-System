unit ReportCenter;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, XPListBox, ComCtrls;

type
  TFRepCent = class(TForm)
    PageControl1: TPageControl;
    TB1: TTabSheet;
    TB2: TTabSheet;
    XPListBox1: TXPListBox;
    XPListBox2: TXPListBox;
    TB3: TTabSheet;
    TB4: TTabSheet;
    XPListBox3: TXPListBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRepCent: TFRepCent;

implementation

uses ProVar, FrooshDM, Routins;

{$R *.DFM}

end.
