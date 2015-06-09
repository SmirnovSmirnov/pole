unit Threads;

interface

uses
  System.Classes, System.Win.TaskbarCore;

type
  TBaseThread = Class(TThread)
    constructor Create();
  protected
    PrivateIndex: Integer;
    procedure SynchVisualBegin();
    procedure SynchVisualProgress();
  End;
  TThread1 = Class(TBaseThread)
  protected
    procedure Execute(); override;
  End;
  TThread2 = Class(TBaseThread)
  protected
    procedure Execute(); override;
  End;
  TThread3 = Class(TBaseThread)
  protected
    procedure Execute(); override;
  End;
  TThread4 = Class(TBaseThread)
  protected
    procedure Execute(); override;
  End;
  TThread5 = Class(TBaseThread)
  protected
    procedure Execute(); override;
  End;
  TThread6 = Class(TBaseThread)
  protected
    procedure Execute(); override;
  End;
  TThread7 = Class(TBaseThread)
  protected
    procedure Execute(); override;
  End;
  TThread8 = Class(TBaseThread)
  protected
    procedure Execute(); override;
  End;
  TThread9 = Class(TBaseThread)
  protected
    procedure Execute(); override;
  End;
  TThread10 = Class(TBaseThread)
  protected
    procedure Execute(); override;
  End;

implementation

uses
  Global;

{ TBaseThread }

constructor TBaseThread.Create;
begin
  inherited Create(True);
  FreeOnTerminate := True;
  Randomize;
  Priority := TThreadPriority(Random(1) + 1);
end;

procedure TBaseThread.SynchVisualProgress;
begin
  {$IfDef SYNCHRONIZE}Synchronize(procedure
  begin{$EndIf}
    ProgressBarsList.Items[0].StepIt;
    ProgressBarsList.Items[PrivateIndex].StepIt;
    TaskBar.ProgressValue := ProgressBarsList.Items[0].Position;
    if TaskBar.ProgressState = TTaskBarProgressState.None then
      if ProgressBarsList.Items[PrivateIndex].Position < ProgressBarsList.Items[PrivateIndex].Max then
        TaskBar.ProgressState := TTaskBarProgressState.Normal;
    if ProgressBarsList.Items[PrivateIndex].Position = ProgressBarsList.Items[PrivateIndex].Max then
    begin
      ButtonsList.Items[PrivateIndex].Caption := btnStop;
      ButtonsList.Items[PrivateIndex].Enabled := false;
    end;
    if ProgressBarsList.Items[0].Position = ProgressBarsList.Items[0].Max then
    begin
      ButtonsList.Items[0].Caption := btnStop;
      ButtonsList.Items[0].Enabled := false;
      TaskBar.ProgressState := TTaskBarProgressState.None;
    end;
  {$IfDef SYNCHRONIZE}
  end);{$EndIf}
end;

procedure TBaseThread.SynchVisualBegin;
begin
  {$IfDef SYNCHRONIZE}Synchronize(procedure
  begin{$EndIf}
    ButtonsList.Items[PrivateIndex].Enabled := True;
    ButtonsList.Items[PrivateIndex].Caption := btnPause;
  {$IfDef SYNCHRONIZE}
  end);{$EndIf}
end;

{ TThread1 }

procedure TThread1.Execute;
begin
  inherited;
  PrivateIndex := 1;
  SynchVisualBegin;
  while ProgressBarsList.Items[PrivateIndex].Position < ProgressBarsList.Items[PrivateIndex].Max do
  begin
    Sleep(Integer(Priority)*100);
    if (Global.Suspended[0]) or (Global.Suspended[PrivateIndex]) then
      Continue;
    {$IfDef SYNCHRONIZE}Synchronize({$EndIf}SynchVisualProgress{$IfDef SYNCHRONIZE}){$EndIf};
  end;
  ThreadsList.Items[1].Start;
  ThreadsList.Items[2].Start;
end;
{ TThread2 }

procedure TThread2.Execute;
begin
  inherited;
  PrivateIndex := 2;
  SynchVisualBegin;
  while ProgressBarsList.Items[PrivateIndex].Position < ProgressBarsList.Items[PrivateIndex].Max do
  begin
    Sleep(Integer(Priority)*100);
    if (Global.Suspended[0]) or (Global.Suspended[PrivateIndex]) then
      Continue;
    SynchVisualProgress;
  end;
  ThreadsList.Items[3].Start;
  ThreadsList.Items[4].Start;
end;
{ TThread3 }

procedure TThread3.Execute;
begin
  inherited;
  PrivateIndex := 3;
  SynchVisualBegin;
  while ProgressBarsList.Items[PrivateIndex].Position < ProgressBarsList.Items[PrivateIndex].Max do
  begin
    Sleep(Integer(Priority)*100);
    if (Global.Suspended[0]) or (Global.Suspended[PrivateIndex]) then
      Continue;
    SynchVisualProgress;
  end;
  ThreadsList.Items[5].Start;
  ThreadsList.Items[6].Start;
end;

{ TThread4 }

