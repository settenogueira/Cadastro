unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, REST.Json, System.Json,  REST.Types, REST.Client,
  System.Json.Types, System.Json.Writers, System.Json.Builders, System.Json.Readers,
  Data.DB, Data.Bind.Components, Data.Bind.ObjectScope, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, System.UITypes,


  IdIPWatch,IdBaseComponent, IdComponent, CDS, IdAttachmentFile,
  IdSMTP, IdMessage, IdSSLOpenSSL, IdIOHandler, IdIOHandlerSocket,
     IdIOHandlerStack, IdSSL, IdTCPConnection, IdTCPClient, IdHTTP,
     IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, SHFolder,
     System.IOUtils


  ;

type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1nome: TStringField;
    ClientDataSet1identidade: TStringField;
    ClientDataSet1cpf: TStringField;
    ClientDataSet1telefone: TStringField;
    ClientDataSet1email: TStringField;
    ClientDataSet1endereco: TStringField;
    ClientDataSet1cep: TStringField;
    ClientDataSet1logradouro: TStringField;
    ClientDataSet1numero: TStringField;
    ClientDataSet1complemento: TStringField;
    ClientDataSet1bairro: TStringField;
    ClientDataSet1cidade: TStringField;
    ClientDataSet1estado: TStringField;
    ClientDataSet1pais: TStringField;
    RESTClient: TRESTClient;
    RESTResponse: TRESTResponse;
    RESTRequest: TRESTRequest;
    DBNavigator1: TDBNavigator;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    EditBusca: TEdit;
    Label6: TLabel;
    Label20: TLabel;
    Panel3: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label21: TLabel;
    DBE_cep: TDBEdit;
    DBE_logradouro: TDBEdit;
    DBE_numero: TDBEdit;
    DBE_complemento: TDBEdit;
    DBE_bairro: TDBEdit;
    DBE_cidade: TDBEdit;
    DBE_estado: TDBEdit;
    DBE_pais: TDBEdit;
    Button1: TButton;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label22: TLabel;
    DBE_nome: TDBEdit;
    DBE_identidade: TDBEdit;
    DBE_cpf: TDBEdit;
    DBE_telefone: TDBEdit;
    DBE_email: TDBEdit;
    Panel1: TPanel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label23: TLabel;
    Button2: TButton;
    EditUserName: TEdit;
    EditEmailDestinatario: TEdit;
    EditHostName: TEdit;
    EditSenha: TEdit;
    EditPort: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure EditBuscaChange(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBE_cpfExit(Sender: TObject);
    procedure DBE_nomeExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBE_identidadeExit(Sender: TObject);
    procedure EditEmailDestinatarioExit(Sender: TObject);
    procedure EditHostNameExit(Sender: TObject);
    procedure EditPortExit(Sender: TObject);
    procedure EditUserNameExit(Sender: TObject);
    procedure EditSenhaExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function BuscarCEPNoViaCEP(UmCEP: string): Integer;
    function EnviarEmail(sRemetente,sDestinatario,sAssunto, sHost,sUsuario,sSenha,sTexto,sAnexo, sTipoSMTP: string; iPorta: Integer; bAutenticacao: boolean): integer;
    function RecuperarDiretorio: string;
    function DataHora(sFormato: string): String;

    Procedure RegistrarLog(sNomeArquivo,sDescricao: string);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


procedure TForm1.FormShow(Sender: TObject);
begin
  DBE_nome.SetFocus;
end;

{-------------------------------------------------------------------------------
Objetivo  : Buscar o endereço no ViaCEP
--------------------------------------------------------------------------------}
function TForm1.BuscarCEPNoViaCEP(UmCEP: string): Integer;
var
  data: TJSONObject;
  RESTClient1: TRESTClient;
  RESTRequest1: TRESTRequest;
  RESTResponse1: TRESTResponse;
begin
  try
    RESTClient1 := TRESTClient.Create(nil);
    RESTRequest1 := TRESTRequest.Create(nil);
    RESTResponse1 := TRESTResponse.Create(nil);
    RESTRequest1.Client := RESTClient1;
    RESTRequest1.Response := RESTResponse1;
    RESTClient1.BaseURL := 'https://viacep.com.br/ws/' + UmCEP + '/json';
    RESTRequest1.Execute;
    data := RESTResponse1.JSONValue as TJSONObject;

    DBE_logradouro.Text:= data.Values['logradouro'].Value;
    DBE_bairro.Text:= data.Values['bairro'].Value;
    DBE_estado.Text:= data.Values['uf'].Value;
    DBE_cidade.text:= data.Values['localidade'].Value;
    DBE_complemento.Text:= data.Values['complemento'].Value;
    DBE_pais.Text:= 'Brasil';

  Except
    on E:Exception do
    begin
      RegistrarLog(RecuperarDiretorio+'dblogError.txt',DataHora('2')+' - ViaCep - '+E.Message);
      Result:=1;
      exit;
    end;
  end;
  Result:=0;
  FreeAndNil(data);
end;

{-------------------------------------------------------------------------------
Objetivo  : Buscar o endereço no ViaCEP
--------------------------------------------------------------------------------}
procedure TForm1.Button1Click(Sender: TObject);
begin
  if DBE_cep.Text <> '' then
  begin
    if MessageDlg('Deseja preencher o endereço pelo CEP indicado ?', mtConfirmation, [mbYes, mbNo], 0,mbYes) = mrYes then
    begin
      if BuscarCEPNoViaCEP(DBE_cep.Text) <> 0 then
      begin
        ShowMessage('O pesquisa não encontrou resultado para esse CEP.');
      end;
    end
    else
    begin
      DBE_bairro.SetFocus;
    end;
  end
  else
  begin
    ShowMessage('Preencha o CEP para continuar o cadastro do endereço.');
    DBE_cep.SetFocus;
  end;
end;

{-------------------------------------------------------------------------------
Objetivo  : Enviar email
--------------------------------------------------------------------------------}
procedure TForm1.Button2Click(Sender: TObject);
var
  sAssuntoEmail   : String;
  sConteudoEmail  : String;
  apagarArquivo   : Integer;
begin
  try
    sAssuntoEmail:= 'Cadastro de clientes';

    sConteudoEmail := sConteudoEmail + 'Cadastro de clientes ' + #13+#10;
    sConteudoEmail := sConteudoEmail + ' ' + #13+#10;
    sConteudoEmail := sConteudoEmail + '[Nome]: ' + DBE_nome.text + #13+#10;
    sConteudoEmail := sConteudoEmail + '[Identidade]: ' + DBE_identidade.text + #13+#10;
    sConteudoEmail := sConteudoEmail + '[telefone]' + DBE_telefone.text + #13+#10;
    sConteudoEmail := sConteudoEmail + '[email]' + DBE_email.text + #13+#10;
    sConteudoEmail := sConteudoEmail + '[cep]' + DBE_cep.text + #13+#10;
    sConteudoEmail := sConteudoEmail + '[logradouro]' + DBE_logradouro.text + #13+#10;
    sConteudoEmail := sConteudoEmail + '[numero]' + DBE_numero.text + #13+#10;
    sConteudoEmail := sConteudoEmail + '[complemento]' + DBE_complemento.text + #13+#10;
    sConteudoEmail := sConteudoEmail + '[bairro]' + DBE_bairro.text + #13+#10;
    sConteudoEmail := sConteudoEmail + '[cidade]' + DBE_cidade.text + #13+#10;
    sConteudoEmail := sConteudoEmail + '[estado]' + DBE_estado.text + #13+#10;
    sConteudoEmail := sConteudoEmail + '[pais]' + DBE_pais.text + #13+#10;

    apagarArquivo:= EnviarEmail(EditUserName.Text,
                                EditEmailDestinatario.Text,
                                sAssuntoEmail,
                                EditHostName.Text,
                                EditUserName.Text,
                                EditSenha.Text,
                                sConteudoEmail,
                                'Cadastro.xml',
                                '23',
                                465,
                                True);
    if apagarArquivo = 0 then
    begin
      if MessageDlg('Deseja deletar o anexo no diretorio ?', mtConfirmation, [mbYes, mbNo], 0,mbYes) = mrYes then
      begin
        DeleteFile(PChar('Cadastro.xml'));
      end;
    end;
  except
    on E:Exception do
    begin
      RegistrarLog(RecuperarDiretorio+'dblogError.txt',DataHora('2')+' - EnviarEmail - '+E.Message);
      exit;
    end;
  end;
end;

{-------------------------------------------------------------------------------
Objetivo  : Buscar por nome
--------------------------------------------------------------------------------}
procedure TForm1.EditBuscaChange(Sender: TObject);
begin
  ClientDataSet1.FilterOptions:= [foCaseInsensitive];
  ClientDataSet1.Filter:= 'nome like'+ QuotedStr(EditBusca.Text+'%');
  ClientDataSet1.Filtered:= true;
end;

{-------------------------------------------------------------------------------
Objetivo  : Enviar email
--------------------------------------------------------------------------------}
function TForm1.EnviarEmail(sRemetente,sDestinatario,sAssunto, sHost,sUsuario,sSenha,sTexto,sAnexo, sTipoSMTP: string; iPorta: Integer; bAutenticacao: boolean): integer;
var  IdSSLIOHandlerSocket: TIdSSLIOHandlerSocketOpenSSL;
     IdSMTP: TIdSMTP;
     IdMessage: TIdMessage;
begin
  Try
    IdSSLIOHandlerSocket := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
    IdSMTP := TIdSMTP.Create(nil);
    IdMessage := TIdMessage.Create(nil);
    Result:=0;

    // Configuração do SSL
    if sTipoSMTP='3' then
    Begin
      IdSSLIOHandlerSocket.SSLOptions.Method := sslvSSLv3;
    end
    else if sTipoSMTP='2' then
    Begin
      IdSSLIOHandlerSocket.SSLOptions.Method := sslvSSLv2;
    end
    else
    Begin
      IdSSLIOHandlerSocket.PassThrough := false;
      IdSSLIOHandlerSocket.SSLOptions.Method := sslvSSLv23;
    end;
    IdSSLIOHandlerSocket.SSLOptions.Mode := sslmClient;

    // Configuração do SMTP
    IdSMTP.IOHandler := IdSSLIOHandlerSocket;
    IdSMTP.AuthType := DEF_SMTP_AUTH;
    IdSMTP.UseTLS := utUseImplicitTLS;
    IdSMTP.Port := iPorta;
    IdSMTP.Host := sHost;
    IdSMTP.Username := sUsuario;
    IdSMTP.Password := sSenha;

    // Tentativa de conexão e autenticação
    try
      IdSMTP.Connect;
    except
      on E:Exception do
      begin
        RegistrarLog(RecuperarDiretorio+'dblogError.txt',DataHora('2')+' - EnviarEmail - '+E.Message);
        Result:=-76;
        exit;
      end;
    end;

    // Configuração da mensagem
    IdMessage.From.Address := sRemetente;
    IdMessage.From.Name := sRemetente;
    IdMessage.ReplyTo.EMailAddresses := IdMessage.From.Address;
    IdMessage.Recipients.EMailAddresses := sDestinatario;
    IdMessage.Subject := sAssunto;
    IdMessage.Body.Text := sTexto;

    // Anexo da mensagem (opcional)
    if (sAnexo<>'') and (FileExists(sAnexo)) then
    Begin
      TIdAttachmentFile.Create(IdMessage.MessageParts,sAnexo);
    end;

    // Envio da mensagem
    try
      IdSMTP.Send(IdMessage);
    except
      On E:Exception do
      begin
        RegistrarLog(RecuperarDiretorio+'dblogError.txt',DataHora('2')+' - EnviarEmail - '+E.Message);
        Result:=-77;
        exit;
      end;
    end;

    IdMessage.Free;
    IdSSLIOHandlerSocket.Free;
    IdSMTP.Free;
  except
  On E:Exception do
    begin
      RegistrarLog(RecuperarDiretorio+'dblogError.txt',DataHora('2')+' - EnviarEmail - '+E.Message);
      Result:=-77;
      exit;
    end;
  End;
end;


{-------------------------------------------------------------------------------
Objetivo  : Registrar log
--------------------------------------------------------------------------------}
Procedure TForm1.RegistrarLog(sNomeArquivo,sDescricao: String);
var  txArquivo: TextFile;
Begin
  Try
    AssignFile(txArquivo,sNomeArquivo);
    if not FileExists(sNomeArquivo) then
    begin
      Rewrite(txArquivo);
    end
    else
    Begin
      Reset(txArquivo);
    end;
    if FileSize(txArquivo) > 2000 then
    Begin
      CloseFile(txArquivo);
      DeleteFile(sNomeArquivo+'.old');
      RenameFile(sNomeArquivo,sNomeArquivo+'.old');
      Rewrite(txArquivo);
    end;
    Append(txArquivo);
    Writeln(txArquivo,sDescricao);
  Except
  end;
  Try
    CloseFile(txArquivo);
  Except
  End;
end;

{-------------------------------------------------------------------------------
Objetivo  : Recuperar diretorio
--------------------------------------------------------------------------------}
function TForm1.RecuperarDiretorio: string;
Var path : array[0..400] of char;
Begin
  if not IsLibrary then
  Begin
     Result := ExtractFilePath(ParamStr(0))
  end
  else
  Begin
    GetModuleFileName(hInstance,path,400);
    result := ExtractFilePath(path);
  end;
End;

{-------------------------------------------------------------------------------
Objetivo  : Formatar data/hora
--------------------------------------------------------------------------------}
Function TForm1.DataHora(sFormato: String): String;
Begin
  if sFormato='1' then
     Begin
       Result:=Formatdatetime('mm/dd/yyyy hh:nn:ss:zz',now);
     end
  else if sFormato='2' then
     Begin
       Result:=Formatdatetime('dd/mm/yyyy hh:nn:ss:zz',now);
     end
  else if sFormato='3' then
     Begin
       Result:=Formatdatetime('mm/dd/yyyy',now);
     end
  else if sFormato='4' then
     Begin
       Result:=Formatdatetime('dd/mm/yyyy',now);
  end;

end;



{-------------------------------------------------------------------------------
Objetivo  : Tratamentar campo vazio
--------------------------------------------------------------------------------}
procedure TForm1.DBE_nomeExit(Sender: TObject);
begin
   if DBE_nome.Text = '' then
   begin
     ShowMessage('Preencha o campo para dar continuidade ao cadastro.');
     DBE_nome.SetFocus;
   end;
end;
procedure TForm1.DBE_identidadeExit(Sender: TObject);
begin
  if DBE_identidade.Text = '' then
  begin
    ShowMessage('Preencha o campo para dar continuidade ao cadastro.');
    DBE_identidade.SetFocus;
  end;
end;
procedure TForm1.EditEmailDestinatarioExit(Sender: TObject);
begin
  if EditEmailDestinatario.Text = '' then
  begin
    ShowMessage('Preencha o campo para dar continuidade ao Envio do email.');
    EditEmailDestinatario.SetFocus;
  end;
end;
procedure TForm1.EditHostNameExit(Sender: TObject);
begin
  if EditHostName.Text = '' then
  begin
    ShowMessage('Preencha o campo para dar continuidade ao Envio do email.');
    EditHostName.SetFocus;
  end;
end;
procedure TForm1.EditPortExit(Sender: TObject);
begin
  if EditPort.Text = '' then
  begin
    ShowMessage('Preencha o campo para dar continuidade ao Envio do email.');
    EditPort.SetFocus;
  end;
end;
procedure TForm1.EditSenhaExit(Sender: TObject);
begin
  if EditSenha.Text = '' then
  begin
    ShowMessage('Preencha o campo para dar continuidade ao Envio do email.');
    EditSenha.SetFocus;
  end;
end;
procedure TForm1.EditUserNameExit(Sender: TObject);
begin
  if EditUserName.Text = '' then
  begin
    ShowMessage('Preencha o campo para dar continuidade ao Envio do email.');
    EditUserName.SetFocus;
  end;
end;

{-------------------------------------------------------------------------------
Objetivo  : Validar CPF
--------------------------------------------------------------------------------}
procedure TForm1.DBE_cpfExit(Sender: TObject);
var
n:array [1..11] of integer;
dgt1, dgt2: integer;
soma1, soma2: integer;
begin
  if copy(DBE_cpf.Text, 1, 1) <> '' then
  begin
    n[1] := strtoint(copy(DBE_cpf.Text, 1, 1));
    n[2] := strtoint(copy(DBE_cpf.Text, 2, 1));
    n[3] := strtoint(copy(DBE_cpf.Text, 3, 1));
    n[4] := strtoint(copy(DBE_cpf.Text, 5, 1));
    n[5] := strtoint(copy(DBE_cpf.Text, 6, 1));
    n[6] := strtoint(copy(DBE_cpf.Text, 7, 1));
    n[7] := strtoint(copy(DBE_cpf.Text, 9, 1));
    n[8] := strtoint(copy(DBE_cpf.Text, 10, 1));
    n[9] := strtoint(copy(DBE_cpf.Text, 11, 1));
    n[10] := strtoint(copy(DBE_cpf.Text, 13, 1));
    n[11] := strtoint(copy(DBE_cpf.Text, 14, 1));
    soma1 := (n[1] * 10) + (n[2] * 9) + (n[3] * 8) + (n[4] * 7) + (n[5] * 6) +  (n[6] * 5) + (n[7] * 4) + (n[8] * 3) + (n[9] * 2);

    dgt1 := 11 - (soma1 mod 11);

    if (dgt1 = 10) or (dgt1 = 11) then
      dgt1 := 0;

    soma2 := (n[1] * 11) + (n[2] * 10) + (n[3] * 9) + (n[4] * 8) + (n[5] * 7) +
      (n[6] * 6) + (n[7] * 5) + (n[8] * 4) + (n[9] * 3) + (dgt1 * 2);

    dgt2 := 11 - (soma2 mod 11);

    if (dgt2 = 10) or (dgt2 = 11) then
      dgt2 := 0;

    if (dgt1 <> n[10]) or (dgt2 <> n[11]) then
    begin
      ShowMessage('Numero do CPF inválido. ');
      DBE_cpf.SetFocus;
      abort;
    end;
  end;
end;



{-------------------------------------------------------------------------------
Objetivo  : Ordenar pela coluna
--------------------------------------------------------------------------------}
procedure TForm1.DBGrid1TitleClick(Column: TColumn);
begin
  ClientDataSet1.IndexFieldNames:= Column.FieldName;
end;

end.
