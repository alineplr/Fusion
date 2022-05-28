unit untMensagem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  cxLabel, dxGDIPlusClasses;

type
  TfrmMensagem = class(TForm)
    Panel1: TPanel;
    lblPorcentagem: TLabel;
    Timer1: TTimer;
    Panel2: TPanel;
    btnOk: TButton;
    Panel3: TPanel;
    Image1: TImage;
    cxLabel1: TcxLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMensagem: TfrmMensagem;

implementation

uses untPrincipal;

{$R *.dfm}

procedure TfrmMensagem.btnOkClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMensagem.Timer1Timer(Sender: TObject);
begin
  lblPorcentagem.Caption := frmPrincipal.vPorcentagem;
end;

end.
