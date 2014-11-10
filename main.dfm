object fmMain: TfmMain
  Left = 0
  Top = 0
  Caption = 
    #1054#1094#1077#1085#1082#1072' '#1090#1077#1093'. '#1089#1086#1089#1090#1086#1103#1085#1080#1103' '#1087#1088#1080#1073#1086#1088#1072' '#1091#1095#1077#1090#1072' '#1080' '#1087#1086#1076#1073#1086#1088' '#1057#1048' '#1087#1077#1088#1077#1087#1072#1076#1072' '#1076#1072#1074#1083#1077#1085#1080 +
    #1103
  ClientHeight = 612
  ClientWidth = 734
  Color = clBtnFace
  Constraints.MinHeight = 650
  Constraints.MinWidth = 750
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pcMain: TPageControl
    Left = 0
    Top = 0
    Width = 734
    Height = 612
    ActivePage = tsReferencesData
    Align = alClient
    TabOrder = 0
    OnChange = pcMainChange
    object tsAssessmentMeasurementTools: TTabSheet
      Caption = #1054#1094#1077#1085#1082#1072' '#1089#1086#1089#1090#1086#1103#1085#1080#1103' '#1057#1048
      object pLeft: TPanel
        Left = 0
        Top = 0
        Width = 195
        Height = 584
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object gbxCounter: TGroupBox
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 189
          Height = 217
          Align = alTop
          Caption = #1055#1088#1080#1073#1086#1088' '#1091#1095#1077#1090#1072
          TabOrder = 0
          object lCounterDu: TLabel
            Left = 3
            Top = 139
            Width = 166
            Height = 13
            Caption = #1044#1080#1072#1084#1077#1090#1088' '#1091#1089#1083#1086#1074#1085#1086#1075#1086' '#1087#1088#1086#1093#1086#1076#1072', '#1044#1091
          end
          object lCounterSertificateNumber: TLabel
            Left = 3
            Top = 177
            Width = 101
            Height = 13
            Caption = #1053#1086#1084#1077#1088' '#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090#1072
          end
          object lCounterG: TLabel
            Left = 3
            Top = 99
            Width = 59
            Height = 13
            Caption = #1058#1080#1087#1086#1088#1072#1079#1084#1077#1088
          end
          object lCounter: TLabel
            Left = 3
            Top = 18
            Width = 18
            Height = 13
            Caption = #1058#1080#1087
            WordWrap = True
          end
          object lCounterName: TLabel
            Left = 3
            Top = 59
            Width = 39
            Height = 13
            Caption = #1052#1086#1076#1077#1083#1100
          end
          object lcbCounterDu: TDBLookupComboBox
            Left = 3
            Top = 152
            Width = 182
            Height = 21
            TabOrder = 3
            OnExit = lcbCounterDuExit
          end
          object lcbCounterSertificateNumber: TDBLookupComboBox
            Left = 3
            Top = 190
            Width = 182
            Height = 21
            TabOrder = 4
          end
          object lcbCounterType: TDBLookupComboBox
            Left = 3
            Top = 32
            Width = 182
            Height = 21
            TabOrder = 0
            OnExit = lcbCounterTypeExit
          end
          object lcbCounterG: TDBLookupComboBox
            Left = 3
            Top = 112
            Width = 182
            Height = 21
            TabOrder = 2
            OnExit = lcbCounterGExit
          end
          object lcbCounterName: TDBLookupComboBox
            Left = 3
            Top = 72
            Width = 182
            Height = 21
            TabOrder = 1
            OnExit = lcbCounterNameExit
          end
        end
        object gbxOperatingConditions: TGroupBox
          AlignWithMargins = True
          Left = 3
          Top = 226
          Width = 189
          Height = 303
          Align = alTop
          Caption = #1059#1089#1083#1086#1074#1080#1103' '#1101#1082#1089#1087#1083#1091#1072#1090#1072#1094#1080#1080
          TabOrder = 1
          object lP: TLabel
            Left = 3
            Top = 14
            Width = 180
            Height = 28
            AutoSize = False
            Caption = 
              #1040#1073#1089#1086#1083#1102#1090#1085#1086#1077' '#1076#1072#1074#1083#1077#1085#1080#1077' '#1075#1072#1079#1072', '#1052#1055#1072'     Pmin                       Pma' +
              'x'
            WordWrap = True
          end
          object lQp: TLabel
            Left = 3
            Top = 67
            Width = 181
            Height = 26
            AutoSize = False
            Caption = 
              #1056#1072#1089#1093#1086#1076' '#1075#1072#1079#1072' '#1074' '#1088#1072#1073'. '#1091#1089#1083#1086#1074#1080#1103#1093', '#1084'3/'#1095'   Qp.min                    Qp' +
              '.max'
            WordWrap = True
          end
          object lAccuracyClass: TLabel
            Left = 3
            Top = 123
            Width = 182
            Height = 13
            AutoSize = False
            Caption = #1050#1083#1072#1089#1089' '#1090#1086#1095#1085#1086#1089#1090#1080' '#1057#1048' '#1087#1077#1088#1077#1087'. '#1076#1072#1074#1083'. '
            WordWrap = True
          end
          object lRs: TLabel
            Left = 3
            Top = 162
            Width = 182
            Height = 31
            AutoSize = False
            Caption = #1040#1073#1089#1086#1083#1102#1090#1085#1072#1103' '#1087#1083#1086#1090#1085#1086#1089#1090#1100' '#1080#1079#1084#1077#1088#1103#1077#1084#1086#1075#1086' '#1075#1072#1079#1072', '#1082#1075'/'#1084'3'
            WordWrap = True
          end
          object lCurrentDeltaP: TLabel
            Left = 3
            Top = 215
            Width = 182
            Height = 19
            AutoSize = False
            Caption = #1058#1077#1082#1091#1097#1080#1081' '#1087#1077#1088#1077#1087#1072#1076' '#1076#1072#1074#1083#1077#1085#1080#1103' '#1057#1048', '#1055#1072
            WordWrap = True
          end
          object lULM: TLabel
            Left = 3
            Top = 258
            Width = 182
            Height = 19
            AutoSize = False
            Caption = #1042#1055#1048' '#1057#1048' '#1087#1077#1088#1077#1087#1072#1076#1072' '#1076#1072#1074#1083#1077#1085#1080#1103
            WordWrap = True
          end
          object ePmin: TEdit
            Left = 3
            Top = 40
            Width = 87
            Height = 21
            TabOrder = 0
            Text = '0'
            OnKeyPress = OnKeyPressFloat
          end
          object eQpmin: TEdit
            Left = 3
            Top = 94
            Width = 87
            Height = 21
            TabOrder = 2
            Text = '0'
            OnKeyPress = OnKeyPressFloat
          end
          object eQpmax: TEdit
            Left = 96
            Top = 94
            Width = 89
            Height = 21
            TabOrder = 3
            Text = '0'
            OnKeyPress = OnKeyPressFloat
          end
          object ePmax: TEdit
            Left = 96
            Top = 40
            Width = 89
            Height = 21
            TabOrder = 1
            Text = '0'
            OnKeyPress = OnKeyPressFloat
          end
          object eRs: TEdit
            Left = 3
            Top = 189
            Width = 182
            Height = 21
            TabOrder = 5
            Text = '0'
            OnKeyPress = OnKeyPressFloat
          end
          object eCurrentDeltaP: TEdit
            Left = 3
            Top = 229
            Width = 182
            Height = 21
            TabOrder = 6
            Text = '0'
            OnKeyPress = OnKeyPressFloat
          end
          object cbULM: TComboBox
            Left = 3
            Top = 271
            Width = 182
            Height = 22
            Style = csOwnerDrawFixed
            Ctl3D = True
            ParentCtl3D = False
            TabOrder = 7
          end
          object cbAccuracyClass: TComboBox
            Left = 3
            Top = 136
            Width = 182
            Height = 22
            Style = csOwnerDrawFixed
            Ctl3D = True
            ParentCtl3D = False
            TabOrder = 4
          end
        end
        object bnCalculate: TButton
          AlignWithMargins = True
          Left = 3
          Top = 530
          Width = 189
          Height = 51
          Align = alBottom
          Caption = #1054#1094#1077#1085#1080#1090#1100' '#1057#1048' '#1087#1077#1088#1077#1087#1072#1076#1072' '#1076#1072#1074#1083#1077#1085#1080#1103
          Default = True
          TabOrder = 2
          WordWrap = True
          OnClick = AssessmentMT
        end
      end
      object gbCalculationResult: TGroupBox
        AlignWithMargins = True
        Left = 198
        Top = 3
        Width = 525
        Height = 578
        Align = alClient
        Caption = #1056#1072#1089#1095#1077#1090#1099
        TabOrder = 1
        object mCalculationResult: TMemo
          AlignWithMargins = True
          Left = 5
          Top = 18
          Width = 515
          Height = 555
          Align = alClient
          BevelEdges = []
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Lines.Strings = (
            '')
          ParentColor = True
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
    end
    object tsSelectionMeasurementTool: TTabSheet
      Caption = #1055#1086#1076#1073#1086#1088' '#1057#1048' '#1087#1077#1088#1077#1087#1072#1076#1072' '#1076#1072#1074#1083#1077#1085#1080#1103
      ImageIndex = 1
    end
    object tsReferencesData: TTabSheet
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1099#1077' '#1076#1072#1085#1085#1099#1077
      ImageIndex = 2
      object EvalutionOfTechConditionPanel: TPanel
        Left = 0
        Top = 0
        Width = 726
        Height = 584
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object LeftPanel: TPanel
          Left = 0
          Top = 0
          Width = 425
          Height = 584
          Align = alLeft
          BevelOuter = bvNone
          Caption = 'LeftPanel'
          TabOrder = 0
          object lCounters: TLabel
            AlignWithMargins = True
            Left = 5
            Top = 5
            Width = 420
            Height = 20
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alTop
            Caption = #1052#1072#1088#1082#1080' '#1087#1088#1080#1073#1086#1088#1086#1074' '#1091#1095#1077#1090#1072
            Constraints.MinHeight = 20
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ExplicitWidth = 116
          end
          object grdCounters: TDBGrid
            Left = 0
            Top = 25
            Width = 425
            Height = 534
            Align = alClient
            Ctl3D = True
            DataSource = dsCounters
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ParentCtl3D = False
            ParentFont = False
            PopupMenu = pmCounters
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
          end
          object pButtonsRDCounters: TPanel
            Left = 0
            Top = 559
            Width = 425
            Height = 25
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 1
            object bnSaveCounterRecord: TButton
              Left = 350
              Top = 0
              Width = 75
              Height = 25
              Action = aSaveEditedRecordCounter
              Align = alRight
              TabOrder = 0
            end
            object bnAddNewCounterRecord: TButton
              Left = 0
              Top = 0
              Width = 75
              Height = 25
              Action = aCreateNewRecordCounter
              Align = alLeft
              TabOrder = 1
            end
            object bnDeleteCounterRecord: TButton
              Left = 75
              Top = 0
              Width = 75
              Height = 25
              Action = aDeleteRecordCounter
              Align = alLeft
              TabOrder = 2
            end
          end
        end
        object RightPanel: TPanel
          AlignWithMargins = True
          Left = 428
          Top = 0
          Width = 298
          Height = 584
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object lGasFlowRates: TLabel
            AlignWithMargins = True
            Left = 5
            Top = 5
            Width = 293
            Height = 20
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alTop
            Caption = #1055#1077#1088#1077#1087#1072#1076#1099' '#1076#1072#1074#1083#1077#1085#1080#1103' '#1074' '#1079#1072#1074#1080#1089#1080#1084#1086#1089#1090#1080' '#1086#1090' '#1088#1072#1089#1093#1086#1076#1072' '#1075#1072#1079#1072
            Constraints.MinHeight = 20
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ExplicitWidth = 264
          end
          object grdGasFlowRates: TDBGrid
            Left = 0
            Top = 25
            Width = 298
            Height = 534
            Align = alClient
            DataSource = dsGasFlowRates
            PopupMenu = pmGasFlowRates
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnKeyPress = OnKeyPressFloat
            Columns = <
              item
                Expanded = False
                FieldName = 'flowRatePercent'
                ReadOnly = True
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'flowRate'
                ReadOnly = True
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'pressureDrop'
                Visible = True
              end>
          end
          object pButtonsRDGasFlowRate: TPanel
            Left = 0
            Top = 559
            Width = 298
            Height = 25
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 1
            object bnSaveGasFlowRateRecord: TButton
              Left = 223
              Top = 0
              Width = 75
              Height = 25
              Action = aSaveEditedGasFlowRate
              Align = alRight
              TabOrder = 0
            end
          end
        end
      end
    end
  end
  object mainConnection: TADOConnection
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    AfterConnect = mainConnectionAfterConnect
    Left = 544
    Top = 400
  end
  object qryCounters: TADOQuery
    Connection = mainConnection
    CursorType = ctStatic
    AfterInsert = qryCountersAfterInsert
    AfterEdit = qryCountersAfterEdit
    BeforePost = qryCountersBeforePost
    AfterPost = qryCountersAfterPost
    OnPostError = qryCountersPostError
    Parameters = <>
    SQL.Strings = (
      'select'
      '  c.idCounter,'
      '  c.counterName,'
      '  c.typeName,'
      '  c.G,'
      '  c.Du,'
      '  c.SertificateNumber,'
      
        '  (select min(g.FlowRate) from GasFlowRates g where g.idCounter ' +
        '= c.idCounter) as minFlowRate,'
      
        '  (select max(g.FlowRate) from GasFlowRates g where g.idCounter ' +
        '= c.idCounter) as maxFlowRate'
      'from Counters c'
      
        'order by typeName asc, counterName asc, G asc, Du asc, Sertifica' +
        'teNumber asc')
    Left = 456
    Top = 408
    object qryCountersidCounter: TAutoIncField
      AutoGenerateValue = arAutoInc
      DisplayLabel = #1050#1086#1076
      FieldName = 'idCounter'
      ReadOnly = True
      Visible = False
    end
    object qryCounterstypeName: TWideStringField
      DisplayWidth = 12
      FieldName = 'typeName'
      Visible = False
      Size = 25
    end
    object qryCounterstypeNameLookUp: TStringField
      DisplayLabel = #1058#1080#1087
      DisplayWidth = 12
      FieldKind = fkLookup
      FieldName = 'typeNameLookUp'
      LookupDataSet = qryCounterTypes
      LookupKeyFields = 'typeName'
      LookupResultField = 'typeName'
      KeyFields = 'typeName'
      Lookup = True
    end
    object qryCounterscounterName: TWideStringField
      DisplayLabel = #1052#1086#1076#1077#1083#1100
      DisplayWidth = 17
      FieldName = 'counterName'
      Size = 50
    end
    object qryCountersG: TSmallintField
      DisplayLabel = #1058#1080#1087#1086#1088#1072#1079#1084#1077#1088
      DisplayWidth = 5
      FieldName = 'G'
    end
    object qryCountersDu: TSmallintField
      DisplayLabel = #1044#1091
      DisplayWidth = 5
      FieldName = 'Du'
    end
    object qryCountersSertificateNumber: TWideStringField
      DisplayLabel = #8470' '#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090#1072
      DisplayWidth = 15
      FieldName = 'SertificateNumber'
    end
    object qryCountersminFlowRate: TBCDField
      FieldName = 'minFlowRate'
      Visible = False
      Precision = 19
    end
    object qryCountersmaxFlowRate: TBCDField
      FieldName = 'maxFlowRate'
      Visible = False
      Precision = 19
    end
  end
  object dsCounters: TDataSource
    DataSet = qryCounters
    Left = 456
    Top = 352
  end
  object dsGasFlowRates: TDataSource
    DataSet = qryGasFlowRates
    Left = 600
    Top = 288
  end
  object qryGasFlowRates: TADOQuery
    Connection = mainConnection
    CursorType = ctStatic
    BeforeInsert = qryGasFlowRatesBeforeInsert
    BeforePost = qryGasFlowRatesBeforePost
    OnCalcFields = qryGasFlowRatesCalcFields
    OnPostError = qryGasFlowRatesPostError
    DataSource = dsCounters
    Parameters = <
      item
        Name = 'idCounter'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 255
        Precision = 255
        Value = 147
      end>
    SQL.Strings = (
      'select idCounter, flowRate, pressureDrop'
      'from GasFlowRates'
      'where idCounter = :idCounter'
      'order by flowRate asc')
    Left = 600
    Top = 240
    object qryGasFlowRatesidCounter: TIntegerField
      FieldName = 'idCounter'
      Visible = False
    end
    object qryGasFlowRatesflowRatePercent: TFloatField
      DisplayLabel = #1056#1072#1089#1093'. '#1075#1072#1079#1072', %'
      FieldKind = fkCalculated
      FieldName = 'flowRatePercent'
      DisplayFormat = '0.0 %'
      Calculated = True
    end
    object qryGasFlowRatesflowRate: TBCDField
      DisplayLabel = #1056#1072#1089#1093'. '#1075#1072#1079#1072', '#1084'3/'#1095
      DisplayWidth = 10
      FieldName = 'flowRate'
      DisplayFormat = '0.0'
      Precision = 19
    end
    object qryGasFlowRatespressureDrop: TBCDField
      DisplayLabel = #1055#1077#1088#1077#1087#1072#1076' '#1076#1072#1074#1083'., '#1055#1072
      DisplayWidth = 15
      FieldName = 'pressureDrop'
      DisplayFormat = '0.00'
      Precision = 19
    end
  end
  object ActionList: TActionList
    Left = 600
    Top = 448
    object aCreateNewRecordCounter: TAction
      Category = 'ReferenceData'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ShortCut = 45
      OnExecute = aCreateNewRecordCounterExecute
    end
    object aDeleteRecordCounter: TAction
      Category = 'ReferenceData'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ShortCut = 8238
      OnExecute = aDeleteRecordCounterExecute
    end
    object aSaveEditedRecordCounter: TAction
      Category = 'ReferenceData'
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ShortCut = 16467
      OnExecute = aSaveEditedRecordCounterExecute
    end
    object aSaveEditedGasFlowRate: TAction
      Category = 'ReferenceData'
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ShortCut = 16467
      OnExecute = aSaveEditedGasFlowRateExecute
    end
  end
  object odOpenDB: TOpenDialog
    DefaultExt = 'mdb'
    Filter = #1041#1072#1079#1099' '#1076#1072#1085#1085#1099#1093' Microsoft Access|*.mdb'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = #1059#1082#1072#1078#1080#1090#1077' '#1087#1091#1090#1100' '#1082' '#1073#1072#1079#1077
    Left = 544
    Top = 448
  end
  object pmCounters: TPopupMenu
    Left = 600
    Top = 360
    object pmiAddCounterRecord: TMenuItem
      Action = aCreateNewRecordCounter
    end
    object pmiDeleteCounterRecord: TMenuItem
      Action = aDeleteRecordCounter
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object pmiSaveCounterRecord: TMenuItem
      Action = aSaveEditedRecordCounter
    end
  end
  object pmGasFlowRates: TPopupMenu
    Left = 600
    Top = 400
    object pmiSaveGasFlowRateRecord: TMenuItem
      Action = aSaveEditedGasFlowRate
    end
  end
  object qryCounterTypes: TADOQuery
    Connection = mainConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select typeName'
      'from CounterTypes'
      'order by typeName asc')
    Left = 456
    Top = 456
    object qryCounterTypestypeName: TWideStringField
      FieldName = 'typeName'
      Size = 25
    end
  end
  object dsCounterTypes: TDataSource
    DataSet = qryCounterTypes
    Left = 456
    Top = 296
  end
end
