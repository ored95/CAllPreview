unit MyUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TIntPtr = ^Integer;
  TFill_array = procedure(arr: TIntPtr; const size: Integer) cdecl;
  TCpy = function(str: PChar; str_res: PChar; res_len: Integer): Integer cdecl;

  TApp = class(TForm)
    Show: TButton;
    Size: TLabel;
    SEdit: TEdit;
    Arr: TEdit;
    TClose: TButton;
    ES: TEdit;
    Copy: TButton;
    CS: TEdit;
    procedure ShowClick(Sender: TObject);
    procedure SEditChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TCloseClick(Sender: TObject);
    procedure CopyClick(Sender: TObject);
  private
    { Private declarations }
    Source: HModule;
    fill_array: TFill_array;
    copy_uniq: TCpy;
  public
    { Public declarations }
  end;

var
  App: TApp;

implementation

{$R *.dfm}

procedure TApp.TCloseClick(Sender: TObject);
begin
  FormDestroy(Sender);
  Close;
end;

procedure TApp.CopyClick(Sender: TObject);
var
  Res: string;
  Va: Integer;
begin
  if ES.Text = '' then
    ShowMessage('Error #4: Invalid string input!')
  else
    begin
      Va := copy_uniq(PChar(ES.Text), nil, 0);
      SetLength(Res, Va);
      if copy_uniq(PChar(ES.Text), PChar(Res), Va) = 0 then
        CS.Text := Res;
    end;
end;

procedure TApp.FormCreate(Sender: TObject);
begin
  @fill_array := nil;

  Source := LoadLibrary('C:\Users\BINH\Desktop\C-Delphi\app\Method 2\Cdel.dll'); //
  begin
    ShowMessage('Error #1: Library was not found!');
    Exit;
  end;

  fill_array := GetProcAddress(Source, 'fill_array');
  if @fill_array = nil then
    ShowMessage('Error #2: Function was not called!');

  copy_uniq := GetProcAddress(Source, 'copy_uniq');
  if @copy_uniq = nil then
    ShowMessage('Error #2: Function was not called!');
end;

procedure TApp.FormDestroy(Sender: TObject);
begin
  if Source <> 0 then
    FreeLibrary(Source);
end;

procedure TApp.SEditChange(Sender: TObject);
begin
  Arr.Clear;
end;

procedure TApp.ShowClick(Sender: TObject);
var
  I, N: Integer;
  A: array of Integer;
begin
  Arr.Clear;
  N := StrToInt(SEdit.Text);
  if N > 48 then
    ShowMessage('Error: Such a big size! Try again..')
  else
  begin
    SetLength(A, N);
    Fill_array(@A[0], N);
    for I := Low(A) to High(A) do
      Arr.Text := Arr.Text + IntToStr(A[I]) + #32;
  end;
end;

end.
