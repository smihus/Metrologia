unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.DBCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Data.Win.ADODB, Data.Bind.EngExt, Vcl.Bind.DBEngExt,
  System.Rtti, System.Bindings.Outputs, Data.Bind.Components, Data.Bind.Grid,
  Data.Bind.DBScope, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Tabs, Vcl.DockTabSet,
  System.Actions, Vcl.ActnList, System.UITypes, Vcl.Menus, System.Math,
  InputMinMaxGasFlow, SMB.Validators, SMB.DBUtils, SMBLocalSettings;

const Rsr = 1.29; // ��/�3
const Pp  = 0.1;  // ���
const DefaultValuesULM:  array[0..11] of Integer =
  (250, 400, 630, 1000, 1600, 2500, 4000, 6300, 10000, 16000, 25000, 40000); // ��� ����������� �������� ��� � ��
const DefaultValuesAccuracyClass: array[0..7] of Extended =
  (0.1, 0.25, 0.4, 0.6, 1, 1.5, 2.5, 4); // ��� ����������� �������� ������ �������� �� � %

type
  TfmMain = class(TForm)
    mainConnection: TADOConnection;
    qryCounters: TADOQuery;
    dsCounters: TDataSource;
    EvalutionOfTechConditionPanel: TPanel;
    LeftPanel: TPanel;
    lCounters: TLabel;
    grdCounters: TDBGrid;
    RightPanel: TPanel;
    pcMain: TPageControl;
    tsAssessmentMeasurementTools: TTabSheet;
    tsSelectionMeasurementTool: TTabSheet;
    tsReferencesData: TTabSheet;
    lGasFlowRates: TLabel;
    grdGasFlowRates: TDBGrid;
    dsGasFlowRates: TDataSource;
    qryGasFlowRates: TADOQuery;
    pButtonsRDGasFlowRate: TPanel;
    ActionList: TActionList;
    odOpenDB: TOpenDialog;
    aCreateNewRecordCounter: TAction;
    pmCounters: TPopupMenu;
    pmiAddCounterRecord: TMenuItem;
    aDeleteRecordCounter: TAction;
    pmiDeleteCounterRecord: TMenuItem;
    pmGasFlowRates: TPopupMenu;
    pButtonsRDCounters: TPanel;
    bnSaveCounterRecord: TButton;
    bnAddNewCounterRecord: TButton;
    bnSaveGasFlowRateRecord: TButton;
    aSaveEditedRecordCounter: TAction;
    N5: TMenuItem;
    pmiSaveCounterRecord: TMenuItem;
    bnDeleteCounterRecord: TButton;
    aSaveEditedGasFlowRate: TAction;
    lcbCounterType: TDBLookupComboBox;
    lcbCounterG: TDBLookupComboBox;
    lcbCounterDu: TDBLookupComboBox;
    lcbCounterSertificateNumber: TDBLookupComboBox;
    lCounterDu: TLabel;
    lCounterSertificateNumber: TLabel;
    lCounterG: TLabel;
    lCounter: TLabel;
    gbxCounter: TGroupBox;
    gbxOperatingConditions: TGroupBox;
    ePmin: TEdit;
    lP: TLabel;
    ePmax: TEdit;
    eQpmin: TEdit;
    lQp: TLabel;
    eQpmax: TEdit;
    lAccuracyClass: TLabel;
    pmiSaveGasFlowRateRecord: TMenuItem;
    lRs: TLabel;
    eRs: TEdit;
    gbCalculationResult: TGroupBox;
    bnCalculate: TButton;
    qryCountersidCounter: TAutoIncField;
    qryCounterscounterName: TWideStringField;
    qryCountersG: TSmallintField;
    qryCountersDu: TSmallintField;
    qryCountersSertificateNumber: TWideStringField;
    qryCounterTypes: TADOQuery;
    dsCounterTypes: TDataSource;
    qryCounterTypestypeName: TWideStringField;
    qryCounterstypeNameLookUp: TStringField;
    qryCounterstypeName: TWideStringField;
    qryGasFlowRatesflowRate: TBCDField;
    qryGasFlowRatespressureDrop: TBCDField;
    qryGasFlowRatesidCounter: TIntegerField;
    qryGasFlowRatesflowRatePercent: TFloatField;
    qryCountersminFlowRate: TBCDField;
    qryCountersmaxFlowRate: TBCDField;
    mCalculationResult: TMemo;
    pLeft: TPanel;
    lcbCounterName: TDBLookupComboBox;
    lCounterName: TLabel;
    lCurrentDeltaP: TLabel;
    eCurrentDeltaP: TEdit;
    lULM: TLabel;
    cbULM: TComboBox;
    cbAccuracyClass: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure mainConnectionAfterConnect(Sender: TObject);
    procedure qryCountersAfterPost(DataSet: TDataSet);
    procedure aCreateNewRecordCounterExecute(Sender: TObject);
    procedure aDeleteRecordCounterExecute(Sender: TObject);
    procedure aDeleteRecordGasFlowRateExecute(Sender: TObject);
    procedure aSaveEditedRecordCounterExecute(Sender: TObject);
    procedure aSaveEditedGasFlowRateExecute(Sender: TObject);
    procedure qryCountersBeforePost(DataSet: TDataSet);
    procedure qryCountersPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qryGasFlowRatesPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qryGasFlowRatesBeforePost(DataSet: TDataSet);
    procedure qryCountersAfterEdit(DataSet: TDataSet);
    procedure lcbCounterTypeExit(Sender: TObject);
    procedure lcbCounterGExit(Sender: TObject);
    procedure lcbCounterDuExit(Sender: TObject);
    procedure OnKeyPressFloat(Sender: TObject; var Key: Char);
    procedure SelectionMT(Sender: TObject);
    procedure AssessmentMT(Sender: TObject);
    procedure qryGasFlowRatesCalcFields(DataSet: TDataSet);
    procedure qryCountersAfterInsert(DataSet: TDataSet);
    procedure qryGasFlowRatesBeforeInsert(DataSet: TDataSet);
    procedure pcMainChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lcbCounterNameExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FLocalSettings: TSMBLocalSettings;
    FCreateNewCounter,
    IsEditedCounterRecord: Boolean;
    // ����������� ������ ��� ��������
    FPmin,
    FPmax,
    FQpmin,
    FQpmax,
    FCurrentDeltaP,
    FAccuracyClass,
    FRs: Extended;
    FULM: Integer; // FULM ������������ ������ ��� ������ ��������� ��. � ������� �� ULM - ��������� ��������
    qryCounterType: TADOQuery;
    qryCounterG: TADOQuery;
    qryCounterDu: TADOQuery;
    qryCounterName: TADOQuery;
    qryCounterSertificateNumber: TADOQuery;
    dsCounterType: TDataSource;
    dsCounterG: TDataSource;
    dsCounterDu: TDataSource;
    dsCounterName: TDatasource;
    dsCounterSertificateNumber: TDataSource;
    procedure InitQueryesAndLookupComboBoxes();
    function VerificateUserInput(CalculationType: String): Boolean;
    function GetDeltaPp(const idCounter: Integer; const Qp: Extended):Extended;
    function GetMaxDefaultValueULM(const CurrentValueULM: Extended): Extended;
    function CalculateDeltaPraschmax(const DeltaPpmax: Extended;
      const Rs: Extended; const Pmax: Extended):Extended;
    function CalculateDeltaPraschmin(const DeltaPpmin: Extended;
      const Rs: Extended; const Pmin: Extended):Extended;
    function SelectionOfTheInverter(const ULM: Extended; const DeltaPdopmin: Extended;
      const AccuracyClass: Extended): String;
    procedure ShowPageControlTab(TabIndex: Integer);
    procedure FillComboBoxInt(ComboBox: TComboBox; Items: array of Integer);
    procedure FillComboBoxFloat(ComboBox: TComboBox; Items: array of Extended);
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;

