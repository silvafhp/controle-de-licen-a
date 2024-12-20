inherited PageContratos: TPageContratos
  Caption = 'Cadastro de Contratos'
  PixelsPerInch = 96
  TextHeight = 19
  inherited pnlPrincipal: TPanel
    inherited pnlTop: TPanel
      inherited lblPage: TLabel
        Width = 810
        Height = 57
        Caption = 'Cadastro de Contratos'
        ExplicitWidth = 183
      end
    end
    inherited pnlBody: TPanel
      inherited CardPanel1: TCardPanel
        OnCardChange = CardPanel1CardChange
        inherited cardGrid: TCard
          inherited pnlCardBody: TPanel
            inherited pnlGridBottom: TPanel
              inherited lblRegistros: TLabel
                Left = 0
                Width = 780
                Height = 30
              end
            end
            inherited pnlGrid: TPanel
              inherited gridDados: TDBGrid
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'DESCRICAO'
                    Width = 415
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DATA'
                    Width = 109
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'VENCIMENTO'
                    Width = 110
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'BLOQUEADO'
                    Width = 104
                    Visible = True
                  end>
              end
            end
          end
        end
        inherited cardCadastro: TCard
          inherited pnlCadastroBody: TPanel
            inherited pnlCadastroCampos: TPanel
              object StackPanel2: TStackPanel
                Left = 50
                Top = 30
                Width = 320
                Height = 300
                Align = alLeft
                BevelOuter = bvNone
                ControlCollection = <
                  item
                    Control = Label4
                    HorizontalPositioning = sphpFill
                    VerticalPositioning = spvpTop
                  end
                  item
                    Control = edtID
                    HorizontalPositioning = sphpFill
                    VerticalPositioning = spvpFill
                  end
                  item
                    Control = Label5
                    HorizontalPositioning = sphpFill
                    VerticalPositioning = spvpTop
                  end
                  item
                    Control = cbCliente
                    HorizontalPositioning = sphpFill
                    VerticalPositioning = spvpFill
                  end
                  item
                    Control = Label6
                    HorizontalPositioning = sphpFill
                    VerticalPositioning = spvpTop
                  end
                  item
                    Control = cbSoftware
                    HorizontalPositioning = sphpFill
                    VerticalPositioning = spvpFill
                  end
                  item
                    Control = Label2
                    HorizontalPositioning = sphpFill
                    VerticalPositioning = spvpTop
                  end
                  item
                    Control = dateData
                    HorizontalPositioning = sphpFill
                    VerticalPositioning = spvpFill
                  end
                  item
                    Control = Label3
                    HorizontalPositioning = sphpFill
                    VerticalPositioning = spvpTop
                  end
                  item
                    Control = dateVencimento
                    HorizontalPositioning = sphpFill
                    VerticalPositioning = spvpFill
                  end>
                Padding.Right = 10
                Spacing = 4
                TabOrder = 0
                object Label4: TLabel
                  Left = 0
                  Top = 0
                  Width = 310
                  Height = 19
                  Align = alTop
                  Caption = 'ID'
                end
                object edtID: TEdit
                  Left = 0
                  Top = 23
                  Width = 310
                  Height = 27
                  Align = alClient
                  Enabled = False
                  TabOrder = 0
                end
                object Label5: TLabel
                  Left = 0
                  Top = 54
                  Width = 310
                  Height = 19
                  Align = alTop
                  Caption = 'Cliente'
                end
                object cbCliente: TComboBox
                  Left = 0
                  Top = 77
                  Width = 310
                  Height = 27
                  Align = alClient
                  Style = csDropDownList
                  TabOrder = 1
                end
                object Label6: TLabel
                  Left = 0
                  Top = 108
                  Width = 310
                  Height = 19
                  Align = alTop
                  Caption = 'Software'
                end
                object cbSoftware: TComboBox
                  Left = 0
                  Top = 131
                  Width = 310
                  Height = 27
                  Align = alClient
                  Style = csDropDownList
                  TabOrder = 2
                end
                object Label2: TLabel
                  Left = 0
                  Top = 162
                  Width = 310
                  Height = 19
                  Align = alTop
                  Caption = 'Data'
                end
                object dateData: TDateTimePicker
                  Left = 0
                  Top = 185
                  Width = 310
                  Height = 27
                  Align = alClient
                  Date = 44842.000000000000000000
                  Time = 0.967289814812829700
                  TabOrder = 3
                end
                object Label3: TLabel
                  Left = 0
                  Top = 216
                  Width = 310
                  Height = 19
                  Align = alTop
                  Caption = 'Vencimento'
                end
                object dateVencimento: TDateTimePicker
                  Left = 0
                  Top = 239
                  Width = 310
                  Height = 27
                  Align = alClient
                  Date = 44842.000000000000000000
                  Time = 0.967289814812829700
                  TabOrder = 4
                end
              end
              object pnlModulos: TStackPanel
                Left = 410
                Top = 30
                Width = 320
                Height = 300
                Align = alRight
                BevelOuter = bvNone
                ControlCollection = <
                  item
                    Control = Label8
                    HorizontalPositioning = sphpFill
                    VerticalPositioning = spvpTop
                  end
                  item
                    Control = edtChaveContrato
                    HorizontalPositioning = sphpFill
                    VerticalPositioning = spvpFill
                  end
                  item
                    Control = Label1
                    HorizontalPositioning = sphpFill
                    VerticalPositioning = spvpTop
                  end
                  item
                    Control = listModulos
                    HorizontalPositioning = sphpFill
                    VerticalPositioning = spvpFill
                  end
                  item
                    Control = Panel1
                    HorizontalPositioning = sphpFill
                    VerticalPositioning = spvpFill
                  end
                  item
                    HorizontalPositioning = sphpFill
                    VerticalPositioning = spvpFill
                  end>
                Padding.Left = 10
                Spacing = 4
                TabOrder = 1
                object Label8: TLabel
                  Left = 10
                  Top = 0
                  Width = 310
                  Height = 19
                  Align = alTop
                  Caption = 'Chave'
                end
                object edtChaveContrato: TEdit
                  Left = 10
                  Top = 23
                  Width = 310
                  Height = 27
                  Align = alClient
                  ReadOnly = True
                  TabOrder = 2
                end
                object Label1: TLabel
                  Left = 10
                  Top = 54
                  Width = 310
                  Height = 19
                  Align = alTop
                  Caption = 'M'#243'dulos'
                end
                object listModulos: TCheckListBox
                  Left = 10
                  Top = 77
                  Width = 310
                  Height = 135
                  OnClickCheck = listModulosClickCheck
                  Align = alClient
                  ItemHeight = 19
                  TabOrder = 1
                end
                object Panel1: TPanel
                  Left = 10
                  Top = 216
                  Width = 310
                  Height = 23
                  Align = alClient
                  BevelOuter = bvNone
                  Padding.Top = 3
                  TabOrder = 0
                  object Label7: TLabel
                    Left = 0
                    Top = 3
                    Width = 89
                    Height = 20
                    Align = alLeft
                    AutoSize = False
                    Caption = 'Bloqueado'
                    ExplicitTop = 0
                    ExplicitHeight = 23
                  end
                  object tgBloqueado: TToggleSwitch
                    Left = 89
                    Top = 3
                    Width = 84
                    Height = 20
                    Align = alLeft
                    StateCaptions.CaptionOn = 'Sim'
                    StateCaptions.CaptionOff = 'N'#227'o'
                    TabOrder = 0
                    ExplicitHeight = 21
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
