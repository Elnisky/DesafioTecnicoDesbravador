object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 
    'LEANDRO ELNISKY - AVALIA'#199#195'O T'#201'CNICA - PROCESSO SELETIVO '#8211' DESBRA' +
    'VADOR'
  ClientHeight = 603
  ClientWidth = 967
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  TextHeight = 15
  object grdVendas: TDBGrid
    Left = 0
    Top = 90
    Width = 967
    Height = 462
    Align = alClient
    BorderStyle = bsNone
    DataSource = dsCadastro
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object pnlToolbar: TPanel
    Left = 0
    Top = 0
    Width = 967
    Height = 90
    Align = alTop
    BevelOuter = bvNone
    Color = clMediumseagreen
    Padding.Left = 5
    Padding.Top = 10
    Padding.Right = 5
    Padding.Bottom = 10
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = -6
    ExplicitWidth = 911
    object pnlAtualizar: TPanel
      AlignWithMargins = True
      Left = 179
      Top = 10
      Width = 169
      Height = 70
      Margins.Left = 5
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      BevelOuter = bvNone
      DoubleBuffered = False
      ParentColor = True
      ParentDoubleBuffered = False
      TabOrder = 0
      object shpAtualizar: TShape
        Left = 0
        Top = 0
        Width = 169
        Height = 70
        Align = alClient
        Brush.Color = 14342621
        Pen.Style = psClear
        Shape = stRoundRect
        ExplicitTop = 6
        ExplicitWidth = 175
      end
      object btnAtualizar: TSpeedButton
        Left = 0
        Top = 0
        Width = 169
        Height = 70
        Align = alClient
        Caption = 'Atualizar cadastro'
        Flat = True
        OnClick = btnIncluirClick
        ExplicitLeft = 64
        ExplicitTop = -4
      end
    end
    object pnlIncluir: TPanel
      Left = 5
      Top = 10
      Width = 169
      Height = 70
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      BevelOuter = bvNone
      DoubleBuffered = False
      ParentColor = True
      ParentDoubleBuffered = False
      TabOrder = 1
      object shpIncluir: TShape
        Left = 0
        Top = 0
        Width = 169
        Height = 70
        Align = alClient
        Brush.Color = 14342621
        Pen.Style = psClear
        Shape = stRoundRect
        ExplicitTop = 6
        ExplicitWidth = 175
      end
      object btnIncluir: TSpeedButton
        Left = 0
        Top = 0
        Width = 169
        Height = 70
        Align = alClient
        Caption = 'Incluir'
        Flat = True
        OnClick = btnIncluirClick
        ExplicitLeft = -1
        ExplicitTop = 4
      end
    end
    object pnlExcluir: TPanel
      AlignWithMargins = True
      Left = 353
      Top = 10
      Width = 169
      Height = 70
      Margins.Left = 5
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      BevelOuter = bvNone
      DoubleBuffered = False
      ParentColor = True
      ParentDoubleBuffered = False
      TabOrder = 2
      object shpExcluir: TShape
        Left = 0
        Top = 0
        Width = 169
        Height = 70
        Align = alClient
        Brush.Color = 14342621
        Pen.Style = psClear
        Shape = stRoundRect
        ExplicitTop = 6
        ExplicitWidth = 175
      end
      object btnExcluir: TSpeedButton
        Left = 0
        Top = 0
        Width = 169
        Height = 70
        Align = alClient
        Caption = 'Excluir'
        Flat = True
        OnClick = btnExcluirClick
        ExplicitLeft = 64
        ExplicitTop = -4
      end
    end
    object pnlAtualizarEnderecos: TPanel
      AlignWithMargins = True
      Left = 527
      Top = 10
      Width = 169
      Height = 70
      Margins.Left = 5
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      BevelOuter = bvNone
      DoubleBuffered = False
      ParentColor = True
      ParentDoubleBuffered = False
      TabOrder = 3
      ExplicitLeft = 353
      object shpAtualizarEnderecos: TShape
        Left = 0
        Top = 0
        Width = 169
        Height = 70
        Align = alClient
        Brush.Color = 14342621
        Pen.Style = psClear
        Shape = stRoundRect
        ExplicitTop = 6
        ExplicitWidth = 175
      end
      object btnAtualizarEnderecos: TSpeedButton
        Left = 0
        Top = 0
        Width = 169
        Height = 70
        Align = alClient
        Caption = 'Atualizar Endere'#231'os'
        Flat = True
        OnClick = btnAtualizarEnderecosClick
        ExplicitLeft = 64
        ExplicitTop = -4
      end
    end
    object pnlImportarMassa: TPanel
      AlignWithMargins = True
      Left = 701
      Top = 10
      Width = 169
      Height = 70
      Margins.Left = 5
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      BevelOuter = bvNone
      DoubleBuffered = False
      ParentColor = True
      ParentDoubleBuffered = False
      TabOrder = 4
      ExplicitLeft = 353
      object shpImportarMassa: TShape
        Left = 0
        Top = 0
        Width = 169
        Height = 70
        Align = alClient
        Brush.Color = 14342621
        Pen.Style = psClear
        Shape = stRoundRect
        ExplicitTop = 6
        ExplicitWidth = 175
      end
      object btnImportarMassa: TSpeedButton
        Left = 0
        Top = 0
        Width = 169
        Height = 70
        Align = alClient
        Caption = 'Importar em massa'
        Flat = True
        OnClick = btnImportarMassaClick
        ExplicitLeft = 64
        ExplicitTop = -4
      end
    end
  end
  object pnlPaginacao: TPanel
    Left = 0
    Top = 552
    Width = 967
    Height = 51
    Align = alBottom
    BevelOuter = bvNone
    Color = clMediumseagreen
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    Padding.Left = 5
    Padding.Top = 10
    Padding.Right = 5
    Padding.Bottom = 10
    ParentBackground = False
    ParentFont = False
    TabOrder = 2
    ExplicitWidth = 911
    object pnlPagAnterior: TPanel
      AlignWithMargins = True
      Left = 94
      Top = 10
      Width = 84
      Height = 31
      Margins.Left = 5
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      BevelOuter = bvNone
      DoubleBuffered = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = True
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 0
      ExplicitLeft = 5
      object shpAnterior: TShape
        Left = 0
        Top = 0
        Width = 84
        Height = 31
        Align = alClient
        Brush.Color = 14342621
        Pen.Style = psClear
        Shape = stRoundRect
        ExplicitTop = 6
        ExplicitWidth = 175
        ExplicitHeight = 70
      end
      object btnAnterior: TSpeedButton
        Left = 0
        Top = 0
        Width = 84
        Height = 31
        Align = alClient
        Caption = '< Anterior'
        Flat = True
        OnClick = btnPrimeiraClick
        ExplicitLeft = -1
        ExplicitTop = 4
        ExplicitWidth = 169
        ExplicitHeight = 70
      end
    end
    object pnlPagProxima: TPanel
      AlignWithMargins = True
      Left = 789
      Top = 10
      Width = 84
      Height = 31
      Margins.Left = 5
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alRight
      BevelOuter = bvNone
      DoubleBuffered = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = True
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 1
      ExplicitLeft = 822
      object shpProxima: TShape
        Left = 0
        Top = 0
        Width = 84
        Height = 31
        Align = alClient
        Brush.Color = 14342621
        Pen.Style = psClear
        Shape = stRoundRect
        ExplicitTop = 6
        ExplicitWidth = 175
        ExplicitHeight = 70
      end
      object btnProxima: TSpeedButton
        Left = 0
        Top = 0
        Width = 84
        Height = 31
        Align = alClient
        Caption = 'Pr'#243'xima >'
        Flat = True
        OnClick = btnPrimeiraClick
        ExplicitLeft = 64
        ExplicitTop = -4
        ExplicitWidth = 169
        ExplicitHeight = 70
      end
    end
    object pnlPagPrimeira: TPanel
      Left = 5
      Top = 10
      Width = 84
      Height = 31
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      BevelOuter = bvNone
      DoubleBuffered = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = True
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 2
      ExplicitLeft = 13
      ExplicitTop = 18
      object shpPrimeira: TShape
        Left = 0
        Top = 0
        Width = 84
        Height = 31
        Align = alClient
        Brush.Color = 14342621
        Pen.Style = psClear
        Shape = stRoundRect
        ExplicitTop = 6
        ExplicitWidth = 175
        ExplicitHeight = 70
      end
      object btnPrimeira: TSpeedButton
        Left = 0
        Top = 0
        Width = 84
        Height = 31
        Align = alClient
        Caption = '<< Primeira'
        Flat = True
        OnClick = btnPrimeiraClick
        ExplicitLeft = -1
        ExplicitTop = 4
        ExplicitWidth = 169
        ExplicitHeight = 70
      end
    end
    object pnlPagUltima: TPanel
      AlignWithMargins = True
      Left = 878
      Top = 10
      Width = 84
      Height = 31
      Margins.Left = 5
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alRight
      BevelOuter = bvNone
      DoubleBuffered = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = True
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 3
      ExplicitLeft = 822
      object shpUltima: TShape
        Left = 0
        Top = 0
        Width = 84
        Height = 31
        Align = alClient
        Brush.Color = 14342621
        Pen.Style = psClear
        Shape = stRoundRect
        ExplicitTop = 6
        ExplicitWidth = 175
        ExplicitHeight = 70
      end
      object btnUltima: TSpeedButton
        Left = 0
        Top = 0
        Width = 84
        Height = 31
        Align = alClient
        Caption = #218'ltima >>'
        Flat = True
        OnClick = btnPrimeiraClick
        ExplicitLeft = 64
        ExplicitTop = -4
        ExplicitWidth = 169
        ExplicitHeight = 70
      end
    end
  end
  object cdsCadastro: TClientDataSet
    PersistDataPacket.Data = {
      AD0000009619E0BD010000001800000006000000000003000000AD0008494450
      6573736F610400010000000000045469706F0100490000000100055749445448
      020002000A0009446F63756D656E746F01004900000001000557494454480200
      02001400044E6F6D65020049000000010005574944544802000200F4010C4461
      7461526567697374726F080008000000000008456E64657265636F0200490000
      00010005574944544802000200F4010000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDPessoa'
        DataType = ftInteger
      end
      item
        Name = 'Tipo'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Documento'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Nome'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'DataRegistro'
        DataType = ftDateTime
      end
      item
        Name = 'Endereco'
        DataType = ftString
        Size = 500
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 200
    Top = 160
    object cdsCadastroIDPessoa: TIntegerField
      DisplayLabel = 'ID'
      DisplayWidth = 8
      FieldName = 'IDPessoa'
    end
    object cdsCadastroTipo: TStringField
      DisplayWidth = 10
      FieldName = 'Tipo'
      Size = 10
    end
    object cdsCadastroDocumento: TStringField
      DisplayWidth = 20
      FieldName = 'Documento'
    end
    object cdsCadastroNome: TStringField
      DisplayWidth = 29
      FieldName = 'Nome'
      Size = 500
    end
    object cdsCadastroDataRegistro: TDateTimeField
      DisplayLabel = 'Data Registro'
      DisplayWidth = 12
      FieldName = 'DataRegistro'
    end
    object cdsCadastroEndereco: TStringField
      DisplayWidth = 74
      FieldName = 'Endereco'
      Size = 500
    end
  end
  object dsCadastro: TDataSource
    DataSet = cdsCadastro
    Left = 120
    Top = 160
  end
end
