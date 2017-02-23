program NTSoccer;

uses
  Forms,
  Unit1 in 'Unit1.pas' {frmNTSoccer},
  Unit3 in 'Unit3.pas' {frmConfigServidor},
  Unit2 in 'Unit2.pas' {frmConfigJogador};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'NT Soccer';
  Application.CreateForm(TfrmNTSoccer, frmNTSoccer);
  Application.CreateForm(TfrmConfigServidor, frmConfigServidor);
  Application.CreateForm(TfrmConfigJogador, frmConfigJogador);
  Application.Run;
end.