implementation
uses
  Connection;

{$R *.dfm}

procedure TfmMain.InitQueryesAndLookupComboBoxes;
begin
  CreateADOQueryAndDataSource(Self, mainConnection,
    'select distinct typeName from CounterTypes', qryCounterType, dsCounterType);
  lcbCounterType.ListSource := dsCounterType;
  lcbCounterType.KeyField   := 'typeName';
  lcbCounterType.KeyValue   := qryCounterType.FieldValues['typeName'];

  CreateADOQueryAndDataSource(Self, mainConnection,
    'select distinct counterName from Counters '
    + 'where typeName = :typeName',
    qryCounterName, dsCounterName);
  lcbCounterName.ListSource := dsCounterName;
  lcbCounterName.KeyField   := 'counterName';

  CreateADOQueryAndDataSource(Self, mainConnection,
    'select distinct G from Counters where typeName = :typeName '
    +'and counterName = :counterName', qryCounterG, dsCounterG);
  lcbCounterG.ListSource  := dsCounterG;
  lcbCounterG.KeyField    := 'G';

  CreateADOQueryAndDataSource(Self, mainConnection,
    'select distinct Du from Counters where typeName = :typeName '
    + 'and counterName = :counterName and G = :G', qryCounterDu, dsCounterDu);
  lcbCounterDu.ListSource := dsCounterDu;
  lcbCounterDu.KeyField   := 'Du';

  CreateADOQueryAndDataSource(Self, mainConnection,
    'select distinct idCounter, SertificateNumber from Counters '
      + 'where typeName = :typeName and counterName = :counterName and G = :G and Du = :Du ',
      qryCounterSertificateNumber, dsCounterSertificateNumber);
  lcbCounterSertificateNumber.ListSource := dsCounterSertificateNumber;
  lcbCounterSertificateNumber.ListField  := 'SertificateNumber';
  lcbCounterSertificateNumber.KeyField   := 'idCounter';

  lcbCounterTypeExit(Self);
end;

procedure TfmMain.lcbCounterTypeExit(Sender: TObject);
begin
  with qryCounterName do
  begin
    Active                              := False;
    Parameters.ParamValues['typeName']  := lcbCounterType.KeyValue;
    Active                              := True;
    lcbCounterName.KeyValue             := FieldValues['counterName'];
  end;
  lcbCounterNameExit(Sender);


