inherited PageClientes: TPageClientes
  Caption = 'Cadastro de Clientes'
  PixelsPerInch = 96
  TextHeight = 19
  inherited pnlPrincipal: TPanel
    inherited pnlTop: TPanel
      inherited lblPage: TLabel
        Caption = 'Cadastro de Clientes'
        ExplicitWidth = 169
      end
    end
    inherited pnlBody: TPanel
      inherited CardPanel1: TCardPanel
        inherited cardGrid: TCard
          inherited pnlGridTop: TPanel
            Padding.Bottom = 0
            inherited btnNovo: TSpeedButton
              Height = 88
              ExplicitHeight = 88
            end
            inherited btnAtualizar: TSpeedButton
              Height = 88
            end
          end
          inherited pnlCardBody: TPanel
            inherited pnlGrid: TPanel
              inherited gridDados: TDBGrid
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'NOME'
                    Width = 438
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CNPJ'
                    Width = 300
                    Visible = True
                  end>
              end
            end
          end
        end
        inherited cardCadastro: TCard
          inherited pnlCadastroBody: TPanel
            inherited pnlCadastroCampos: TPanel
              Padding.Top = 20
              object StackPanel1: TStackPanel
                Left = 50
                Top = 20
                Width = 320
                Height = 310
                Align = alLeft
                BevelOuter = bvNone
                ControlCollection = <
                  item
                    Control = Label1
                    HorizontalPositioning = sphpFill
                    VerticalPositioning = spvpTop
                  end
                  item
                    Control = edtID
                    HorizontalPositioning = sphpFill
                    VerticalPositioning = spvpFill
                  end
                  item
                    Control = Label2
                    HorizontalPositioning = sphpFill
                    VerticalPositioning = spvpTop
                  end
                  item
                    Control = edtNome
                    HorizontalPositioning = sphpFill
                    VerticalPositioning = spvpFill
                  end
                  item
                    Control = Label3
                    HorizontalPositioning = sphpFill
                    VerticalPositioning = spvpTop
                  end
                  item
                    Control = edtCNPJ
                    HorizontalPositioning = sphpFill
                    VerticalPositioning = spvpFill
                  end>
                Spacing = 4
                TabOrder = 0
                object Label1: TLabel
                  Left = 0
                  Top = 0
                  Width = 320
                  Height = 19
                  Align = alTop
                  Caption = 'ID'
                end
                object edtID: TEdit
                  Left = 0
                  Top = 23
                  Width = 320
                  Height = 27
                  Align = alClient
                  Enabled = False
                  TabOrder = 0
                end
                object Label2: TLabel
                  Left = 0
                  Top = 54
                  Width = 320
                  Height = 19
                  Align = alTop
                  Caption = 'Nome'
                end
                object edtNome: TEdit
                  Left = 0
                  Top = 77
                  Width = 320
                  Height = 27
                  Align = alClient
                  TabOrder = 1
                end
                object Label3: TLabel
                  Left = 0
                  Top = 108
                  Width = 320
                  Height = 19
                  Align = alTop
                  Caption = 'CNPJ'
                end
                object edtCNPJ: TEdit
                  Left = 0
                  Top = 131
                  Width = 320
                  Height = 27
                  Align = alClient
                  TabOrder = 2
                end
              end
            end
          end
        end
      end
    end
  end
end
