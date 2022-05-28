program Download;

uses
  Vcl.Forms,
  untPrincipal in 'untPrincipal.pas' {frmPrincipal},
  untMensagem in 'untMensagem.pas' {frmMensagem},
  untDataModulo in 'untDataModulo.pas' {DataModule1: TDataModule},
  untHistoricoDownload in 'untHistoricoDownload.pas' {frmHistoricoDownload};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