end;

procedure TfmMain.lcbCounterNameExit(Sender: TObject);
begin

  with qryCounterG do
  begin
    Active                                := False;
    Parameters.ParamValues['typeName']    := lcbCounterType.KeyValue;
    Parameters.ParamValues['counterName'] := qryCounterName.FieldValues['counterName'];
    Active                                := True;
    lcbCounterG.KeyValue                  := FieldValues['G']
  end;

  lcbCounterGExit(Sender);
end;

procedure TfmMain.lcbCounterGExit(Sender: TObject);
begin
  with qryCounterDu do
  begin
    Active                                := False;
    Parameters.ParamValues['typeName']    := lcbCounterType.KeyValue;
    Parameters.ParamValues['counterName'] := qryCounterName.FieldValues['counterName'];
    Parameters.ParamValues['G']           := lcbCounterG.KeyValue;
    Active                                := True;
    lcbCounterDu.KeyValue                 := FieldValues['Du'];
  end;
  lcbCounterDuExit(Sender);
end;

procedure TfmMain.lcbCounterDuExit(Sender: TObject);
begin
  with qryCounterSertificateNumber do
  begin
    Active                                := False;
    Parameters.ParamValues['typeName']    := qryCounterType.FieldValues['typeName'];
    Parameters.ParamValues['G']           := qryCounterG.FieldValues['G'];
    Parameters.ParamValues['Du']          := qryCounterDu.FieldValues['Du'];
    Parameters.ParamValues['counterName'] := qryCounterName.FieldValues['counterName'];
    Active                                := True;
    lcbCounterSertificateNumber.KeyValue  := FieldValues['idCounter'];
  end;
end;

procedure TfmMain.aCreateNewRecordCounterExecute(Sender: TObject);
begin
  qryCounters.Append;
end;

procedure TfmMain.FillComboBoxFloat(ComboBox: TComboBox;
  Items: array of Extended);
var
  i: Integer;
begin
  ComboBox.Items.Clear;
  for i := 0 to Length(Items) - 1 do
    ComboBox.Items.Add(FloatToStr(Items[i]));
  ComboBox.ItemIndex := 0;

end;

procedure TfmMain.FillComboBoxInt(ComboBox: TComboBox; Items: array of Integer);
var
  i: Integer;
begin
  ComboBox.Items.Clear;
  for i := 0 to Length(Items) - 1 do
    ComboBox.Items.Add(IntToStr(Items[i]));
  ComboBox.ItemIndex := 0;

end;

procedure TfmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FLocalSettings['CurrentTabIndex'] := IntToStr(pcMain.TabIndex);
end;

procedure TfmMain.FormCreate(Sender: TObject);
begin
  FLocalSettings := TSMBLocalSettings.Create(Self);
  MakeConnection(Application, mainConnection, FLocalSettings);
  FillComboBoxInt(cbULM, DefaultValuesULM);
  FillComboBoxFloat(cbAccuracyClass, DefaultValuesAccuracyClass);
  InitQueryesAndLookupComboBoxes();
end;

procedure TfmMain.FormShow(Sender: TObject);
var
  ErrorMsg: String;
  CurrentTabIndex: Integer;
begin
  if not TryStrToBetween('', FLocalSettings['CurrentTabIndex'], 0, 2, ErrorMsg, CurrentTabIndex, True) then
    CurrentTabIndex := 0;

  pcMain.TabIndex := CurrentTabIndex;
  ShowPageControlTab(pcMain.TabIndex);
end;

{ GetDeltaPp ����������:
  * ������� �������� �� �� � ����� idCounter ��� �������� Qp (������� ����,
    ��� ������� ��������������� �������).
  * -1 - ���� Qp ���� ���������� ���������� ������� ���� ��� ���������� ��.
  * -2 - ���� Qp ���� ����������� ���������� ������� ���� ��� ���������� ��. }
function TfmMain.GetDeltaPp(const idCounter: Integer; const Qp: Extended):Extended;
var
  Query: TADOQuery;
  FlowRateMin,
  FlowRateMax,
  PressureDropMin,
  PressureDropMax,
  Ratio: Extended;
begin
  Query := TADOQuery.Create(Self);
  with Query do
  begin
    Connection  := mainConnection;
    //������� ��������� � Qp ������� ������� ���� ������
    Active      := False;
    SQL.Text    := 'select top 1 flowRate, PressureDrop from GasFlowRates '
      + 'where idCounter = :idCounter and flowRate >= :Qp '
      + 'order by flowRate asc';
    Parameters.ParamValues['idCounter'] := idCounter;
    Parameters.ParamValues['Qp']        := Qp;
    Active := True;

    if not IsEmpty then
    begin
      FlowRateMax     := FieldValues['flowRate'];
      PressureDropMax := FieldValues['PressureDrop'];
    end
    else
    begin
      Result := -2;
      Exit;
    end;

    //������� ��������� � Qp ������� ������� ���� �����
    Active      := False;
    SQL.Text    := 'select top 1 flowRate, PressureDrop from GasFlowRates '
      + 'where idCounter = :idCounter and flowRate <= :Qp '
      + 'order by flowRate desc';
    Parameters.ParamValues['idCounter'] := idCounter;
    Parameters.ParamValues['Qp']        := Qp;
    Active := True;

    if not IsEmpty then
    begin
      FlowRateMin     := FieldValues['flowRate'];
      PressureDropMin := FieldValues['PressureDrop'];
    end
    else
    begin
      Result := -1;
      Exit;
    end;

    Free;

    if (FlowRateMax - FlowRateMin) > 0 then
      Ratio := (Qp - FlowRateMin) / (FlowRateMax - FlowRateMin)
    else
      Ratio := 0;

    Result  := PressureDropMin + (PressureDropMax-PressureDropMin) * Ratio;
  end;
