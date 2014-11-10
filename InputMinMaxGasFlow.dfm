object fmInputMinMaxGasFlowValue: TfmInputMinMaxGasFlowValue
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1042#1074#1077#1076#1080#1090#1077' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1057#1048
  ClientHeight = 154
  ClientWidth = 153
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object leMin: TSMBLabeledEdit
    Left = 8
    Top = 16
    Width = 137
    Height = 21
    EditLabel.Width = 88
    EditLabel.Height = 13
    EditLabel.Caption = #1052#1080#1085'. '#1088#1072#1089#1093#1086#1076' '#1075#1072#1079#1072
    TabOrder = 0
    Text = '10'
    FilterInput = True
    ValueType = vtFloat
    Value = 10.000000000000000000
    ValueConstraint = vctGreaterThan
    Caption = #1052#1080#1085'. '#1088#1072#1089#1093#1086#1076' '#1075#1072#1079#1072
  end
  object leMax: TSMBLabeledEdit
    Left = 8
    Top = 56
    Width = 137
    Height = 21
    EditLabel.Width = 93
    EditLabel.Height = 13
    EditLabel.Caption = #1052#1072#1082#1089'. '#1088#1072#1089#1093#1086#1076' '#1075#1072#1079#1072
    TabOrder = 1
    Text = '20'
    FilterInput = True
    ValueType = vtFloat
    Value = 20.000000000000000000
    ValueConstraint = vctGreaterThan
    Caption = #1052#1072#1082#1089'. '#1088#1072#1089#1093#1086#1076' '#1075#1072#1079#1072
  end
  object leStringAmount: TSMBLabeledEdit
    Left = 8
    Top = 96
    Width = 137
    Height = 21
    EditLabel.Width = 92
    EditLabel.Height = 13
    EditLabel.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1089#1090#1088#1086#1082
    TabOrder = 2
    Text = '20'
    FilterInput = True
    ValueType = vtInteger
    Value = 20
    Min = 10.000000000000000000
    Max = 30.000000000000000000
    ValueConstraint = vctBetweenOrEqual
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1089#1090#1088#1086#1082
  end
  object bnOK: TButton
    Left = 8
    Top = 123
    Width = 137
    Height = 25
    Caption = #1054#1050
    Default = True
    TabOrder = 3
    OnClick = bnOKClick
  end
end
