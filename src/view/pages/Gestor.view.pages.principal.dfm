object PagePrincipal: TPagePrincipal
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = 'PagePrincipal'
  ClientHeight = 442
  ClientWidth = 709
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -29
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 35
  object pnlPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 709
    Height = 442
    Align = alClient
    BevelOuter = bvNone
    Padding.Top = 35
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 0
      Top = 35
      Width = 709
      Height = 35
      Align = alTop
      Alignment = taCenter
      Caption = 'P'#225'gina Principal'
      ExplicitWidth = 201
    end
  end
end
