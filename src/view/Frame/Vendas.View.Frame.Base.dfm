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
    object lblTotalizador: TLabel
      AlignWithMargins = True
      Left = 500
      Top = 5
      Width = 119
      Height = 27
      Margins.Top = 5
      Margins.Right = 15
      Margins.Bottom = 5
      Align = alRight
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitLeft = 512
      ExplicitTop = 3
      ExplicitHeight = 31
    end
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
    end
  end
end
