object frameBase: TframeBase
  Left = 0
  Top = 0
  Width = 640
  Height = 264
  TabOrder = 0
  object pnlCenter: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 15
    Width = 634
    Height = 203
    Margins.Top = 15
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 527
    ExplicitHeight = 306
    object pgChildBase: TPageControl
      AlignWithMargins = True
      Left = 3
      Top = 10
      Width = 628
      Height = 190
      Margins.Top = 10
      ActivePage = tbsChildListagem
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 521
      ExplicitHeight = 293
      object tbsChildListagem: TTabSheet
        Caption = 'tbsChildListagem'
        object dbgFrame: TDBGrid
          Left = 0
          Top = 0
          Width = 620
          Height = 160
          Align = alClient
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
        end
      end
      object tbsChildCadastro: TTabSheet
        Caption = 'tbsChildCadastro'
        ImageIndex = 1
      end
    end
  end
  object pnlSide: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 224
    Width = 634
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitTop = 213
    object btnNew: TButton
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 60
      Height = 27
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alLeft
      Caption = 'Novo'
      TabOrder = 0
      ExplicitLeft = -11
      ExplicitTop = 2
    end
    object btnEdit: TButton
      AlignWithMargins = True
      Left = 75
      Top = 5
      Width = 60
      Height = 27
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alLeft
      Caption = 'Editar'
      TabOrder = 1
      ExplicitLeft = 53
      ExplicitTop = 2
    end
    object btnDel: TButton
      AlignWithMargins = True
      Left = 215
      Top = 5
      Width = 60
      Height = 27
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alLeft
      Caption = 'Delete'
      TabOrder = 2
      ExplicitLeft = 173
      ExplicitTop = 2
    end
    object btnCan: TButton
      AlignWithMargins = True
      Left = 285
      Top = 5
      Width = 60
      Height = 27
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alLeft
      Caption = 'Cancelar'
      TabOrder = 3
      ExplicitLeft = 5
      ExplicitHeight = 20
    end
    object btnSaf: TButton
      AlignWithMargins = True
      Left = 145
      Top = 5
      Width = 60
      Height = 27
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alLeft
      Caption = 'Gravar'
      TabOrder = 4
      ExplicitLeft = 103
      ExplicitTop = 2
    end
  end
end