end;

{ GetMaxDefaultValueULM ���������� ����������� � ������� ������� ��
  ���������� ������������ �������� ��� �������� ��������.
  CurrentValueULM - ������ ���� �������� � ��}
function TfmMain.GetMaxDefaultValueULM(
  const CurrentValueULM: Extended): Extended;
var
  i: Integer;
begin
  i := 0;

  while DefaultValuesULM[i] < CurrentValueULM do
    i := i + 1;

  Result := DefaultValuesULM[i];
end;

procedure TfmMain.mainConnectionAfterConnect(Sender: TObject);
begin
  qryCounters.Active := True;
  qryGasFlowRates.Active := True
end;

procedure TfmMain.qryCountersAfterEdit(DataSet: TDataSet);
begin
  IsEditedCounterRecord := True;
  with qryCounters do
  begin

  end;
end;

procedure TfmMain.qryCountersAfterInsert(DataSet: TDataSet);
begin
  with qryCounters do
  begin
    FieldValues['counterName']        := '';
    FieldValues['typeName']           := qryCounterTypes.FieldValues['typeName'];
    FieldValues['G']                  := 16;
    FieldValues['Du']                 := 50;
    FieldValues['SertificateNumber']  := '';
    FieldByName('typeNameLookUp').FocusControl;
  end;
end;

procedure TfmMain.qryCountersAfterPost(DataSet: TDataSet);
var
  i,
  StringAmount,
  idCounter         : Integer;

  MinFlowRateValue,
  MaxFlowRateValue,
  FlowRatePerPersent,
  PersentPerString  : Extended;
begin
  idCounter := qryCounters.FieldValues['idCounter'];
  if IsEditedCounterRecord then
  begin
    idCounter           := qryCounters.FieldValues['idCounter'];
    qryCounters.Active  := False;
    qryCounters.Active  := True;
    qryCounters.Locate('idCounter', idCounter, [loPartialKey]);
    IsEditedCounterRecord := False;
    Exit;
  end;

  fmInputMinMaxGasFlowValue := TfmInputMinMaxGasFlowValue.Create(Self);

  if not (fmInputMinMaxGasFlowValue.ShowModal = mrOk) then
  begin
    qryCounters.Delete;
    Exit;
  end;

  MinFlowRateValue  := fmInputMinMaxGasFlowValue.Min;
  MaxFlowRateValue  := fmInputMinMaxGasFlowValue.Max;
  StringAmount      := fmInputMinMaxGasFlowValue.StringAmount;

  if MaxFlowRateValue > MinFlowRateValue then
    FlowRatePerPersent := (MaxFlowRateValue - MinFlowRateValue) / 100
  else
    FlowRatePerPersent := 0;

  PersentPerString := 100 / StringAmount;


  with qryGasFlowRates do
  begin
    for i := 0 to StringAmount do
    begin
      FCreateNewCounter := True;
      Append;
      FieldValues['idCounter'] := idCounter;
      if FlowRatePerPersent = 0 then
        FieldValues['flowRate'] := 0
      else
        FieldValues['flowRate'] :=  RoundTo(MinFlowRateValue
          + i * PersentPerString * FlowRatePerPersent, -2);

      FieldValues['pressureDrop'] := 0;
    end;

    Post();
    FCreateNewCounter := False;
    //��������� ������ � DBGrid
    qryCounters.Active := False;
    qryCounters.Active := True;
    qryCounters.Locate('idCounter', idCounter, [loPartialKey]);
    //qryGasFlowRates
    Active := False;
    Active := True;
    First;
    FieldByName('pressureDrop').FocusControl;
  end;
end;

procedure TfmMain.qryCountersBeforePost(DataSet: TDataSet);
var
  HasError            : Boolean;
  ErrorMessage        : String;
  FirstFieldWithError : TField;
