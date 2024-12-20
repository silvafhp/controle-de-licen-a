inherited PageSoftwares: TPageSoftwares
  Caption = 'Cadastro de Softwares'
  PixelsPerInch = 96
  TextHeight = 19
  inherited pnlPrincipal: TPanel
    inherited pnlTop: TPanel
      inherited lblPage: TLabel
        Width = 810
        Height = 57
        Caption = 'Cadastro de Softwares'
        ExplicitWidth = 185
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
                    FieldName = 'NOME'
                    Width = 327
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DESCRICAO'
                    Width = 412
                    Visible = True
                  end>
              end
            end
          end
        end
        inherited cardCadastro: TCard
          inherited pnlCadastroBody: TPanel
            inherited pnlCadastroCampos: TPanel
              object pnlModulos: TStackPanel
                Left = 410
                Top = 30
                Width = 320
                Height = 300
                Align = alRight
                BevelOuter = bvNone
                ControlCollection = <
                  item
                    Control = Label2
                    HorizontalPositioning = sphpFill
                    VerticalPositioning = spvpTop
                  end
                  item
                    Control = edtClientSecret
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
                    Control = pnlModulosBotoes
                    HorizontalPositioning = sphpFill
                    VerticalPositioning = spvpFill
                  end
                  item
                    HorizontalPositioning = sphpFill
                    VerticalPositioning = spvpFill
                  end>
                Padding.Left = 10
                Spacing = 4
                TabOrder = 0
                ExplicitTop = 24
                object Label2: TLabel
                  Left = 10
                  Top = 0
                  Width = 310
                  Height = 19
                  Align = alTop
                  Caption = 'Client Secret'
                end
                object edtClientSecret: TEdit
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
                object listModulos: TListBox
                  Left = 10
                  Top = 77
                  Width = 310
                  Height = 135
                  Align = alClient
                  ItemHeight = 19
                  TabOrder = 0
                  OnDblClick = listModulosDblClick
                end
                object pnlModulosBotoes: TPanel
                  Left = 10
                  Top = 216
                  Width = 310
                  Height = 41
                  Align = alClient
                  BevelOuter = bvNone
                  TabOrder = 1
                  object btnRemoverModulo: TSpeedButton
                    Left = 216
                    Top = 0
                    Width = 94
                    Height = 41
                    Align = alRight
                    Caption = 'REMOVER'
                    Flat = True
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    Layout = blGlyphTop
                    ParentFont = False
                    OnClick = btnRemoverModuloClick
                  end
                  object btnAdicionarModulo: TSpeedButton
                    Left = 122
                    Top = 0
                    Width = 94
                    Height = 41
                    Align = alRight
                    Caption = 'ADICIONAR'
                    Flat = True
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    Layout = blGlyphTop
                    ParentFont = False
                    OnClick = btnAdicionarModuloClick
                    ExplicitLeft = 216
                  end
                end
              end
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
                    Control = edtNome
                    HorizontalPositioning = sphpFill
                    VerticalPositioning = spvpFill
                  end
                  item
                    Control = Label6
                    HorizontalPositioning = sphpFill
                    VerticalPositioning = spvpTop
                  end
                  item
                    Control = edtDescricao
                    HorizontalPositioning = sphpFill
                    VerticalPositioning = spvpFill
                  end>
                Padding.Right = 10
                Spacing = 4
                TabOrder = 1
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
                  Caption = 'Nome'
                end
                object edtNome: TEdit
                  Left = 0
                  Top = 77
                  Width = 310
                  Height = 27
                  Align = alClient
                  TabOrder = 1
                end
                object Label6: TLabel
                  Left = 0
                  Top = 108
                  Width = 310
                  Height = 19
                  Align = alTop
                  Caption = 'Descri'#231#227'o'
                end
                object edtDescricao: TEdit
                  Left = 0
                  Top = 131
                  Width = 310
                  Height = 27
                  Align = alClient
                  TabOrder = 2
                end
              end
            end
            inherited pnlCadastroBottom: TPanel
              inherited btnFechar: TSpeedButton
                ExplicitLeft = 700
                ExplicitHeight = 88
              end
            end
          end
        end
      end
    end
  end
end
