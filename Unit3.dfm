object frmConfigServidor: TfrmConfigServidor
  Left = 185
  Top = 146
  BorderStyle = bsDialog
  Caption = 'Configurações do Servidor'
  ClientHeight = 112
  ClientWidth = 221
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 24
    Width = 59
    Height = 13
    Caption = 'Host Name :'
  end
  object Label2: TLabel
    Left = 42
    Top = 48
    Width = 25
    Height = 13
    Caption = 'Port :'
  end
  object txtIP: TEdit
    Left = 71
    Top = 16
    Width = 122
    Height = 21
    TabOrder = 0
    Text = 'alunos.bh2.pucmg.br'
  end
  object txtPorta: TEdit
    Left = 71
    Top = 40
    Width = 34
    Height = 21
    TabOrder = 1
    Text = '6011'
  end
  object btnConectar: TButton
    Left = 24
    Top = 72
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 2
    OnClick = btnConectarClick
  end
end
