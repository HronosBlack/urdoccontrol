unit main;

{$mode objfpc}{$H+}

interface

uses
		Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs,
		IniPropStorage;

type

		{ TMainForm }

  TMainForm = class(TForm)
				AppSettings: TIniPropStorage;
				procedure FormActivate(Sender: TObject);
		private
				{ private declarations }
		public
				{ public declarations }
		end;

var
		MainForm: TMainForm;

implementation

{$R *.lfm}

{ TMainForm }

procedure TMainForm.FormActivate(Sender: TObject);
begin
    AppSettings.IniSection	:= 'GLOBAL';
    Caption 				:= StringReplace(Caption, '[APP_NAME]', AppSettings.ReadString('AppName',''), [rfReplaceAll, rfIgnoreCase]);
    Caption 				:= StringReplace(Caption, '[ver]', AppSettings.ReadString('AppVersion',''), [rfReplaceAll, rfIgnoreCase]);
end;

end.

