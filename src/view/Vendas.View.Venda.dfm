inherited frmVenda: TfrmVenda
  ClientHeight = 438
  ClientWidth = 1056
  ExplicitWidth = 1056
  ExplicitHeight = 438
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
    Height = 378
    ExplicitWidth = 926
    ExplicitHeight = 378
    inherited pgControleTelas: TPageControl
      Width = 926
      Height = 378
      ExplicitTop = 0
      ExplicitWidth = 926
      ExplicitHeight = 378
      inherited tbsListagem: TTabSheet
        ExplicitWidth = 918
        ExplicitHeight = 348
        inherited dbgListagem: TDBGrid
          Width = 918
          Height = 348
        end
      end
      inherited tbsFormulario: TTabSheet
        ExplicitWidth = 918
        ExplicitHeight = 348
        inherited gbxInformacao: TGroupBox
          Width = 912
          Height = 342
          ExplicitWidth = 912
          ExplicitHeight = 342
          inline frameItemVendas: TframeVendaItem
            Left = 2
            Top = 56
            Width = 908
            Height = 284
            Align = alBottom
            TabOrder = 0
            ExplicitLeft = 2
            ExplicitTop = 56
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
              inherited btnNew: TButton
                ExplicitLeft = 5
                ExplicitTop = 5
              end
              inherited btnEdit: TButton
                ExplicitLeft = 75
                ExplicitTop = 5
              end
              inherited btnDel: TButton
                ExplicitLeft = 215
                ExplicitTop = 5
              end
              inherited btnCan: TButton
                ExplicitLeft = 285
                ExplicitHeight = 27
              end
              inherited btnSaf: TButton
                ExplicitLeft = 145
                ExplicitTop = 5
              end
            end
          end
        end
      end
    end
  end
  inherited pnlSide: TPanel
    Left = 929
    Height = 372
    ExplicitLeft = 929
    ExplicitHeight = 372
    inherited btnSair: TButton
      Top = 342
      ExplicitTop = 342
    end
  end
  inherited stbStatus: TStatusBar
    Top = 419
    Width = 1056
    ExplicitTop = 419
    ExplicitWidth = 1056
  end
end
