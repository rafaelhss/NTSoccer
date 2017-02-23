unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, NMUDP, Buttons, jpeg, Menus, ComCtrls, Gauges;

type
  TfrmNTSoccer = class(TForm)
    NMUDP1: TNMUDP;
    Panel1: TPanel;
    imgjogador3: TImage;
    imgStreet: TImage;
    MainMenu1: TMainMenu;
    mnuConfig: TMenuItem;
    mnuServidor: TMenuItem;
    imgStadium: TImage;
    imgjogador8: TImage;
    imgjogador1: TImage;
    imgjogador10: TImage;
    tmLeft: TTimer;
    tmDown: TTimer;
    tmRight: TTimer;
    tmUp: TTimer;
    tmUsaFolego: TTimer;
    tmAumentaFolego: TTimer;
    lblPlacar: TLabel;
    imgjogador5: TImage;
    imgjogador6: TImage;
    imgjogador7: TImage;
    imgjogador4: TImage;
    mnuStreet: TMenuItem;
    mnuStadium: TMenuItem;
    N1: TMenuItem;
    mnuJogador: TMenuItem;
    bola: TImage;
    bola1: TImage;
    bola2: TImage;
    barChute: TGauge;
    barFolego: TGauge;
    lblFolego: TLabel;
    lblPotencia: TLabel;
    tmChute: TTimer;
    StatusBar: TStatusBar;
    tmGol1: TTimer;
    tmGol2: TTimer;
    lblGol: TLabel;
    imgjogador9: TImage;
    imgjogador2: TImage;
    imgTorcedor01: TImage;
    imgTorcedor02: TImage;
    imgTorcedor03: TImage;
    imgTorcedor04: TImage;
    imgTorcedor05: TImage;
    procedure NMUDP1DataReceived(Sender: TComponent; NumberBytes: Integer;
      FromIP: String; Port: Integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mnuServidorClick(Sender: TObject);
    procedure tmLeftTimer(Sender: TObject);
    procedure tmRightTimer(Sender: TObject);
    procedure tmUpTimer(Sender: TObject);
    procedure tmDownTimer(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tmUsaFolegoTimer(Sender: TObject);
    procedure tmAumentaFolegoTimer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure mnuStreetClick(Sender: TObject);
    procedure mnuStadiumClick(Sender: TObject);
    procedure mnuJogadorClick(Sender: TObject);
    procedure tmChuteTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tmGol1Timer(Sender: TObject);
    procedure tmGol2Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNTSoccer : TfrmNTSoccer;
  TipoBola    : Integer;       //usada para simular movimentação da bola

implementation

uses Unit3, Unit2;

{$R *.DFM}

type
{**
 *  Estrutura com os dados do jogador local do cliente
 **}

  TDadosJogador=record
    Id: integer;
    Nome: String[15];
    Potencia : integer;
    DirecaoX : integer;
    DirecaoY : integer;
    PosX : integer;
    PosY : integer;
  end;

{**
 *  Estrutura com os dados pertinentes da partida, recebido do servidor
 **}

  TDadosPartida = record
    Status: integer;
    PlacarA, PlacarB : integer;
    BolaPosX, BolaPosY : integer;
    NoCliente : integer;
    Jogador: TDadosJogador;
  end;

var
  MyDados:TDadosJogador;  // dados do jogador local
  Tdados: TDadosPartida;  // dados da partida recebido do servidor
  Tamanho : integer;      // tamanho do buffer
  Buffer: array[1..1000] of char;  // buffer que será empacotado e enviado

procedure TfrmNTSoccer.NMUDP1DataReceived(Sender: TComponent;
  NumberBytes: Integer; FromIP: String; Port: Integer);

var
  X: Integer;
begin
  //Recebe Pacote UDP
  Tamanho:=NumberBytes;
  NMUDP1.ReadBuffer(Buffer, Tamanho);
  move(Buffer, TDados, Tamanho);

  //Atualiza ID para novos jogadores
  if (Mydados.Id = 0) then
    Mydados.Id := Tdados.NoCliente;

  //Posiciona Jogador ao lado da bola de acordo com a direção
  if (Tdados.Jogador.DirecaoX > 0)then
    X := 31
  else if (Tdados.Jogador.DirecaoX < 0)then
    X := 11
  else
    X := 21;

  //Move jogador recebido no pacote
  if (Tdados.Jogador.Id = 1) then
  begin
    imgjogador1.Visible := true;
    imgjogador1.Left := Tdados.Jogador.PosX-X;
    imgjogador1.Top := Tdados.Jogador.PosY-imgjogador1.Height;
  end;

  if (Tdados.Jogador.Id = 2) then
  begin
    imgjogador2.Visible := true;
    imgjogador2.Left := Tdados.Jogador.PosX-X;
    imgjogador2.Top := Tdados.Jogador.PosY-imgjogador2.Height;
  end;

  if (Tdados.Jogador.Id = 3) then
  begin
    imgjogador3.Visible := true;
    imgjogador3.Left := Tdados.Jogador.PosX-X;
    imgjogador3.Top := Tdados.Jogador.PosY-imgjogador3.Height;
  end;

  if (Tdados.Jogador.Id = 4) then
  begin
    imgjogador4.Visible := true;
    imgjogador4.Left := Tdados.Jogador.PosX-X;
    imgjogador4.Top := Tdados.Jogador.PosY-imgjogador4.Height;
  end;

  if (Tdados.Jogador.Id = 5) then
  begin
    imgjogador5.Visible := true;
    imgjogador5.Left := Tdados.Jogador.PosX-X;
    imgjogador5.Top := Tdados.Jogador.PosY-imgjogador5.Height;
  end;

  if (Tdados.Jogador.Id = 6) then
  begin
    imgjogador6.Visible := true;
    imgjogador6.Left := Tdados.Jogador.PosX-X;
    imgjogador6.Top := Tdados.Jogador.PosY-imgjogador6.Height;
  end;

  if (Tdados.Jogador.Id = 7) then
  begin
    imgjogador7.Visible := true;
    imgjogador7.Left := Tdados.Jogador.PosX-X;
    imgjogador7.Top := Tdados.Jogador.PosY-imgjogador7.Height;
  end;

  if (Tdados.Jogador.Id = 8) then
  begin
    imgjogador8.Visible := true;
    imgjogador8.Left := Tdados.Jogador.PosX-X;
    imgjogador8.Top := Tdados.Jogador.PosY-imgjogador8.Height;
  end;

  if (Tdados.Jogador.Id = 9) then
  begin
    imgjogador9.Visible := true;
    imgjogador9.Left := Tdados.Jogador.PosX-X;
    imgjogador9.Top := Tdados.Jogador.PosY-imgjogador9.Height;
  end;

  if (Tdados.Jogador.Id = 10) then
  begin
    imgjogador10.Visible := true;
    imgjogador10.Left := Tdados.Jogador.PosX-X;
    imgjogador10.Top := Tdados.Jogador.PosY-imgjogador10.Height;
  end;

  //Atualiza a posição da bola
  Bola.Top := Tdados.BolaPosY - 10;
  Bola.Left := Tdados.BolaPosX - 10 ;

  //Simula movimentação da bola
  if (TipoBola < 5)then
  begin
    Bola.Picture := bola2.Picture;
    TipoBola := TipoBola + 1;
  end
  else if (TipoBola < 10)then
  begin
    Bola.Picture := bola1.Picture;
    TipoBola := TipoBola + 1;
  end
  else
    TipoBola := 0;

  //Testa se foi gol e abilita a comemoração
  if (Tdados.Status = 1) then
  begin
    lblGol.Caption := 'GO';
    tmGol1.enabled := true;
  end
  else if (Tdados.Status = 2) then
  begin
    lblGol.Caption := 'GO';
    tmGol2.enabled := true;
  end
  // Coloca na bara de status o nome do jogador que tem a posse de bola
  else if (Tdados.Status = 5) then
  begin
    StatusBar.SimpleText := Tdados.Jogador.Nome + ' - ID: ' + inttostr(Tdados.Jogador.Id) + ' ::: ' + inttostr(tdados.NoCliente) + ' jogadores on-line';
  end;

  //Atualiza placar
  lblPlacar.Caption := 'Cruzeiro : '+ inttostr(Tdados.PlacarA) + ' X ' + inttostr(Tdados.PlacarB) + ' : Atlético' ;

end;

procedure TfrmNTSoccer.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

 begin

   //Monitora o teclado e age de acordo com a tecla pressionada
   // X e Barra de Espaço -> Chuta
   if ((Key = ord('X')) or (Key = VK_SPACE)) then
     tmChute.Enabled := true;

   //As teclas direcionais iniciam o movimento
   if (Key = VK_LEFT) then
   Begin
     Mydados.DirecaoX := -25;
     tmLeft.Enabled   := true;
   End;

   if (Key = VK_RIGHT) then
   Begin
     Mydados.DirecaoX := +25;
     tmRight.Enabled  := true;
   End;

   if (Key = VK_UP) then
   Begin
     Mydados.DirecaoY := -25;
     tmUp.Enabled     := true;
   End;

   if (Key = VK_DOWN) then
   Begin
     Mydados.DirecaoY := +25;
     tmDown.Enabled := true;
   End;

   //C --> Correr
   //Para dar efeito de correr é aumentado a frequencia dos timers de movimento
   if (Key = ord('C')) then
   begin
     tmUsaFolego.Enabled := true;
     tmAumentaFolego.Enabled := false;

     if(barFolego.Progress > 10) then
     begin
       tmUp.Interval    := 20;
       tmDown.Interval  := 20;
       tmLeft.Interval  := 20;
       tmRight.Interval := 20;
     end;
   end;

   //Envia pacote
   Tamanho := sizeof(Mydados);
   move(Mydados, Buffer, Tamanho);
   NMUDP1.SendBuffer(Buffer, Tamanho);

   Mydados.Potencia := 0;

end;

procedure TfrmNTSoccer.mnuServidorClick(Sender: TObject);
begin
  frmConfigServidor.ShowModal;
end;

procedure TfrmNTSoccer.tmLeftTimer(Sender: TObject);
begin
  //Movimenta para a esquerda
  Mydados.PosX := Mydados.PosX - 5;

  if(Mydados.PosX < 5) then
    Mydados.PosX := 5;

  Tamanho := sizeof(Mydados);
  move(Mydados, Buffer, Tamanho);
  NMUDP1.SendBuffer(Buffer, Tamanho);
end;

procedure TfrmNTSoccer.tmRightTimer(Sender: TObject);
begin
  //Movimenta para a direita
  Mydados.PosX := Mydados.PosX + 5;

  if(Mydados.PosX > 755) then
    Mydados.PosX := 755;

  Tamanho := sizeof(Mydados);
  move(Mydados, Buffer, Tamanho);
  NMUDP1.SendBuffer(Buffer, Tamanho);
end;

procedure TfrmNTSoccer.tmUpTimer(Sender: TObject);
begin
  //Movimenta para cima
  Mydados.PosY := Mydados.PosY - 5;

  if(Mydados.PosY < 10) then
    Mydados.PosY := 10;

  Tamanho := sizeof(Mydados);
  move(Mydados, Buffer, Tamanho);
  NMUDP1.SendBuffer(Buffer, Tamanho);
end;

procedure TfrmNTSoccer.tmDownTimer(Sender: TObject);
begin
  //Movimenta para baixo
  Mydados.PosY := Mydados.PosY + 5;

  if(Mydados.PosY > 475) then
    Mydados.PosY := 475;


  Tamanho := sizeof(Mydados);
  move(Mydados, Buffer, Tamanho);
  NMUDP1.SendBuffer(Buffer, Tamanho);
end;

procedure TfrmNTSoccer.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   //Monitora quando o jogador solta a tecla para poder desfazer o que
   //foi feito quando pressionada

   if ((Key = ord('X')) or (Key = VK_SPACE)) then
   begin
     tmChute.Enabled := false;
     MyDados.Potencia := barchute.Progress;
     barChute.Progress := 1;

     Tamanho := sizeof(Mydados);
     move(Mydados, Buffer, Tamanho);
     NMUDP1.SendBuffer(Buffer, Tamanho);

     Mydados.Potencia := 0;
   end;

   if (Key = VK_LEFT) then
   begin
     Mydados.DirecaoX := 0;
     tmLeft.Enabled := false;
   end;

   if (Key = VK_RIGHT) then
   begin
     Mydados.DirecaoX := 0;
     tmRight.Enabled := false;
   end;

   if (Key = VK_UP) then
   begin
     Mydados.DirecaoY := 0;
     tmUp.Enabled := false;
   end;

   if (Key = VK_DOWN) then
   begin
     Mydados.DirecaoY := 0;
     tmDown.Enabled := false;
   end;

   if (Key = ord('C')) then
   begin
     tmUsaFolego.Enabled := false;
     tmAumentaFolego.Enabled := true;

     tmUp.Interval    := 50;
     tmDown.Interval  := 50;
     tmLeft.Interval  := 50;
     tmRight.Interval := 50;
   end;

end;

procedure TfrmNTSoccer.tmUsaFolegoTimer(Sender: TObject);
begin
  //Gasta o fôlego do jogador quando corre
  //O fôlego é monitora por uma barra
  barFolego.Progress := barFolego.Progress - 1;

  if(barFolego.Progress < 1) then
  begin
    tmUsaFolego.Enabled := false;
    tmUp.Interval    := 50;
    tmDown.Interval  := 50;
    tmLeft.Interval  := 50;
    tmRight.Interval := 50;
  end;
end;

procedure TfrmNTSoccer.tmAumentaFolegoTimer(Sender: TObject);
begin
  //aumenta o fôlego do jogador
  barFolego.Progress := barFolego.Progress + 1;
end;

procedure TfrmNTSoccer.FormActivate(Sender: TObject);
begin
  //Envia dados para conexçao com o servidor
  //e atualiza exibição na tela

  NMUDP1.RemoteHost:=frmConfigServidor.txtIP.Text;
  NMUDP1.RemotePort:=StrToInt(frmConfigServidor.txtPorta.Text);
  Tamanho:=sizeof(Mydados);
  move(Mydados, Buffer, Tamanho);
  NMUDP1.SendBuffer(Buffer, Tamanho);
  if(mnuStreet.Checked)then
  begin
    imgStreet.Visible  := true;
    imgStadium.Visible := false;
  end
  else
  begin
    imgStadium.Visible := true;
    imgStreet.Visible  := false;
  end;

end;


procedure TfrmNTSoccer.mnuStreetClick(Sender: TObject);
begin
  //Troca a tela para Street Soccer
  mnuStreet.Checked  := true;
  imgStreet.Visible  := true;
  imgStadium.Visible := false;
end;

procedure TfrmNTSoccer.mnuStadiumClick(Sender: TObject);
begin
  //Troca a tela para Stadium Soccer
  mnuStadium.Checked := true;
  imgStadium.Visible := true;
  imgStreet.Visible  := false;
end;

procedure TfrmNTSoccer.mnuJogadorClick(Sender: TObject);
begin
  frmConfigJogador.ShowModal;
end;

procedure TfrmNTSoccer.tmChuteTimer(Sender: TObject);
begin
  //Controla a potência do chute
  barChute.Progress := barChute.Progress + 1;
  if (barChute.Progress >= barchute.MaxValue) then
    tmChute.Enabled := false;
end;

procedure TfrmNTSoccer.FormCreate(Sender: TObject);
begin
  //Inicializa variáveis
  Mydados.PosX := 385;
  Mydados.PosY := 50;
  Mydados.id   := 0;
end;

procedure TfrmNTSoccer.tmGol1Timer(Sender: TObject);
begin
  //Comemoração do GOL
  if(length(lblGol.Caption) <= 12) then
  begin
    //Mostra a palavra Gol no letreiro do placar
    if(imgtorcedor04.Top mod 2 <> 0) then
    begin
      lblGol.Visible := true;
      lblGol.Caption := lblGol.Caption + 'O';
    end;

    //Animação dos torcedores
    imgTorcedor01.Visible := true;
    imgTorcedor02.Visible := true;
    imgTorcedor03.Visible := true;
    imgTorcedor04.Visible := true;
    imgTorcedor05.Visible := true;
    imgTorcedor01.Top := imgTorcedor01.Top - 10;
    imgTorcedor02.Top := imgTorcedor02.Top - 15;
    imgTorcedor03.Top := imgTorcedor03.Top - 8;
    imgTorcedor04.Top := imgTorcedor04.Top - 5;
    imgTorcedor05.Top := imgTorcedor05.Top - 12;
  end;

  if(length(lblGol.Caption) > 12) then
  begin
    //Finaliza placar com L da palavra gol
    if(imgtorcedor04.Top mod 2 <> 0) then
    begin
      lblGol.Caption := lblGol.Caption + 'L';
    end;

    //Finaliza animação dos torcedores
    imgTorcedor01.Top := imgTorcedor01.Top + 30;
    imgTorcedor02.Top := imgTorcedor02.Top + 40;
    imgTorcedor03.Top := imgTorcedor03.Top + 30;
    imgTorcedor04.Top := imgTorcedor04.Top + 25;
    imgTorcedor05.Top := imgTorcedor05.Top + 45;
  end;

  if(length(lblGol.Caption) > 16) then
  begin
    //Desabilita label do gol, timer, e vizualização de torcedores
    lblGol.Visible := false;
    tmGol1.Enabled := false;
    imgTorcedor01.Visible := false;
    imgTorcedor02.Visible := false;
    imgTorcedor03.Visible := false;
    imgTorcedor04.Visible := false;
    imgTorcedor05.Visible := false;
    imgTorcedor01.Top := 350;
    imgTorcedor02.Top := 400;
    imgTorcedor03.Top := 330;
    imgTorcedor04.Top := 420;
    imgTorcedor05.Top := 380;
  end;
end;

procedure TfrmNTSoccer.tmGol2Timer(Sender: TObject);
begin
  //Comemoração do GOL
  if(length(lblGol.Caption) <= 12) then
  begin
    //Mostra a palavra Gol no letreiro do placar
    if(imgtorcedor04.Top mod 2 <> 0) then
    begin
      lblGol.Visible := true;
      lblGol.Caption := lblGol.Caption + 'O';
    end;

    //Animação dos torcedores
    imgTorcedor01.Visible := true;
    imgTorcedor02.Visible := true;
    imgTorcedor03.Visible := true;
    imgTorcedor04.Visible := true;
    imgTorcedor05.Visible := true;
    imgTorcedor01.Top := imgTorcedor01.Top - 10;
    imgTorcedor02.Top := imgTorcedor02.Top - 15;
    imgTorcedor03.Top := imgTorcedor03.Top - 8;
    imgTorcedor04.Top := imgTorcedor04.Top - 5;
    imgTorcedor05.Top := imgTorcedor05.Top - 12;
  end;

  if(length(lblGol.Caption) > 12) then
  begin
    //Finaliza placar com L da palavra gol
    if(imgtorcedor04.Top mod 2 <> 0) then
    begin
      lblGol.Caption := lblGol.Caption + 'L';
    end;

    //Finaliza animação dos torcedores
    imgTorcedor01.Top := imgTorcedor01.Top + 30;
    imgTorcedor02.Top := imgTorcedor02.Top + 40;
    imgTorcedor03.Top := imgTorcedor03.Top + 30;
    imgTorcedor04.Top := imgTorcedor04.Top + 25;
    imgTorcedor05.Top := imgTorcedor05.Top + 45;
  end;

  if(length(lblGol.Caption) > 16) then
  begin
    //Desabilita label do gol, timer, e vizualização de torcedores
    lblGol.Visible := false;
    tmGol2.Enabled := false;
    imgTorcedor01.Visible := false;
    imgTorcedor02.Visible := false;
    imgTorcedor03.Visible := false;
    imgTorcedor04.Visible := false;
    imgTorcedor05.Visible := false;
    imgTorcedor01.Top := 350;
    imgTorcedor02.Top := 400;
    imgTorcedor03.Top := 330;
    imgTorcedor04.Top := 420;
    imgTorcedor05.Top := 380;
  end;
end;
end.
