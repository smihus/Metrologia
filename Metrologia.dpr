program Metrologia;

uses
  Vcl.Forms,
  main in 'main.pas' {Form1},
  Connection in 'Connection.pas',
  InputMinMaxGasFlow in 'InputMinMaxGasFlow.pas' {fmInputMinMaxGasFlowValue},
  DBConst in 'DBConst.pas',
  SMBLabeledEdit in '..\SMBComponents\SMBLabeledEdit\SMBLabeledEdit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfmMain, fmMain);
  Application.CreateForm(TfmInputMinMaxGasFlowValue, fmInputMinMaxGasFlowValue);
  Application.Run;
end.
