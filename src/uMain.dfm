object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Enviar msg para whatsapp'
  ClientHeight = 221
  ClientWidth = 394
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lblNumero: TLabel
    Left = 8
    Top = 8
    Width = 106
    Height = 13
    Caption = 'N'#250'mero do whatsapp:'
  end
  object lblMsg: TLabel
    Left = 8
    Top = 54
    Width = 55
    Height = 13
    Caption = 'Mensagem:'
  end
  object edtTelefone: TMaskEdit
    Left = 8
    Top = 27
    Width = 159
    Height = 21
    EditMask = '!\(##\)#.####-####;1; '
    MaxLength = 15
    TabOrder = 0
    Text = '(  ) .    -    '
  end
  object memMsg: TMemo
    Left = 8
    Top = 71
    Width = 377
    Height = 89
    TabOrder = 1
  end
  object btnEnvia: TButton
    Left = 144
    Top = 184
    Width = 75
    Height = 25
    Caption = 'Enviar'
    TabOrder = 2
    OnClick = btnEnviaClick
  end
end