begin

  HasError            := False;
  ErrorMessage        := '';
  FirstFieldWithError := nil;

  with qryCounters do
  begin
    FieldValues['counterName'] := Trim(FieldValues['counterName']);
    if not HasStrValue('������ ��', FieldValues['counterName'], ErrorMessage) then
    begin
      HasError := True;
      if not Assigned(FirstFieldWithError) then
        FirstFieldWithError := FieldByName('counterName');
    end;

    if not IsBetween('���������� ��������', FieldByName('G').AsInteger, 16, 4000, ErrorMessage, True) then
    begin
      HasError := True;
      if not Assigned(FirstFieldWithError) then
        FirstFieldWithError := FieldByName('G');
    end;

    if not IsBetween('������� ��������� ������� (Du)', FieldByName('Du').AsInteger, 50, 300, ErrorMessage, True)
      and not Assigned(FirstFieldWithError) then
        FirstFieldWithError := FieldByName('Du');

    FieldValues['SertificateNumber'] := Trim(FieldValues['SertificateNumber']);
    if not HasStrValue('����� �����������', FieldValues['SertificateNumber'], ErrorMessage) then
    begin
      HasError := True;
      if not Assigned(FirstFieldWithError) then
        FirstFieldWithError := FieldByName('SertificateNumber');
    end;
  end;

  if HasError then
    if MessageDlg('�� �� ��������� ������������ ��������� ��. �������� �������� ��?',
      mtWarning, mbYesNo, 0, mbNo) = mrYes then
    begin
      qryCounters.Delete;
      Abort;
    end
    else
    begin
      MessageDlg(ErrorMessage, mtWarning, [mbOK], 0);
      FirstFieldWithError.FocusControl;
      Abort();
    end;
end;

procedure TfmMain.qryCountersPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  if E is EDatabaseError then
  begin
    MessageDlg('����� ����� �� ��� ����������!'
      + sLineBreak + '���������� ������ ������ ��������.', mtError, [mbOK], 0);
    Action := daAbort;
  end;
end;

procedure TfmMain.qryGasFlowRatesBeforeInsert(DataSet: TDataSet);
begin
  if not FCreateNewCounter then
    Abort;
end;

procedure TfmMain.qryGasFlowRatesBeforePost(DataSet: TDataSet);
var
  HasError: Boolean;
  ErrorMessage: String;
  FirstFieldWithError: TField;
begin

  if FCreateNewCounter then
    Exit;

  HasError := False;
  ErrorMessage := '';
  FirstFieldWithError := nil;

  with qryGasFlowRates do
  begin
    if not IsGreaterThan('������� ��������', FieldByName('pressureDrop').AsFloat, 0, ErrorMessage) then
    begin
      HasError := True;
      if not Assigned(FirstFieldWithError) then
        FirstFieldWithError := FieldByName('pressureDrop');
    end;
  end;

  if HasError then
  begin
    MessageDlg(ErrorMessage, mtWarning, [mbOK], 0);
    FirstFieldWithError.FocusControl;
    Abort();
  end;
end;

procedure TfmMain.qryGasFlowRatesCalcFields(DataSet: TDataSet);
begin
  with qryCounters do
    DataSet.FieldValues['flowRatePercent'] := DataSet.FieldValues['flowRate'] * 100 / FieldValues['maxFlowRate'];
end;

procedure TfmMain.qryGasFlowRatesPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  if E is EDatabaseError then
  begin
    MessageDlg('������ � ������ ����������� ��� ����������!'
      + sLineBreak + '���������� ������ ������ ��������.', mtError, [mbOK], 0);
    Action := daAbort;
  end;
end;

function TfmMain.SelectionOfTheInverter(const ULM, DeltaPdopmin,
  AccuracyClass: Extended): String;
var
  LLM,
  AULM,
  KP            : Extended;
  InverterCount : Integer;
  MinReached    : Boolean;
begin
  MinReached    := False;
  Result        := '';
  InverterCount := 0;
  AULM          := ULM;

  repeat
    LLM       := AccuracyClass * AULM / 0.2;
    KP        := (LLM - DeltaPdopmin) / LLM;

    if MinReached or ((LLM < DeltaPdopmin) and (KP <= 0.75)) then
    begin
      Result := Result + '������������� � �������������� ���������������� �������� �������� �����������.';
      Exit;
    end
    else
    begin
      InverterCount := InverterCount + 1;
      AULM          := GetMaxDefaultValueULM(1.05 * LLM);
      Result        := Result + IntToStr(InverterCount) + ') ��������� '
        + '���������������� �������� �.�. ' + FloatToStrF(AccuracyClass * 100, ffFixed, 10, 2)
        + ' � ������� �������� ��������� ' + FloatToStrF(AULM/1000, ffFixed, 10, 2) + ' ���.' + sLineBreak; // ��������� AULM (���) � ���

      if AULM = 250 then
        MinReached := True;
    end;
  until True;
end;

