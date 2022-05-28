unit untHistoricoDownload;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfrmHistoricoDownload = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    FDQueryLOGDOWNLOAD: TFDQuery;
    dsLOGDOWLOAD: TDataSource;
    FDQueryLOGDOWNLOADCODIGO: TFMTBCDField;
    FDQueryLOGDOWNLOADURL: TStringField;
    FDQueryLOGDOWNLOADDATAINICIO: TWideStringField;
    FDQueryLOGDOWNLOADDATAFIM: TWideStringField;
    btnOk: TButton;
    Panel3: TPanel;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHistoricoDownload: TfrmHistoricoDownload;

implementation

{$R *.dfm}

uses untDataModulo;

procedure TfrmHistoricoDownload.btnOkClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmHistoricoDownload.FormCreate(Sender: TObject);
begin
  FDQueryLOGDOWNLOAD.Close;
  FDQueryLOGDOWNLOAD.Open;
end;

end.
