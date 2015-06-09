unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, System.Win.TaskbarCore, Vcl.Taskbar;

type
  TProcess1Form = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    ProgressBar1: TProgressBar;
    Button1: TButton;
    Panel2: TPanel;
    Label2: TLabel;
    ProgressBar2: TProgressBar;
    Button2: TButton;
    Panel3: TPanel;
    Label3: TLabel;
    ProgressBar3: TProgressBar;
    Button3: TButton;
    Panel4: TPanel;
    Label4: TLabel;
    ProgressBar4: TProgressBar;
    Button4: TButton;
    Panel5: TPanel;
    Label5: TLabel;
    ProgressBar5: TProgressBar;
    Button5: TButton;
    Panel6: TPanel;
    Label6: TLabel;
    ProgressBar6: TProgressBar;
    Button6: TButton;
    Panel7: TPanel;
    Label7: TLabel;
    ProgressBar7: TProgressBar;
    Button7: TButton;
    Panel8: TPanel;
    Label8: TLabel;
    ProgressBar8: TProgressBar;
    Button8: TButton;
    Panel11: TPanel;
    Label9: TLabel;
    ProgressBar9: TProgressBar;
    Button9: TButton;
    Taskbar1: TTaskbar;
    Panel9: TPanel;
    Label11: TLabel;
    ProgressBar11: TProgressBar;
    Button11: TButton;
    Panel10: TPanel;
    Label10: TLabel;
    ProgressBar10: TProgressBar;
    Button10: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Process1Form: TProcess1Form;

implementation

uses
  Global, Threads;

{$R *.dfm}

procedure TProcess1Form.FormShow(Sender: TObject);
begin
  InitButtons;
  InitProgressBars;
  AutoSize := False;
end;

procedure TProcess1Form.FormCreate(Sender: TObject);
var
  Button: TButton;
begin
  TaskBar := Taskbar1;
  InitGlobal;
  ButtonsList.Add(Button1);
  ButtonsList.Add(Button2);
  ButtonsList.Add(Button3);
  ButtonsList.Add(Button4);
  ButtonsList.Add(Button5);
  ButtonsList.Add(Button6);
  ButtonsList.Add(Button7);
  ButtonsList.Add(Button8);
  ButtonsList.Add(Button9);
  ButtonsList.Add(Button10);
  ButtonsList.Add(Button11);
  for Button in ButtonsList do
    Button.OnClick := ButtonClick;
  ProgressBarsList.Add(ProgressBar1);
  ProgressBarsList.Add(ProgressBar2);
  ProgressBarsList.Add(ProgressBar3);
  ProgressBarsList.Add(ProgressBar4);
  ProgressBarsList.Add(ProgressBar5);
  ProgressBarsList.Add(ProgressBar6);
  ProgressBarsList.Add(ProgressBar7);
  ProgressBarsList.Add(ProgressBar8);
  ProgressBarsList.Add(ProgressBar9);
  ProgressBarsList.Add(ProgressBar11);
  ProgressBarsList.Add(ProgressBar10);
end;

procedure TProcess1Form.ButtonClick(Sender: TObject);
begin
  Global.ButtonClick(TButton(Sender));
end;

procedure TProcess1Form.FormDestroy(Sender: TObject);
begin
  UnInitGlobal;
end;

end.