procedure TfmMain.ShowPageControlTab(TabIndex: Integer);
begin
  if TabIndex in [0..1] then
  begin
    pLeft.Parent                := pcMain.Pages[TabIndex];
    gbCalculationResult.Parent  := pcMain.Pages[TabIndex];
    mCalculationResult.Clear;
    lcbCounterType.SetFocus;
    if TabIndex = 0 then
    begin
      bnCalculate.Caption     := '������� �� �������� ��������';
      bnCalculate.OnClick     := AssessmentMT;
      lP.Caption              := '������� ���. �������� ����, ���    P���.���.';
      ePmin.Visible           := False;
      ePmax.Left              := 3;
      ePmax.Width             := 182;
      lQp.Caption             := '������ ���� � ���. ��������, �3/�   Qp';
      eQpmin.Visible          := False;
      eQpmax.Left             := 3;
      eQpmax.Width            := 182;
      eCurrentDeltaP.Visible  := True;
      lCurrentDeltaP.Visible  := True;
      lULM.Visible            := True;
      cbULM.Visible           := True;
    end
    else
    begin
      bnCalculate.Caption     := '��������� �� �������� ��������';
      bnCalculate.OnClick     := SelectionMT;
      lP.Caption              := '���������� �������� ����, ���     Pmin                       Pmax';
      ePmax.Left              := 97;
      ePmax.Width             := 88;
      ePmin.Visible           := True;
      lQp.Caption             := '������ ���� � ���. ��������, �3/�   Qp.min                    Qp.max';
      eQpmin.Visible          := True;
      eQpmax.Left             := 97;
      eQpmax.Width            := 88;
      eCurrentDeltaP.Visible  := False;
      lCurrentDeltaP.Visible  := False;
      lULM.Visible            := False;
      cbULM.Visible            := False;
    end;
  end;
  { TODO : ������������ ��� ����� � ������������ ������������ }
//  if TabIndex = 2 then
//    if not (InputBox('������� ������', #31'������', '') = '111') then
//    begin
//      pcMain.TabIndex := 0;
//      ShowPageControlTab(0);
//    end;
end;

function TfmMain.VerificateUserInput(CalculationType: String): Boolean;
var
  ErrorMsg            : String;
  FirstFieldWithError : TComponent;
begin
  ErrorMsg    := '';
  FirstFieldWithError := nil;

  if (CalculationType = 'SelectionMT') and not TryStrToGreaterThanOrEqual('����������� ���������� �������� ���� Pmin',
    ePmin.Text, 0, ErrorMsg, FPmin) then
    if not Assigned(FirstFieldWithError) then
      FirstFieldWithError := ePmin;

  if not TryStrToGreaterThanOrEqual('������������ ���������� �������� ���� Pmax',
    ePmax.Text, 0, ErrorMsg, FPmax) then
    if not Assigned(FirstFieldWithError) then
      FirstFieldWithError := ePmax;

  if (CalculationType = 'SelectionMT') and not TryStrToGreaterThanOrEqual('����������� ������ ���� Qp.min',
    eQpmin.Text, 0, ErrorMsg, FQpmin) then
    if not Assigned(FirstFieldWithError) then
      FirstFieldWithError := eQpmin;

  if not TryStrToGreaterThanOrEqual('������������ ������ ���� Qp.max',
    eQpmax.Text, 0, ErrorMsg, FQpmax) then
    if not Assigned(FirstFieldWithError) then
      FirstFieldWithError := eQpmax;

  if not TryStrToGreaterThanOrEqual('���������� ��������� ����������� ����',
    eRs.Text, 0, ErrorMsg, FRs) then
    if not Assigned(FirstFieldWithError) then
      FirstFieldWithError := eRs;

  if (CalculationType = 'AssessmentMT') and not TryStrToGreaterThanOrEqual('������� ������� ��������',
    eCurrentDeltaP.Text, 0, ErrorMsg, FCurrentDeltaP) then
    if not Assigned(FirstFieldWithError) then
      FirstFieldWithError := eRs;

  FAccuracyClass  := StrToFloat(cbAccuracyClass.Items[cbAccuracyClass.ItemIndex]);
  FULM            := StrToInt(cbULM.Items[cbULM.ItemIndex]);

  Result := (ErrorMsg = '');
  if not Result then
  begin
    MessageDlg(ErrorMsg, mtWarning, [mbOK], 0);
    (FirstFieldWithError as TEdit).SetFocus;
    (FirstFieldWithError as TEdit).SelectAll;
  end;
end;

procedure TfmMain.aDeleteRecordCounterExecute(Sender: TObject);
begin
  if MessageDlg('�� ������������� ������ ������� ������� �����?', mtConfirmation,
    mbYesNo, 0) = mrYes then
      qryCounters.Delete;
end;

procedure TfmMain.aDeleteRecordGasFlowRateExecute(Sender: TObject);
begin
  if MessageDlg('�� ������������� ������ ������� ������� ������ � ��������� ��������?',
    mtConfirmation, mbYesNo, 0) = mrYes then
      qryGasFlowRates.Delete;
end;

procedure TfmMain.aSaveEditedGasFlowRateExecute(Sender: TObject);
begin
  if qryGasFlowRates.Modified then
    qryGasFlowRates.Post;
end;

procedure TfmMain.aSaveEditedRecordCounterExecute(Sender: TObject);
begin
  if qryCounters.Modified then
    qryCounters.Post;
end;

procedure TfmMain.AssessmentMT(Sender: TObject);
var
  DeltaPdop,
  DeltaPpmax,
  DeltaPraschmax,
  DeltaPdopmax,
  DifPercent,
  LLM             : Extended;
  idCounter       : Integer;
  DifStr          : String;
