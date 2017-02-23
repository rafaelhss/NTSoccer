unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TfrmConfigServidor = class(TForm)
    txtIP: TEdit;
    txtPorta: TEdit;
    btnConectar: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConectarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfigServidor: TfrmConfigServidor;

implementation

uses Unit1;

{$R *.DFM}

procedure TfrmConfigServidor.btnCancelarClick(Sender: TObject);
begin
  frmConfigServidor.Close;
end;

procedure TfrmConfigServidor.btnConectarClick(Sender: TObject);
begin
  frmNTSoccer.FormActivate(nil);
  frmConfigServidor.Close;
end;

end.

