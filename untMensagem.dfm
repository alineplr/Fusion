object frmMensagem: TfrmMensagem
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'frmMensagem'
  ClientHeight = 129
  ClientWidth = 348
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 348
    Height = 129
    Align = alClient
    BevelOuter = bvNone
    Color = clMedGray
    ParentBackground = False
    TabOrder = 0
    ExplicitLeft = 216
    ExplicitTop = 24
    ExplicitWidth = 185
    ExplicitHeight = 41
    DesignSize = (
      348
      129)
    object lblPorcentagem: TLabel
      Left = 44
      Top = 66
      Width = 138
      Height = 24
      Alignment = taCenter
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = 'lblPorcentagem'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Panel2: TPanel
      Left = 0
      Top = 88
      Width = 348
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitLeft = -8
      ExplicitTop = 44
      ExplicitWidth = 342
      DesignSize = (
        348
        41)
      object btnOk: TButton
        Left = 258
        Top = 8
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'OK'
        TabOrder = 0
        OnClick = btnOkClick
        ExplicitLeft = 476
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 348
      Height = 40
      Align = alTop
      BevelOuter = bvNone
      Color = clSilver
      ParentBackground = False
      TabOrder = 1
      ExplicitTop = 8
      object Image1: TImage
        Left = 8
        Top = 6
        Width = 28
        Height = 28
        Picture.Data = {
          0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000020
          00000020080300000044A48AC60000000373424954080808DBE14FE000000009
          70485973000008DC000008DC019FE85F3C0000001974455874536F6674776172
          65007777772E696E6B73636170652E6F72679BEE3C1A0000005D504C5445FFFF
          FFFFDB49DFBF40EACA4AEBCC47EECC4AEECE49F0CF49F0CE4AEECE4AEFCE4AEE
          CF4AEFCE4AEFCE4AEFCD4AEFCE4BEFCE4AEFCE4AEFCE4BEFCF4EF0D154F3DA75
          F3DB79F6E59EF7E6A1F8E9B0F8EAB1F8EBB4F9EBB7F9EDBBF9EDBCF750B31F00
          00001174524E5300070818192D49849798C1C8DAE3F2F3F5D5A8315B000000BD
          4944415438CB8D93D91683200C4407453611486BF7D6FFFF4C1FDA63592A74DE
          38B984904C804D4C6863BDB7460B86525C39DAE414CFC29D0C9428C82E8EF723
          151AFB6F7C98E887A661BB1FC5E739223E39BA38FFF311BFF2AE43C67997253E
          4900E0611F081C80A27D8014C05C0D700C826A0009E83AA061EA8081AD0316BE
          0EF836D07CA25964F39B59A36EF7BC5159AB0FC7BCD5D9B032A962DCD74B31EE
          D430AFD230A9E54EE7D2728969135BF7FFDABEBD38EDD56B2FEFFEFAAFB1FA36
          79BB1413740000000049454E44AE426082}
        Stretch = True
      end
      object cxLabel1: TcxLabel
        Left = 44
        Top = 8
        Caption = 'Mensagem !'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -16
        Style.Font.Name = 'Segoe UI Light'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
      end
    end
  end
  object Timer1: TTimer
    Interval = 1
    OnTimer = Timer1Timer
    Left = 88
    Top = 56
  end
end
