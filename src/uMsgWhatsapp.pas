unit uMsgWhatsapp;

interface

uses
  System.Classes;

type
  IMsgWhatsapp = interface
    ['{6B455ACC-72A2-4B84-910F-3D4C9D66A66E}']
    function SetNumero(const aValue: string): IMsgWhatsapp;
    function SetNome(const aValue: string): IMsgWhatsapp;
    function SetAssunto(const aValue: string): IMsgWhatsapp;
    function SetEmail(const aValue: string): IMsgWhatsapp;
    function SetMensagem(const aValue: TStrings): IMsgWhatsapp;
    procedure Enviar;
  end;

  TMsgWhatsapp = class(TInterfacedObject, IMsgWhatsapp)
  private
    fNumero: string;
    fNome: string;
    fAssunto: string;
    fEmail: string;
    fMensagem: TStrings;
    function SomenteNumeros(const aString: string): string;
    procedure Validacao;
    function GetUrlParamsMsg: string;
  public
    class function New: IMsgWhatsapp;
    function SetNumero(const aValue: string): IMsgWhatsapp;
    function SetNome(const aValue: string): IMsgWhatsapp;
    function SetAssunto(const aValue: string): IMsgWhatsapp;
    function SetEmail(const aValue: string): IMsgWhatsapp;
    function SetMensagem(const aValue: TStrings): IMsgWhatsapp;
    procedure Enviar;
  end;

implementation

uses
  System.SysUtils, Winapi.Windows, Winapi.ShellAPI;

{ TMsgWhatsapp }

procedure TMsgWhatsapp.Enviar;
var
  UrlParams: string;
  I: Integer;
begin
  Validacao;
  UrlParams := GetUrlParamsMsg;
  try
    ShellExecute(GetDesktopWindow, 'open', PChar(UrlParams), '', '', SW_SHOWNORMAL)
  except on E: Exception do
    raise Exception.Create('Error ao abrir navegador padrão!' + sLineBreak + E.Message);
  end;
end;

function TMsgWhatsapp.GetUrlParamsMsg: string;
var
  I: Integer;
begin
  Result := 'https://api.whatsapp.com/send?phone=55'+ fNumero +
            '&text=‼ *-----NOVO CONTATO-----* ‼%0A%0ANome: *'+ fNome +
            '*%0AAssunto: *'+fAssunto+'*.%0A%0A📨 E-mail: '+fEmail+
            '%0A%0A*Mensagem:*%0A';

  for I := 0 to fMensagem.Count - 1 do
    Result := Result + fMensagem[I] + '%0A';

  Result := Result + '%0A🍔🍟🌭🍕🍰🥤🍨🥧🍛🍩%0A';
end;

class function TMsgWhatsapp.New: IMsgWhatsapp;
begin
  Result := Self.Create;
end;

function TMsgWhatsapp.SetAssunto(const aValue: string): IMsgWhatsapp;
begin
  Result := Self;
  fAssunto := aValue;
end;

function TMsgWhatsapp.SetEmail(const aValue: string): IMsgWhatsapp;
begin
  Result := Self;
  fEmail := aValue;
end;

function TMsgWhatsapp.SetMensagem(const aValue: TStrings): IMsgWhatsapp;
begin
  Result := Self;
  fMensagem := aValue;
end;

function TMsgWhatsapp.SetNome(const aValue: string): IMsgWhatsapp;
begin
  Result := Self;
  fNome := aValue;
end;

function TMsgWhatsapp.SetNumero(const aValue: string): IMsgWhatsapp;
begin
  Result := Self;
  fNumero := SomenteNumeros(aValue);
end;

function TMsgWhatsapp.SomenteNumeros(const aString: string): string;
var
  Texto : PChar;
begin
  Texto := PChar(aString);
  Result := EmptyStr;
  while (Texto^ <> #0) do
  begin
    {$IFDEF UNICODE}
    if CharInSet(Texto^, ['0'..'9']) then
    {$ELSE}
    if Texto^ in ['0'..'9'] then
    {$ENDIF}
      Result := Result + Texto^;
    Inc(Texto)
  end;
end;

procedure TMsgWhatsapp.Validacao;
begin
  if (Length(fNumero) <> 11) then
    raise Exception.Create('O número do wahtsapp com DDD deve ter 11 número.');
  if Trim(fMensagem.Text) = EmptyStr then
    raise Exception.Create('A mensagem é inválida.');
end;

end.
