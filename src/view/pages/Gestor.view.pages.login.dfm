object PageLogin: TPageLogin
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = 'PageLogin'
  ClientHeight = 584
  ClientWidth = 925
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 925
    Height = 584
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitLeft = -165
    ExplicitTop = -70
    object PnlLeft: TPanel
      Left = 0
      Top = 0
      Width = 370
      Height = 584
      Align = alLeft
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 0
    end
    object PnlRight: TPanel
      Left = 370
      Top = 0
      Width = 555
      Height = 584
      Align = alClient
      BevelOuter = bvNone
      Padding.Left = 50
      Padding.Top = 70
      Padding.Right = 50
      ParentBackground = False
      TabOrder = 1
      DesignSize = (
        555
        584)
      object StackPanel1: TStackPanel
        Left = 23
        Top = 71
        Width = 505
        Height = 441
        Anchors = []
        BevelOuter = bvNone
        ControlCollection = <
          item
            Control = Label2
            HorizontalPositioning = sphpFill
            VerticalPositioning = spvpTop
          end
          item
            Control = Label1
            HorizontalPositioning = sphpFill
            VerticalPositioning = spvpTop
          end
          item
            Control = Panel3
            HorizontalPositioning = sphpFill
            VerticalPositioning = spvpTop
          end
          item
            Control = Label3
            HorizontalPositioning = sphpFill
            VerticalPositioning = spvpTop
          end
          item
            Control = Edit2
            HorizontalPositioning = sphpFill
            VerticalPositioning = spvpTop
          end
          item
            Control = Label4
            HorizontalPositioning = sphpFill
            VerticalPositioning = spvpTop
          end
          item
            Control = Edit1
            HorizontalPositioning = sphpFill
            VerticalPositioning = spvpTop
          end
          item
            Control = Panel4
            HorizontalPositioning = sphpFill
            VerticalPositioning = spvpTop
          end
          item
            Control = BtnEntrar
            HorizontalPositioning = sphpFill
            VerticalPositioning = spvpTop
          end>
        Spacing = 4
        TabOrder = 0
        object Label2: TLabel
          Left = 0
          Top = 0
          Width = 505
          Height = 32
          Align = alTop
          Caption = 'Bem vindo ao Controle de Licen'#231'as'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -24
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label1: TLabel
          Left = 0
          Top = 36
          Width = 505
          Height = 25
          Align = alTop
          Caption = 'Preencha as informa'#231#245'es abaixo para entrar no sistema'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Panel3: TPanel
          Left = 0
          Top = 65
          Width = 505
          Height = 57
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 3
        end
        object Label3: TLabel
          Left = 0
          Top = 126
          Width = 505
          Height = 25
          Align = alTop
          Caption = 'E-mail'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Edit2: TEdit
          Left = 0
          Top = 155
          Width = 505
          Height = 40
          Align = alTop
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -24
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object Label4: TLabel
          Left = 0
          Top = 199
          Width = 505
          Height = 25
          Align = alTop
          Caption = 'Senha'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Edit1: TEdit
          Left = 0
          Top = 228
          Width = 505
          Height = 40
          Align = alTop
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -24
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object Panel4: TPanel
          Left = 0
          Top = 272
          Width = 505
          Height = 41
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 2
        end
        object BtnEntrar: TSpeedButton
          Left = 0
          Top = 317
          Width = 505
          Height = 59
          Align = alTop
          Caption = 'Entrar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -24
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          OnClick = BtnEntrarClick
        end
      end
    end
  end
end
