unit MyUnit;

interface

type
  TIntPtr = ^Integer;

procedure fill_array(arr: TIntPtr; const size: Integer) cdecl;

function copy_uniq(str: PChar; str_res: PChar; res_len: Integer): Integer cdecl;

implementation

const
  DllSource = 'C:\Users\BINH\Desktop\C-Delphi\app\Method 1\cdel.dll';

procedure fill_array; external DllSource;

function copy_uniq; external DllSource;

end.