procedure TThread4.Execute;
begin
  inherited;
  PrivateIndex := 4;
  SynchVisualBegin;
  while ProgressBarsList.Items[PrivateIndex].Position < ProgressBarsList.Items[PrivateIndex].Max do
  begin
    Sleep(Integer(Priority)*100);
    if (Global.Suspended[0]) or (Global.Suspended[PrivateIndex]) then
      Continue;
    SynchVisualProgress;
  end;
  {$IfDef SYNCHRONIZE}CriticalSection.Enter;{$EndIf}
  if IsFinished4or5 then
    ThreadsList.Items[7].Start
  else
    IsFinished4or5 := True;
  {$IfDef SYNCHRONIZE}CriticalSection.Leave;{$EndIf}
end;

{ TThread5 }

procedure TThread5.Execute;
begin
  inherited;
  PrivateIndex := 5;
  SynchVisualBegin;
  while ProgressBarsList.Items[PrivateIndex].Position < ProgressBarsList.Items[PrivateIndex].Max do
  begin
    Sleep(Integer(Priority)*100);
    if (Global.Suspended[0]) or (Global.Suspended[PrivateIndex]) then
      Continue;
    SynchVisualProgress;
  end;
  {$IfDef SYNCHRONIZE}CriticalSection.Enter;{$EndIf}
  if IsFinished6or7 then
    ThreadsList.Items[8].Start
  else
    IsFinished6or7 := True;
  {$IfDef SYNCHRONIZE}CriticalSection.Leave;{$EndIf}
end;

{ TThread6 }

procedure TThread6.Execute;
begin
  inherited;
  PrivateIndex := 6;
  SynchVisualBegin;
  while ProgressBarsList.Items[PrivateIndex].Position < ProgressBarsList.Items[PrivateIndex].Max do
  begin
    Sleep(Integer(Priority)*100);
    if (Global.Suspended[0]) or (Global.Suspended[PrivateIndex]) then
      Continue;
    SynchVisualProgress;
  end;
    {$IfDef SYNCHRONIZE}CriticalSection.Enter;{$EndIf}
  if IsFinished6or7 then
    ThreadsList.Items[8].Start
  else
    IsFinished6or7 := True;
  {$IfDef SYNCHRONIZE}CriticalSection.Leave;{$EndIf}
 { ThreadsList.Items[7].Start;    }
end;

{ TThread7 }

procedure TThread7.Execute;
begin
  inherited;
  PrivateIndex := 7;
  SynchVisualBegin;
  while ProgressBarsList.Items[PrivateIndex].Position < ProgressBarsList.Items[PrivateIndex].Max do
  begin
    Sleep(Integer(Priority)*100);
    if (Global.Suspended[0]) or (Global.Suspended[PrivateIndex]) then
      Continue;
    SynchVisualProgress;
  end;
  {$IfDef SYNCHRONIZE}CriticalSection.Enter;{$EndIf}
  if IsFinished6or7 then
    ThreadsList.Items[7].Start
  else
    IsFinished6or7 := True;
  {$IfDef SYNCHRONIZE}CriticalSection.Leave;{$EndIf}
end;

{ TThread8 }

procedure TThread8.Execute;
begin
  inherited;
  PrivateIndex := 8;
  SynchVisualBegin;
  while ProgressBarsList.Items[PrivateIndex].Position < ProgressBarsList.Items[PrivateIndex].Max do
  begin
    Sleep(Integer(Priority)*100);
    if (Global.Suspended[0]) or (Global.Suspended[PrivateIndex]) then
      Continue;
    SynchVisualProgress;
  end;
     {$IfDef SYNCHRONIZE}CriticalSection.Enter;{$EndIf}
  if IsFinished8or9 then
    ThreadsList.Items[9].Start
  else
    IsFinished8or9 := True;
  {$IfDef SYNCHRONIZE}CriticalSection.Leave;{$EndIf}
  end;
{ TThread9 }

procedure TThread9.Execute;
begin
  inherited;
  PrivateIndex := 9;
  SynchVisualBegin;
  while ProgressBarsList.Items[PrivateIndex].Position < ProgressBarsList.Items[PrivateIndex].Max do
  begin
    Sleep(Integer(Priority)*20);
    if (Global.Suspended[0]) or (Global.Suspended[PrivateIndex]) then
      Continue;
    SynchVisualProgress;
  end;
     {$IfDef SYNCHRONIZE}CriticalSection.Enter;{$EndIf}
  if IsFinished8or9 then
    ThreadsList.Items[9].Start
  else
    IsFinished8or9 := True;
  {$IfDef SYNCHRONIZE}CriticalSection.Leave;{$EndIf}
  end;

{ TThread10 }

procedure TThread10.Execute;
begin
  inherited;
  PrivateIndex := 10;
  SynchVisualBegin;
  while ProgressBarsList.Items[PrivateIndex].Position < ProgressBarsList.Items[PrivateIndex].Max do
  begin
    Sleep(Integer(Priority)*20);
    if (Global.Suspended[0]) or (Global.Suspended[PrivateIndex]) then
      Continue;
    SynchVisualProgress;
  end;
end;

end.
