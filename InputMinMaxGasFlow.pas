unit InputMinMaxGasFlow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  SMBLabeledEdit;

type
  TfmInputMinMaxGasFlowValue = class(TForm)
    leMin: TSMBLabeledEdit;
    leMax: TSMBLabeledEdit;
    leStringAmount: TSMBLabeledEdit;
    bnOK: TButton;
    procedure bnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FMax: Extended;
    FMin: Extended;
    FStringAmount: Integer;
    function GetMin: Extended;
    function GetMax: Extended;
    function GetStringAmount: Integer;
    { Private declarations }
  public
    { Public declarations }
  published
    property Min: Extended read GetMin;
    property Max: Extended read GetMax;
    property StringAmount: Integer read GetStringAmount;
  end;

var
  fmInputMinMaxGasFlowValue: TfmInputMinMaxGasFlowValue;

implementation
uses System.UITypes;
{$R *.dfm}

{ TfmInputMinMaxGasFlowValue }

procedure TfmInputMinMaxGasFlowValue.bnOKClick(Sender: TObject);
var
  ErrorMsg: string;
begin
  ErrorMsg := '';
  if leMin.Valid and leMax.Valid and leStringAmount.Valid then
  begin
    FMin          := leMin.Value;
    FMax          := leMax.Value;
    FStringAmount := leStringAmount.Value;
    if FMax > FMin then
      ModalResult   := mrOk
    else
    begin
      MessageDlg('Максимальный расход должен быть больше минимального!!!', mtWarning, [mbOK], 0, mbOK);
      leMax.SetFocus;
    end;
  end
  else
  begin
    ErrorMsg := leMin.ErrorMsg + leMax.ErrorMsg + leStringAmount.ErrorMsg;
    MessageDlg(ErrorMsg, mtWarning, [mbOK], 0, mbOK);
    leMin.SetFocus;
  end;
end;

procedure TfmInputMinMaxGasFlowValue.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if not (ModalResult = mrOk) then
    if MessageDlg('Вы не заполнили параметры СИ. Удалить вновь введенное СИ?',
      mtWarning, mbYesNo, 0, mbNo) = mrYes then
        ModalResult := mrCancel
    else
      Action := caNone;
end;

function TfmInputMinMaxGasFlowValue.GetMax: Extended;
begin
  Result := FMax;
end;

function TfmInputMinMaxGasFlowValue.GetMin: Extended;
begin
  Result := FMin;
end;

function TfmInputMinMaxGasFlowValue.GetStringAmount: Integer;
begin
  Result := FStringAmount;
end;

end.
