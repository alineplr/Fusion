unit untPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, Vcl.StdCtrls, Vcl.ExtCtrls,
  IdAntiFreezeBase, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdSSL, IdSSLOpenSSL, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, dxGDIPlusClasses;

type
   TDownload = class(TThread)

  private
    pArquivo : String;
    pURL : String;
    pDataInicio : TDateTime;
    pDataFim : TDateTime;
  protected
    procedure ExecutaDownload();
    procedure FinalizaDownload();
    procedure Execute; override;
  public
    constructor Create (const CreateSuspended : boolean; vArquivo : String);
  end;

type
  TfrmPrincipal = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtURL: TEdit;
    Panel2: TPanel;
    IdHTTP: TIdHTTP;
    pbprogresso: TProgressBar;
    dlgSave: TSaveDialog;
    lblStatus: TLabel;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    bntDownload: TButton;
    Button2: TButton;
    bntPararSonwload: TButton;
    btnFechar: TButton;
    FDQueryLOGDOWNLOAD: TFDQuery;
    Button3: TButton;
    Image1: TImage;
    Panel3: TPanel;
    Label2: TLabel;
    procedure IdHTTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
    procedure IdHTTPWork(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure IdHTTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
    procedure bntDownloadClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure bntPararSonwloadClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button3Click(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
    vDownload: TDownload;
    vCancel : Boolean;
    function RetornaPorcentagem(ValorMaximo, ValorAtual: real): string;
    function RetornaKiloBytes(ValorAtual: real): string;
    procedure FimDownload(Sender: TObject);
  public
    { Public declarations }
    vPorcentagem : String;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses untMensagem, untDataModulo, untHistoricoDownload;

{$R *.dfm}

procedure TfrmPrincipal.bntDownloadClick(Sender: TObject);
var
  vArquivo : String;
begin
  if edtURL.Text <> '' then
    begin
      dlgSave.Filter := 'Arquivos' + ExtractFileExt(frmPrincipal.edtUrl.Text) + '|*' + ExtractFileExt(frmPrincipal.edtUrl.Text);
      dlgSave.FileName := 'Arquivo' + ExtractFileExt(frmPrincipal.edtUrl.Text);
      if dlgSave.Execute then
      begin
        vArquivo := dlgSave.FileName;
        Self.vDownload := TDownload.Create(True, vArquivo);
        vDownload.OnTerminate := FimDownload;
        Self.vDownload.Start;
      end;
    end;
end;

procedure TfrmPrincipal.Button2Click(Sender: TObject);
begin
if (Assigned(vDownload)) and (not vDownload.Terminated)  then
  begin
    if frmMensagem = nil then
      begin
        Application.CreateForm(TfrmMensagem,frmMensagem);
        frmMensagem.ShowModal;

        FreeAndNil(frmMensagem);
      end;
  end;
end;

procedure TfrmPrincipal.Button3Click(Sender: TObject);
begin
  if frmHistoricoDownload = nil then
      begin
        Application.CreateForm(TfrmHistoricoDownload,frmHistoricoDownload);
        frmHistoricoDownload.ShowModal;

        FreeAndNil(frmHistoricoDownload);
      end;
end;

procedure TfrmPrincipal.bntPararSonwloadClick(Sender: TObject);
begin
  if (Assigned(vDownload)) and (not vDownload.Terminated)  then
    begin
      vDownload.FinalizaDownload;
    end;
end;

procedure TfrmPrincipal.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.IdHTTPWork(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
begin
  if not vCancel then
    begin
      pbprogresso.Position := AWorkCount;
      lblStatus.Caption    := 'Baixando ... ' + RetornaKiloBytes(AWorkCount);
      vPorcentagem := 'Download em ... ' + RetornaPorcentagem(pbprogresso.Max, AWorkCount);
    end
  else
    begin
      try
      IdHTTP.Disconnect;
      Except
        on E : Exception do
          ShowMessage('Erro: ' + E.Message);
      end;
    end;
end;

procedure TfrmPrincipal.IdHTTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCountMax: Int64);
begin
  vCancel := False;
  pbprogresso.Max := AWorkCountMax;
end;

procedure TfrmPrincipal.IdHTTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
begin
  if not vCancel then
    begin
      vDownload.pDataFim := now;
      vCancel := False;
    end;
  pbprogresso.Position := 0;
  vPorcentagem := '';
  lblStatus.Caption    := 'Download Finalizado ...';
end;

function TfrmPrincipal.RetornaKiloBytes(ValorAtual: real): string;
var
  resultado : real;
begin
  resultado := ((ValorAtual / 1024) / 1024);
  Result    := FormatFloat('0.000 KBs', resultado);
end;

function TfrmPrincipal.RetornaPorcentagem(ValorMaximo,
  ValorAtual: real): string;
var
  resultado: real;
begin
  if ValorMaximo <> 0  then
    begin
      resultado := ((ValorAtual * 100) / ValorMaximo);
      Result    := FormatFloat('0%', resultado);
    end;
end;

procedure TfrmPrincipal.FimDownload(Sender: TObject);
begin

  try
    try
      FDQueryLOGDOWNLOAD.Close;
      FDQueryLOGDOWNLOAD.SQL.Clear;
      if DateTimeToStr(vDownload.pDataFim) <> '30/12/1899' then
        FDQueryLOGDOWNLOAD.SQL.Add('INSERT INTO "LOGDOWNLOAD" (CODIGO,URL,DATAINICIO,DATAFIM) VALUES ((select max(CODIGO) + 1 from LOGDOWNLOAD),' + QuotedStr((vDownload.pURL)) + ' ,' + QuotedStr(DateTimeToStr(vDownload.pDataInicio)) + ', ' +  QuotedStr(DateTimeToStr(vDownload.pDataFim)) + ')')
      else
        FDQueryLOGDOWNLOAD.SQL.Add('INSERT INTO "LOGDOWNLOAD" (CODIGO,URL,DATAINICIO,DATAFIM) VALUES ((select max(CODIGO) + 1 from LOGDOWNLOAD),' + QuotedStr((vDownload.pURL)) + ' ,' + QuotedStr(DateTimeToStr(vDownload.pDataInicio)) + ',null)');

      FDQueryLOGDOWNLOAD.ExecSQL;
    Except
      on E : Exception do
          ShowMessage('Erro: ' + E.Message);
    end;

  finally
    bntDownload.Enabled := True;

  end;


   if Assigned(TThread(Sender).FatalException) then
        showmessage('Erro ' + ' - ' + Exception(TThread(Sender).FatalException).Message);


end;


procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (Assigned(vDownload)) and (not vDownload.Terminated)  then
    begin
      if MessageDlg('Existe Threads ainda sendo exutadas, deseja fechar mesmo asssim?', mtConfirmation,[mbYes, mbNo], 0) = mrNo then
        begin
          Abort;
        end
      else
        begin
          vDownload.FinalizaDownload;
        end;
    end;
end;

{ TContadorThread }

constructor TDownload.Create(const CreateSuspended: boolean; vArquivo: String);
begin

  Self.pArquivo :=  vArquivo;
  Self.pURL := frmPrincipal.edtURL.Text;
  Self.pDataInicio := now;
  inherited Create(CreateSuspended);
  Self.FreeOnTerminate  := true;

end;

procedure TDownload.Execute;
begin
  inherited;
  frmPrincipal.bntDownload.Enabled := False;
  ExecutaDownload();

end;

procedure TDownload.FinalizaDownload;
begin
  frmPrincipal.vCancel := True;
  Self.Terminate;
end;

procedure TDownload.ExecutaDownload;
var
  fileDownload : TFileStream;
begin
  fileDownload := TFileStream.Create(Self.pArquivo, fmCreate);
  try
    frmPrincipal.IdHTTP.Get(frmPrincipal.edtUrl.Text, fileDownload);

  finally
    FreeAndNil(fileDownload);
  end;
end;

end.
