unit Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Layouts, FMX.TreeView, FMX.Objects;

type

  TfrmMain = class(TForm)
    tv1: TTreeView;
    pnl1: TPanel;
    btn1: TButton;
    scrlbx1: TScrollBox;
    btn2: TButton;
    procedure btn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

procedure TfrmMain.btn1Click(Sender: TObject);
var i : Integer;
begin
  tv1.BeginUpdate;
  tv1.Clear;
  tv1.EndUpdate;
  tv1.BeginUpdate;
  try
    for I := 0 to 10 do begin
      with TTreeViewItem.Create( tv1 ) do begin
        Parent := tv1;
        Text := inttostr(i);
      end;
    end;
  finally
    tv1.EndUpdate;
  end;
end;


procedure TfrmMain.btn2Click(Sender: TObject);
var i : Integer;
begin
  tv1.Clear;
  for I := 0 to 10 do begin
    with TTreeViewItem.Create( tv1 ) do begin
      Parent := tv1;
      Text := inttostr(i);
    end;
  end;
  tv1.Selected := tv1.Items[ tv1.Count-1 ];
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
end;

end.
