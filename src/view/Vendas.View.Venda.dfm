inherited frmVenda: TfrmVenda
  ClientHeight = 546
  ClientWidth = 1056
  ExplicitWidth = 1056
  ExplicitHeight = 546
  TextHeight = 15
  inherited pnlTopo: TPanel
    Width = 1056
    ExplicitWidth = 1056
    inherited lblTituloVendas: TLabel
      ExplicitLeft = 7
      ExplicitTop = 0
    end
  end
  inherited pnlBase: TPanel
    Width = 926
    Height = 486
    ExplicitWidth = 926
    ExplicitHeight = 486
    inherited pgControleTelas: TPageControl
      Width = 926
      Height = 486
      ExplicitWidth = 926
      ExplicitHeight = 486
      inherited tbsListagem: TTabSheet
        ExplicitWidth = 918
        ExplicitHeight = 456
        inherited dbgListagem: TDBGrid
          Width = 918
          Height = 456
        end
      end
      inherited tbsFormulario: TTabSheet
        ExplicitWidth = 918
        ExplicitHeight = 456
        inherited gbxInformacao: TGroupBox
          Width = 912
          Height = 450
          ExplicitWidth = 912
          ExplicitHeight = 450
          inline frameItemVendas: TframeVendaItem [0]
            Left = 2
            Top = 89
            Width = 908
            Height = 284
            Align = alBottom
            TabOrder = 0
            ExplicitLeft = 2
            ExplicitTop = 89
            ExplicitWidth = 908
            ExplicitHeight = 284
            inherited pnlCenter: TPanel
              Width = 902
              Height = 223
              ExplicitWidth = 902
              ExplicitHeight = 223
              inherited pgChildBase: TPageControl
                Width = 896
                Height = 210
                ExplicitWidth = 896
                ExplicitHeight = 210
                inherited tbsChildListagem: TTabSheet
                  ExplicitWidth = 888
                  ExplicitHeight = 180
                  inherited dbgFrame: TDBGrid
                    Width = 888
                    Height = 180
                  end
                end
              end
            end
            inherited pnlSide: TPanel
              Top = 244
              Width = 902
              ExplicitTop = 244
              ExplicitWidth = 902
            end
          end
          inherited pnlResumo: TPanel
            Top = 376
            Width = 902
            TabOrder = 1
            ExplicitLeft = 5
            ExplicitTop = 376
            ExplicitWidth = 902
            inherited gbxResumo: TGroupBox
              Width = 896
              ExplicitLeft = 3
              ExplicitTop = 3
              ExplicitWidth = 896
              ExplicitHeight = 63
            end
          end
        end
      end
    end
  end
  inherited pnlSide: TPanel
    Left = 929
    Height = 480
    ExplicitLeft = 929
    ExplicitHeight = 480
    inherited btnSair: TButton
      Top = 450
      ExplicitTop = 450
    end
  end
  inherited stbStatus: TStatusBar
    Top = 527
    Width = 1056
    ExplicitTop = 527
    ExplicitWidth = 1056
  end
end
