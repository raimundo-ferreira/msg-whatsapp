program MsgWhatsapp;

uses
  Vcl.Forms,
  uMain in 'src\uMain.pas' {Form1},
  uMsgWhatsapp in 'src\uMsgWhatsapp.pas',
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Aqua Light Slate');
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
