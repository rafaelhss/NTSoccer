object frmConfigJogador: TfrmConfigJogador
  Left = 225
  Top = 273
  BorderStyle = bsSingle
  Caption = 'Configurações do Jogador'
  ClientHeight = 85
  ClientWidth = 197
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 14
    Top = 18
    Width = 34
    Height = 13
    Caption = 'Nome :'
  end
  object btnConectar: TButton
    Left = 16
    Top = 48
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 0
    OnClick = btnConectarClick
  end
  object txtNome: TEdit
    Left = 55
    Top = 14
    Width = 90
    Height = 21
    TabOrder = 1
    Text = 'Jogador'
  end
end