begin
  idCounter   := lcbCounterSertificateNumber.KeyValue;

  if not VerificateUserInput('AssessmentMT') then
    Exit;

  with mCalculationResult.Lines do
  begin
    Clear;
    Append('-------------------------');
    Append('� � � � �');
    Append('-------------------------');
    Append('');
    Append('�������� ������');
    Append('-------------------------');
    Append('�������� ���������: ');
    Append('������������ ���������� ��������: ' + FloatToStrF(FPmax, ffFixed, 10, 2) + ' ��.');
    Append('������������ ������ ����: ' + FloatToStrF(FQpmax, ffFixed, 10, 2) + ' �3/�.');
    Append('����� �������� �� �������� ��������: ' + FloatToStrF(FAccuracyClass, ffFixed, 10, 2) + ' %.');
    Append('���������� ��������� ����������� ����: ' + FloatToStrF(FRs, ffFixed, 10, 2) + ' ��/�3.');

    Append('');
    Append('������ �����������');
    Append('-------------------------');

    DeltaPpmax      := GetDeltaPp(idCounter, FQpmax);
    if DeltaPpmax >= 0 then
      Append('������� �������� �� �������� ��� Q�: '
        + FloatToStrF(DeltaPpmax, ffFixed, 10, 2) + ' ��.')
    else if (DeltaPpmax = -1) then
      Append('������� �������� �� �������� ��� Q �.max: '
        + '�������� Q p.max ���� ���������� ���������� ������� ���� ��� ���������� ��')
    else
      Append('������� �������� �� �������� ��� Q �.max: '
        + '�������� Q p.max ���� ����������� ���������� ������� ���� ��� ���������� ��');

    if (DeltaPpmax < 0) then
    begin
      Append('���������� ������ �� ����� ������!!!');
      Exit;
    end;

    DeltaPraschmax  := CalculateDeltaPraschmax(DeltaPpmax, FRs, FPmax);
    DeltaPdopmax    := 1.5 * DeltaPraschmax;
    LLM             := (FAccuracyClass/100) * FULM / 0.2; // FAccuracyClass ��������� �� % � ����

    if (DeltaPdopmax < LLM) then
      DeltaPdop := LLM
    else
      DeltaPdop := DeltaPdopmax;

    DifPercent := (FCurrentDeltaP - DeltaPdop) / DeltaPdop * 100;

    Append('��������� �������� �������� ��������: '
      + FloatToStrF(DeltaPraschmax, ffFixed, 10, 2) + ' ��.');
    Append('���������� �������� �������� ��������: '
      + FloatToStrF(DeltaPdopmax, ffFixed, 10, 2) + ' ��.');
    Append('���: '
      + FloatToStrF(FULM, ffFixed, 10, 2) + ' ��.');
    Append('���: '
      + FloatToStrF(LLM, ffFixed, 10, 2) + ' ��.');
    Append('���������� ������� ��������: '
      + FloatToStrF(DeltaPdop, ffFixed, 10, 2) + ' ��.');
    Append('');
    Append('������');
    Append('-------------------------');
    if DifPercent > 0 then
      DifStr := '��������� ���������� ������� �� '
    else if DifPercent < 0 then
      DifStr := '������ ����������� �������� �� '
    else
      DifStr := '����� ����������� �������� ';
    Append('������� �������� �� �������� ' + DifStr +
      (FloatToStrF(Abs(DifPercent), ffFixed, 10, 2) + ' %.'));

    if (DifPercent <= 20) then
      Append('�������������, ������� ��������������.')
    else if (DifPercent > 20) and (DifPercent <= 50) then
      Append('�������������, ���������� �������� �� ���� ������� ������ ��������, '
        + '�.�. ��������, ��� ����� �� ����� ��������� � ������������ ��� �������.')
    else if (DifPercent > 50) and (DifPercent <= 80) then
      Append('�������������, ���������� �������� ������ ���������� �������� '
        + '�������� �������� �� ���� �������� ��� ������� ������ ������. ���� '
        + '��� ���������� ��������� ��� � ��������� ������� ������ ���������� '
        + '�������� �������� �� ���������� ������ ����������� ��������, ��, '
        + '��������, ��� ��������� ����������� ������� ��������, ������� ����� '
        + '������ ���������������. � ���� ������ ���������� �������� �������������� '
        + '�������� �������� �������� �� �������� ����� ��������� ���������� '
        + '������� (���� - ��� ���). ���� ������� �������� �� �������� �� '
        + '����������, �� ��������� ������� � ������������� ���������� '
        + '������������ ������������ ��� ������� ��������; ���� ������� �������� '
        + '�� �������� �������� � ������� ����������� ��������, �� ������� '
        + '������� ���������������.')
    else
      Append('�������������, ������� �������� �������.');
  end;

  mCalculationResult.SetFocus;
end;

procedure TfmMain.SelectionMT(Sender: TObject);
var
  DeltaPpmin, DeltaPpmax,
  DeltaPraschmin, DeltaPraschmax,
  DeltaPdopmin, DeltaPdopmax,
  LLM, ULM,
  KP                  : Extended;
  idCounter           : Integer;
