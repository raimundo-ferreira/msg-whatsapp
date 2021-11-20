unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask;

type
  TForm1 = class(TForm)
    edtTelefone: TMaskEdit;
    memMsg: TMemo;
    btnEnvia: TButton;
    lblNumero: TLabel;
    lblMsg: TLabel;
    procedure btnEnviaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  Winapi.ShellAPI, uMsgWhatsapp;

{$R *.dfm}

procedure TForm1.btnEnviaClick(Sender: TObject);
begin
  TMsgWhatsapp.New
    .SetNumero(edtTelefone.Text)
    .SetNome('Raimundo')
    .SetAssunto('Testando')
    .SetMensagem(memMsg.Lines)
    .Enviar;
end;

end.
