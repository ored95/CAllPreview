object App: TApp
  Left = 0
  Top = 0
  Caption = 'App'
  ClientHeight = 103
  ClientWidth = 316
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Size: TLabel
    Left = 3
    Top = 8
    Width = 21
    Height = 14
    Caption = 'Size'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Show: TButton
    Left = 64
    Top = 2
    Width = 75
    Height = 25
    Caption = 'Show array'
    TabOrder = 0
    OnClick = ShowClick
  end
  object SEdit: TEdit
    Left = 27
    Top = 4
    Width = 33
    Height = 21
    Alignment = taRightJustify
    NumbersOnly = True
    TabOrder = 1
    Text = '5'
    OnChange = SEditChange
  end
  object Arr: TEdit
    Left = 143
    Top = 4
    Width = 170
    Height = 21
    ReadOnly = True
    TabOrder = 2
  end
  object TClose: TButton
    Left = 238
    Top = 75
    Width = 75
    Height = 25
    Caption = 'Exit'
    TabOrder = 3
    OnClick = TCloseClick
  end
  object ES: TEdit
    Left = 8
    Top = 48
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object Copy: TButton
    Left = 135
    Top = 46
    Width = 55
    Height = 25
    Caption = 'Copy'
    TabOrder = 5
    OnClick = CopyClick
  end
  object CS: TEdit
    Left = 196
    Top = 48
    Width = 117
    Height = 21
    ReadOnly = True
    TabOrder = 6
  end
end
