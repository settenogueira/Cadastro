object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'Form1'
  ClientHeight = 603
  ClientWidth = 1245
  Color = clInactiveBorder
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Shape1: TShape
    Left = 0
    Top = 0
    Width = 1245
    Height = 65
    Align = alTop
    Brush.Color = clBackground
    ExplicitLeft = 8
    ExplicitTop = -8
    ExplicitWidth = 65
  end
  object Shape2: TShape
    Left = 0
    Top = 194
    Width = 1245
    Height = 4
    Align = alTop
    Brush.Color = clBackground
    ExplicitTop = 185
    ExplicitWidth = 1266
  end
  object Shape3: TShape
    Left = 0
    Top = 598
    Width = 1245
    Height = 5
    Align = alBottom
    Brush.Color = clBackground
    ExplicitTop = 787
    ExplicitWidth = 1266
  end
  object Label6: TLabel
    Left = 656
    Top = 24
    Width = 98
    Height = 16
    Caption = 'Buscar por Nome'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clInactiveBorder
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label20: TLabel
    Left = 8
    Top = 8
    Width = 297
    Height = 40
    Caption = 'Cadastro de Clientes'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clInactiveBorder
    Font.Height = -33
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 65
    Width = 1245
    Height = 129
    Align = alTop
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnTitleClick = DBGrid1TitleClick
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 198
    Width = 1245
    Height = 61
    DataSource = DataSource1
    Align = alTop
    TabOrder = 1
  end
  object EditBusca: TEdit
    Left = 760
    Top = 21
    Width = 305
    Height = 24
    TabOrder = 2
    OnChange = EditBuscaChange
  end
  object Panel3: TPanel
    Left = 313
    Top = 265
    Width = 613
    Height = 321
    BevelKind = bkSoft
    BevelWidth = 2
    BiDiMode = bdLeftToRight
    BorderStyle = bsSingle
    ParentBiDiMode = False
    TabOrder = 3
    object Label7: TLabel
      Left = 28
      Top = 63
      Width = 20
      Height = 16
      Caption = 'cep'
      FocusControl = DBE_cep
    end
    object Label8: TLabel
      Left = 28
      Top = 107
      Width = 62
      Height = 16
      Caption = 'logradouro'
      FocusControl = DBE_logradouro
    end
    object Label9: TLabel
      Left = 28
      Top = 152
      Width = 44
      Height = 16
      Caption = 'numero'
      FocusControl = DBE_numero
    end
    object Label10: TLabel
      Left = 28
      Top = 197
      Width = 77
      Height = 16
      Caption = 'complemento'
      FocusControl = DBE_complemento
    end
    object Label11: TLabel
      Left = 324
      Top = 63
      Width = 34
      Height = 16
      Caption = 'bairro'
      FocusControl = DBE_bairro
    end
    object Label12: TLabel
      Left = 324
      Top = 108
      Width = 37
      Height = 16
      Caption = 'cidade'
      FocusControl = DBE_cidade
    end
    object Label13: TLabel
      Left = 324
      Top = 152
      Width = 38
      Height = 16
      Caption = 'estado'
      FocusControl = DBE_estado
    end
    object Label14: TLabel
      Left = 324
      Top = 197
      Width = 23
      Height = 16
      Caption = 'pais'
      FocusControl = DBE_pais
    end
    object Label21: TLabel
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 595
      Height = 24
      Align = alTop
      Alignment = taCenter
      Caption = 'Endere'#231'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7566195
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 82
    end
    object DBE_cep: TDBEdit
      Left = 28
      Top = 85
      Width = 184
      Height = 24
      DataField = 'cep'
      DataSource = DataSource1
      MaxLength = 9
      TabOrder = 0
    end
    object DBE_logradouro: TDBEdit
      Left = 28
      Top = 130
      Width = 262
      Height = 24
      DataField = 'logradouro'
      DataSource = DataSource1
      TabOrder = 1
    end
    object DBE_numero: TDBEdit
      Left = 28
      Top = 175
      Width = 262
      Height = 24
      DataField = 'numero'
      DataSource = DataSource1
      TabOrder = 2
    end
    object DBE_complemento: TDBEdit
      Left = 28
      Top = 219
      Width = 262
      Height = 24
      DataField = 'complemento'
      DataSource = DataSource1
      TabOrder = 3
    end
    object DBE_bairro: TDBEdit
      Left = 324
      Top = 85
      Width = 262
      Height = 24
      DataField = 'bairro'
      DataSource = DataSource1
      TabOrder = 4
    end
    object DBE_cidade: TDBEdit
      Left = 324
      Top = 130
      Width = 262
      Height = 24
      DataField = 'cidade'
      DataSource = DataSource1
      TabOrder = 5
    end
    object DBE_estado: TDBEdit
      Left = 324
      Top = 175
      Width = 262
      Height = 24
      DataField = 'estado'
      DataSource = DataSource1
      TabOrder = 6
    end
    object DBE_pais: TDBEdit
      Left = 324
      Top = 219
      Width = 262
      Height = 24
      DataField = 'pais'
      DataSource = DataSource1
      TabOrder = 7
    end
    object Button1: TButton
      Left = 217
      Top = 85
      Width = 73
      Height = 25
      Caption = 'Buscar Cep'
      TabOrder = 8
      OnClick = Button1Click
    end
  end
  object Panel2: TPanel
    Left = 8
    Top = 265
    Width = 299
    Height = 321
    BevelKind = bkSoft
    BevelWidth = 2
    BiDiMode = bdLeftToRight
    BorderStyle = bsSingle
    ParentBiDiMode = False
    TabOrder = 4
    object Label1: TLabel
      Left = 16
      Top = 40
      Width = 32
      Height = 16
      BiDiMode = bdLeftToRight
      Caption = 'nome'
      FocusControl = DBE_nome
      ParentBiDiMode = False
    end
    object Label2: TLabel
      Left = 16
      Top = 86
      Width = 59
      Height = 16
      BiDiMode = bdLeftToRight
      Caption = 'identidade'
      FocusControl = DBE_identidade
      ParentBiDiMode = False
    end
    object Label3: TLabel
      Left = 16
      Top = 133
      Width = 17
      Height = 16
      BiDiMode = bdLeftToRight
      Caption = 'cpf'
      FocusControl = DBE_cpf
      ParentBiDiMode = False
    end
    object Label4: TLabel
      Left = 16
      Top = 180
      Width = 46
      Height = 16
      BiDiMode = bdLeftToRight
      Caption = 'telefone'
      FocusControl = DBE_telefone
      ParentBiDiMode = False
    end
    object Label5: TLabel
      Left = 16
      Top = 227
      Width = 31
      Height = 16
      BiDiMode = bdLeftToRight
      Caption = 'email'
      FocusControl = DBE_email
      ParentBiDiMode = False
    end
    object Label22: TLabel
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 281
      Height = 24
      Align = alTop
      Alignment = taCenter
      Caption = 'Dados Pessoais'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7566195
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 138
    end
    object DBE_nome: TDBEdit
      Left = 16
      Top = 62
      Width = 260
      Height = 24
      BiDiMode = bdLeftToRight
      DataField = 'nome'
      DataSource = DataSource1
      ParentBiDiMode = False
      TabOrder = 0
      OnExit = DBE_nomeExit
    end
    object DBE_identidade: TDBEdit
      Left = 16
      Top = 110
      Width = 260
      Height = 24
      BiDiMode = bdLeftToRight
      DataField = 'identidade'
      DataSource = DataSource1
      MaxLength = 11
      ParentBiDiMode = False
      TabOrder = 1
      OnExit = DBE_identidadeExit
    end
    object DBE_cpf: TDBEdit
      Left = 16
      Top = 157
      Width = 260
      Height = 24
      BiDiMode = bdLeftToRight
      DataField = 'cpf'
      DataSource = DataSource1
      MaxLength = 14
      ParentBiDiMode = False
      TabOrder = 2
      OnExit = DBE_cpfExit
    end
    object DBE_telefone: TDBEdit
      Left = 16
      Top = 204
      Width = 260
      Height = 24
      BiDiMode = bdLeftToRight
      DataField = 'telefone'
      DataSource = DataSource1
      MaxLength = 14
      ParentBiDiMode = False
      TabOrder = 3
    end
    object DBE_email: TDBEdit
      Left = 16
      Top = 251
      Width = 260
      Height = 24
      DataField = 'email'
      DataSource = DataSource1
      TabOrder = 4
    end
  end
  object Panel1: TPanel
    Left = 932
    Top = 268
    Width = 307
    Height = 312
    BiDiMode = bdLeftToRight
    BorderStyle = bsSingle
    ParentBiDiMode = False
    TabOrder = 5
    object Label15: TLabel
      Left = 162
      Top = 159
      Width = 36
      Height = 16
      Caption = 'Senha'
    end
    object Label16: TLabel
      Left = 26
      Top = 107
      Width = 58
      Height = 16
      Caption = 'HostName'
    end
    object Label17: TLabel
      Left = 26
      Top = 59
      Width = 102
      Height = 16
      Caption = 'Email destinat'#225'rio'
    end
    object Label18: TLabel
      Left = 26
      Top = 156
      Width = 59
      Height = 16
      Caption = 'UserName'
    end
    object Label19: TLabel
      Left = 162
      Top = 109
      Width = 23
      Height = 16
      Caption = 'Port'
    end
    object Label23: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 295
      Height = 24
      Align = alTop
      Alignment = taCenter
      Caption = 'Par'#226'metros Email'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7566195
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 157
    end
    object Button2: TButton
      Left = 26
      Top = 228
      Width = 257
      Height = 37
      Caption = 'Enviar Email'
      TabOrder = 0
      OnClick = Button2Click
    end
    object EditUserName: TEdit
      Left = 26
      Top = 181
      Width = 121
      Height = 24
      TabOrder = 1
      OnExit = EditUserNameExit
    end
    object EditEmailDestinatario: TEdit
      Left = 26
      Top = 81
      Width = 257
      Height = 24
      TabOrder = 2
      OnExit = EditEmailDestinatarioExit
    end
    object EditHostName: TEdit
      Left = 26
      Top = 129
      Width = 121
      Height = 24
      TabOrder = 3
      OnExit = EditHostNameExit
    end
    object EditSenha: TEdit
      Left = 162
      Top = 181
      Width = 121
      Height = 24
      TabOrder = 4
      OnExit = EditSenhaExit
    end
    object EditPort: TEdit
      Left = 162
      Top = 129
      Width = 121
      Height = 24
      TabOrder = 5
      OnExit = EditPortExit
    end
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 24
    Top = 144
  end
  object ClientDataSet1: TClientDataSet
    PersistDataPacket.Data = {
      FB0200009619E0BD01000000180000000E000A000000030000002502046E6F6D
      6501004900100001000557494454480200020014000A6964656E746964616465
      0100490010000100055749445448020002001400036370660100490010000100
      0557494454480200020014000874656C65666F6E650100490010000100055749
      44544802000200140005656D61696C0100490010000100055749445448020002
      00140008656E64657265636F0100490010000100055749445448020002001400
      0363657001004900100001000557494454480200020014000A6C6F677261646F
      75726F0100490010000100055749445448020002001400066E756D65726F0100
      4900100001000557494454480200020014000B636F6D706C656D656E746F0100
      4900100001000557494454480200020014000662616972726F01004900100001
      0005574944544802000200140006636964616465010049001000010005574944
      54480200020014000665737461646F0100490010000100055749445448020002
      0014000470616973010049001000010005574944544802000200140001000A43
      48414E47455F4C4F47040082001E000000010000000000000004000000020000
      0000000000040000000300000000000000040000000400000000000000040000
      0005000000000000000400000006000000000000000400000007000000000000
      00040000000800000000000000040000000900000004000000080000000A0000
      00060000000800000004004555050674686961676F0B363336303834372D7373
      700E3035302E3235352E3832342D353804333133350935313136302D30303004
      545555050672656E61746F0454555505096672616E636973636F055555550504
      54555505096672616E636973636F055455550505746573746504545555050966
      72616E636973636F0440455505096672616E636973636F0B353535353535352D
      6473610E3035302E3235352E3832342D35380935313136302D3030300C545555
      05066D6172636F730C505555050574657374650B323133343233342D6F6975}
    Active = True
    Aggregates = <>
    FileName = 
      'C:\Users\thiago.nogueira\Desktop\Cadastro\Win32\Debug\Cadastro.x' +
      'ml'
    FieldDefs = <
      item
        Name = 'nome'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'identidade'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'cpf'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'telefone'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'email'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'endereco'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'cep'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'logradouro'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'numero'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'complemento'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'bairro'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'cidade'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'estado'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'pais'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 32
    Top = 80
    object ClientDataSet1nome: TStringField
      DisplayWidth = 20
      FieldName = 'nome'
    end
    object ClientDataSet1identidade: TStringField
      DisplayWidth = 9
      FieldName = 'identidade'
      EditMask = '0000000-lll;1;_'
    end
    object ClientDataSet1cpf: TStringField
      DisplayWidth = 10
      FieldName = 'cpf'
      EditMask = '000.000.000-00;1;_'
    end
    object ClientDataSet1telefone: TStringField
      DisplayWidth = 11
      FieldName = 'telefone'
      EditMask = '!\(99\)000-000000;1;_'
    end
    object ClientDataSet1email: TStringField
      DisplayWidth = 14
      FieldName = 'email'
    end
    object ClientDataSet1endereco: TStringField
      DisplayWidth = 9
      FieldName = 'endereco'
    end
    object ClientDataSet1cep: TStringField
      DisplayWidth = 7
      FieldName = 'cep'
      EditMask = '00000-000;1;_'
    end
    object ClientDataSet1logradouro: TStringField
      DisplayWidth = 10
      FieldName = 'logradouro'
    end
    object ClientDataSet1numero: TStringField
      DisplayWidth = 9
      FieldName = 'numero'
    end
    object ClientDataSet1complemento: TStringField
      DisplayWidth = 13
      FieldName = 'complemento'
    end
    object ClientDataSet1bairro: TStringField
      DisplayWidth = 11
      FieldName = 'bairro'
    end
    object ClientDataSet1cidade: TStringField
      DisplayWidth = 13
      FieldName = 'cidade'
    end
    object ClientDataSet1estado: TStringField
      DisplayWidth = 6
      FieldName = 'estado'
    end
    object ClientDataSet1pais: TStringField
      DisplayWidth = 6
      FieldName = 'pais'
    end
  end
  object RESTClient: TRESTClient
    Params = <>
    Left = 104
    Top = 104
  end
  object RESTResponse: TRESTResponse
    Left = 24
    Top = 184
  end
  object RESTRequest: TRESTRequest
    Client = RESTClient
    Params = <>
    Response = RESTResponse
    SynchronizedEvents = False
    Left = 104
    Top = 160
  end
end
