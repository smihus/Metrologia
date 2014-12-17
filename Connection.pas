unit Connection;

interface
uses
  SMBLocalSettings, Data.Win.ADODB, Vcl.Forms;

procedure MakeConnection(const Application: TApplication; var mainConnection: TADOConnection;
  var FLocalSettings: TSMBLocalSettings);

implementation
uses
  System.SysUtils, DBConst, Vcl.Dialogs, System.UITypes;

procedure MakeConnection(const Application: TApplication; var mainConnection: TADOConnection;
  var FLocalSettings: TSMBLocalSettings);
var
  AFileName: string;
  odOpenDB: TOpenDialog;
  ErrorMsg: string;
begin
  AFileName := ExtractFileDir(Application.ExeName) + '\' + DBName;
  odOpenDB := TOpenDialog.Create(nil);

  if not FileExists(AFileName) then
  begin
    AFileName := FLocalSettings['DBFilePath'];
    if not FileExists(AFileName) then
    begin
      odOpenDB := TOpenDialog.Create(nil);
      with odOpenDB do
      begin
        Options             := [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing];
        odOpenDB.DefaultExt := 'mdb';
        odOpenDB.Filter     := 'Базы данных Microsoft Access|*.mdb';
        odOpenDB.Title      := 'Укажите путь к базе данных';
        while not FileExists(AFileName) do
        begin
          if odOpenDB.Execute then
          begin
            AFileName := odOpenDB.FileName;
            if not FileExists(AFileName) then
              if MessageDlg('Указанный файл не существует. Хотите выбрать другой файл?',
                mtError, mbYesNo, 0, mbYes) = mrNo then
                  Halt(1);
          end;
        end;
      end;
    end;
  end;
  try
    mainConnection.ConnectionString :='Provider=Microsoft.Jet.OLEDB.4.0;' +
      'Data Source=' + AFileName + ';Persist Security Info=False;' +
      'Jet OLEDB:Database Password=' + Password + ';';
    mainConnection.Connected := True;
  except
    on E: Exception do
    begin
      ErrorMsg := E.Message;
      if ErrorMsg = 'Ошибочный пароль' then
        ErrorMsg := 'Ошибка соединения с базой данных!' + sLineBreak +
          'Вы пытаетесь использовать старую версию базы данных.' + sLineBreak +
          'Получите у администратора свежую версию базы данных.'
      else
        ErrorMsg := 'Ошибка соединения с базой данных! Обратитесь к администратору.';

      MessageDlg(ErrorMsg, mtError, [mbOK], 0);
      odOpenDB.Free;
      Halt(1);
    end;
  end;
  FLocalSettings['DBFilePath'] := AFileName;
end;

end.
