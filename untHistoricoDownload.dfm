object frmHistoricoDownload: TfrmHistoricoDownload
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Hist'#243'rico de Downloads'
  ClientHeight = 381
  ClientWidth = 763
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 763
    Height = 381
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 5
    TabOrder = 0
    object Panel2: TPanel
      Left = 5
      Top = 341
      Width = 753
      Height = 35
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitLeft = 0
      ExplicitTop = 346
      ExplicitWidth = 763
      DesignSize = (
        753
        35)
      object btnOk: TButton
        Left = 676
        Top = 6
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Fechar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = btnOkClick
      end
    end
    object DBGrid1: TDBGrid
      Left = 5
      Top = 40
      Width = 753
      Height = 301
      Align = alClient
      DataSource = dsLOGDOWLOAD
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgTitleClick, dgTitleHotTrack]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'URL'
          Width = 496
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATAINICIO'
          Title.Caption = 'Data In'#237'cio'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATAFIM'
          Title.Caption = 'Data Fim'
          Width = 100
          Visible = True
        end>
    end
    object Panel3: TPanel
      Left = 5
      Top = 5
      Width = 753
      Height = 35
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      ExplicitLeft = 0
      ExplicitTop = 346
      ExplicitWidth = 763
      object Label1: TLabel
        Left = 0
        Top = 5
        Width = 210
        Height = 24
        Caption = 'Hist'#243'rico de Downloads'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
    end
  end
  object FDQueryLOGDOWNLOAD: TFDQuery
    Connection = DataModule1.FDConnectionDownload
    SQL.Strings = (
      
        'select CODIGO,URL,cast(DATAINICIO as varchar(50)) as DATAINICIO ' +
        ','
      'cast(DATAFIM as vaschar(50)) as DATAFIM '
      'from LOGDOWNLOAD'
      'order by CODIGO, DATAINICIO,DATAFIM')
    Left = 396
    Top = 156
    object FDQueryLOGDOWNLOADCODIGO: TFMTBCDField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Precision = 22
      Size = 0
    end
    object FDQueryLOGDOWNLOADURL: TStringField
      FieldName = 'URL'
      Origin = 'URL'
      Required = True
      Size = 600
    end
    object FDQueryLOGDOWNLOADDATAINICIO: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'DATAINICIO'
      Origin = 'DATAINICIO'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
    object FDQueryLOGDOWNLOADDATAFIM: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'DATAFIM'
      Origin = 'DATAFIM'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
  end
  object dsLOGDOWLOAD: TDataSource
    DataSet = FDQueryLOGDOWNLOAD
    Left = 512
    Top = 160
  end
end