begin
  idCounter           := lcbCounterSertificateNumber.KeyValue;

  if not VerificateUserInput('SelectionMT') then
    Exit;

  with mCalculationResult.Lines do
  begin
    Clear;
    Append('-------------------------');
    Append('� � � � �');
    Append('-------------------------');
    Append('');
    Append('�������� ������');
    Append('-------------------------');
    Append('�������� ���������: ');
    Append('����������� ���������� ��������: ' + FloatToStrF(FPmin, ffFixed, 10, 2) + ' ��.');
    Append('������������ ���������� ��������: ' + FloatToStrF(FPmax, ffFixed, 10, 2) + ' ��.');
    Append('����������� ������ ����: ' + FloatToStrF(FQpmin, ffFixed, 10, 2) + ' �3/�.');
    Append('������������ ������ ����: ' + FloatToStrF(FQpmax, ffFixed, 10, 2) + ' �3/�.');
    Append('����� �������� �� �������� ��������: ' + FloatToStrF(FAccuracyClass, ffFixed, 10, 2) + ' %.');
    Append('���������� ��������� ����������� ����: ' + FloatToStrF(FRs, ffFixed, 10, 2) + ' ��/�3.');

    Append('');
    Append('������ �����������');
    Append('-------------------------');

    DeltaPpmin      := GetDeltaPp(idCounter, FQpmin);
    if DeltaPpmin >= 0 then
      Append('������� �������� �� �������� ��� Q �.min: '
        + FloatToStrF(DeltaPpmin, ffFixed, 10, 2) + ' ��.')
    else if (DeltaPpmin = -1) then
      Append('������� �������� �� �������� ��� Q �.min: '
        + '�������� Q p.min ���� ���������� ���������� ������� ���� ��� ���������� ��')
    else
      Append('������� �������� �� �������� ��� Q �.min: '
        + '�������� Q p.min ���� ����������� ���������� ������� ���� ��� ���������� ��');

    DeltaPpmax      := GetDeltaPp(idCounter, FQpmax);
    if DeltaPpmax >= 0 then
      Append('������� �������� �� �������� ��� Q �.max: '
        + FloatToStrF(DeltaPpmax, ffFixed, 10, 2) + ' ��.')
    else if (DeltaPpmax = -1) then
      Append('������� �������� �� �������� ��� Q �.max: '
        + '�������� Q p.max ���� ���������� ���������� ������� ���� ��� ���������� ��')
    else
      Append('������� �������� �� �������� ��� Q �.max: '
        + '�������� Q p.max ���� ����������� ���������� ������� ���� ��� ���������� ��');

    if (DeltaPpmin < 0) or (DeltaPpmax < 0) then
    begin
      Append('���������� ������ �� ����� ������!!!');
      Exit;
    end;

    DeltaPraschmin  := CalculateDeltaPraschmin(DeltaPpmin, FRs, FPmin);
    DeltaPraschmax  := CalculateDeltaPraschmax(DeltaPpmax, FRs, FPmax);
    DeltaPdopmin    := 1.5 * DeltaPraschmin;

    if DeltaPdopmin < 5 then
      DeltaPdopmin := 5;

    DeltaPdopmax := 1.5 * DeltaPraschmax;

    ULM := GetMaxDefaultValueULM(DeltaPdopmax);
    LLM := (FAccuracyClass/100) * ULM / 0.2; // FAccuracyClass ��������� �� % � ����
    KP  := ABS((LLM - DeltaPdopmin) / LLM); // ������ ������������

    Append('����������� ��������� �������� �������� ��������: '
      + FloatToStrF(DeltaPraschmin, ffFixed, 10, 2) + ' ��.');
    Append('����������� ���������� �������� �������� ��������: '
      + FloatToStrF(DeltaPdopmin, ffFixed, 10, 2) + ' ��.');
    Append('������������ ��������� �������� �������� ��������: '
      + FloatToStrF(DeltaPraschmax, ffFixed, 10, 2) + ' ��.');
    Append('������������ ���������� �������� �������� ��������: '
      + FloatToStrF(DeltaPdopmax, ffFixed, 10, 2) + ' ��.');
    Append('���1: '
      + FloatToStrF(ULM, ffFixed, 10, 2) + ' ��.');
    Append('���1: '
      + FloatToStrF(LLM, ffFixed, 10, 2) + ' ��.');
    Append('����������� ���������� ��: '
      + FloatToStrF(KP, ffFixed, 10, 2) + '.');

    Append('');
    Append('������');
    Append('-------------------------');
    Append(SelectionOfTheInverter(ULM, DeltaPdopmin, FAccuracyClass/100)); // FAccuracyClass ��������� �� % � ����
  end;

  mCalculationResult.SetFocus;
end;

function TfmMain.CalculateDeltaPraschmax(const DeltaPpmax: Extended;
  const Rs: Extended; const Pmax: Extended): Extended;
begin
  Result  := DeltaPpmax * ((Rs * Pmax) / (Rsr * Pp));
end;

function TfmMain.CalculateDeltaPraschmin(const DeltaPpmin: Extended;
  const Rs: Extended; const Pmin: Extended): Extended;
begin
  Result  := DeltaPpmin * ((Rs * Pmin) / (Rsr * Pp));
end;

procedure TfmMain.OnKeyPressFloat(Sender: TObject; var Key: Char);
begin
  SMB.Validators.KeyPressFloat(Key);
end;
procedure TfmMain.pcMainChange(Sender: TObject);
begin
  ShowPageControlTab(pcMain.TabIndex);
end;
end.
