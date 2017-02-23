unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TfrmConfigJogador = class(TForm)
    btnConectar: TButton;
    txtNome: TEdit;
    Label1: TLabel;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConectarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfigJogador: TfrmConfigJogador;

implementation

uses Unit1;

{$R *.DFM}

procedure TfrmConfigJogador.btnCancelarClick(Sender: TObject);
begin
  frmConfigJogador.Close;
end;

procedure TfrmConfigJogador.btnConectarClick(Sender: TObject);
begin
  frmNTSoccer.FormActivate(nil);
  frmConfigJogador.Close;
end;

end.
