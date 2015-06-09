unit Global;

interface

uses
  Threads, Vcl.StdCtrls, System.Generics.Collections, Vcl.ComCtrls,
  Vcl.Taskbar, System.SyncObjs, System.Win.TaskbarCore;

const
  MSG_INIT: LongWord = 1001;

var
  IsStarted: Boolean = False;
  IsFinished4or5: Boolean = False;
  IsFinished6or7: Boolean = False;
  IsFinished8or9: Boolean = False;
  Suspended: Array [0..9] of Boolean = (False, False, False, False, False, False, False, False, False, False);
  CriticalSection: TCriticalSection;

var
  TaskBar: TTaskBar;
procedure InitGlobal;
procedure UnInitGlobal;

const
  btnStop: String = '■';
  btnStart: String = '▶'; //'►'
  btnPause: String = '❙❙';
var
  ButtonsList: TList<TButton>;
procedure InitButtons;
procedure ButtonClick(Sender: TButton);

var
  ProgressBarsList: TList<TProgressBar>;
procedure InitProgressBars;

var
  ThreadsList: TList<TBaseThread>;
procedure InitThreads;

implementation

procedure InitGlobal;
begin
  ButtonsList := TList<TButton>.Create;
  ProgressBarsList := TList<TProgressBar>.Create;
  CriticalSection := TCriticalSection.Create;
  ThreadsList := TList<TBaseThread>.Create;
  InitThreads;
end;

procedure UnInitGlobal;
var
  Thread: TBaseThread;
begin
  for Thread in ThreadsList do
    if (Thread <> nil) then
      Thread.Terminate;
  ThreadsList.Clear;
  ThreadsList.Free;
  CriticalSection.Free;
  ProgressBarsList.Clear;
  ProgressBarsList.Free;
  ButtonsList.Clear;
  ButtonsList.Free;
end;

// Buttons

var
  IsInitializedButtons: Boolean = false;
procedure InitButtons;
var
  Button: TButton;
begin
  if (ButtonsList = nil) or (IsInitializedButtons) then Exit;
  for Button in ButtonsList do
  begin
    Button.Width := Button.Height;
    if ButtonsList.IndexOf(Button) = 0 then
      Button.Caption := btnStart
    else
    begin
      Button.Caption := btnStop;
      Button.Enabled := false;
    end;
  end;
  IsInitializedButtons := True;
end;

procedure ButtonClick(Sender: TButton);
begin
  if Sender.Caption = btnStop then
  begin
    Sender.Enabled := False;
    Exit;
  end;
  if Sender.Caption = btnStart then
  begin
    Sender.Caption := btnPause;
    if (Not IsStarted) and (ButtonsList.IndexOf(Sender) = 0) then
    begin
      ThreadsList.Items[0].Start;
      IsStarted := True;
    end;
    Suspended[ButtonsList.IndexOf(Sender)] := False;
    ProgressBarsList.Items[ButtonsList.IndexOf(Sender)].State := pbsNormal;
    if ButtonsList.IndexOf(Sender) = 0 then
      TaskBar.ProgressState := TTaskBarProgressState.Normal;
    Exit;
  end;
  if Sender.Caption = btnPause then
  begin
    Sender.Caption := btnStart;
    Suspended[ButtonsList.IndexOf(Sender)] := True;
    ProgressBarsList.Items[ButtonsList.IndexOf(Sender)].State := pbsPaused;
    if ButtonsList.IndexOf(Sender) = 0 then
      TaskBar.ProgressState := TTaskBarProgressState.Paused;
    Exit;
  end;
end;

// ProgressBars
var
  IsInitializedProgressBars: Boolean = False;
procedure InitProgressBars;
var
  ProgressBar: TProgressBar;
begin
  if (ProgressBarsList = nil) or (IsInitializedProgressBars) then Exit;
  for ProgressBar in ProgressBarsList do
  begin
    ProgressBar.Position := 0;
  end;
  IsInitializedProgressBars := True;
end;

// Threads

var
  IsInitializedThreads: Boolean = False;
procedure InitThreads;
begin
  if (ThreadsList = nil) or (IsInitializedThreads) then Exit;
  ThreadsList.Add(TThread1.Create());
  ThreadsList.Add(TThread2.Create());
  ThreadsList.Add(TThread3.Create());
  ThreadsList.Add(TThread4.Create());
  ThreadsList.Add(TThread5.Create());
  ThreadsList.Add(TThread6.Create());
  ThreadsList.Add(TThread7.Create());
  ThreadsList.Add(TThread8.Create());
  ThreadsList.Add(TThread9.Create());
  ThreadsList.Add(TThread10.Create());
  IsInitializedThreads := True;
end;

end.
