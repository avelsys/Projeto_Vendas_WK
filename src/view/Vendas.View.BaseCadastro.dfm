object frmBaseCadastro: TfrmBaseCadastro
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Vendas'
  ClientHeight = 599
  ClientWidth = 901
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnCreate = FormCreate
  TextHeight = 15
  object pnlTopo: TPanel
    Left = 0
    Top = 0
    Width = 901
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Color = clHighlight
    Ctl3D = True
    DoubleBuffered = False
    ParentBackground = False
    ParentCtl3D = False
    ParentDoubleBuffered = False
    TabOrder = 0
    object lblTituloVendas: TLabel
      AlignWithMargins = True
      Left = 10
      Top = 3
      Width = 199
      Height = 35
      Margins.Left = 10
      Align = alLeft
      AutoSize = False
      Caption = '...'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
    end
  end
  object pnlBase: TPanel
    Left = 0
    Top = 41
    Width = 771
    Height = 539
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object pgControleTelas: TPageControl
      Left = 0
      Top = 0
      Width = 771
      Height = 539
      ActivePage = tbsFormulario
      Align = alClient
      TabOrder = 0
      object tbsListagem: TTabSheet
        Caption = 'Listagem'
        object dbgListagem: TDBGrid
          Left = 0
          Top = 0
          Width = 763
          Height = 509
          Align = alClient
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
        end
      end
      object tbsFormulario: TTabSheet
        Caption = 'Formulario de Cadastro'
        ImageIndex = 1
        object gbxInformacao: TGroupBox
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 757
          Height = 503
          Align = alClient
          Caption = 'Detalhes do cadatro'
          TabOrder = 0
          object pnlResumo: TPanel
            AlignWithMargins = True
            Left = 5
            Top = 429
            Width = 747
            Height = 69
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 0
            ExplicitLeft = 2
            ExplicitTop = 432
            ExplicitWidth = 753
            object gbxResumo: TGroupBox
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 741
              Height = 63
              Align = alClient
              Caption = 'Resumo'
              TabOrder = 0
              ExplicitLeft = 384
              ExplicitTop = 32
              ExplicitWidth = 185
              ExplicitHeight = 105
            end
          end
        end
      end
    end
  end
  object pnlSide: TPanel
    AlignWithMargins = True
    Left = 774
    Top = 44
    Width = 124
    Height = 533
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 2
    object btnCancelar: TButton
      AlignWithMargins = True
      Left = 5
      Top = 145
      Width = 114
      Height = 25
      Hint = 'Para cancelar as altera'#231#245'es pressione ESC'
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alTop
      Caption = 'Cancelar'
      TabOrder = 0
    end
    object btnNovo: TButton
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 114
      Height = 25
      Hint = 'Para criar um novo registro pressione INSERT'
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alTop
      Caption = 'Novo'
      TabOrder = 1
    end
    object btnAlterar: TButton
      AlignWithMargins = True
      Left = 5
      Top = 40
      Width = 114
      Height = 25
      Hint = 'Para editar um registro pressione ENTER'
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alTop
      Caption = 'Editar'
      TabOrder = 2
    end
    object btnExcluir: TButton
      AlignWithMargins = True
      Left = 5
      Top = 75
      Width = 114
      Height = 25
      Hint = 'Para Excluir um registro pressione DEL'
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alTop
      Caption = 'Excluir'
      TabOrder = 3
    end
    object btnGravar: TButton
      AlignWithMargins = True
      Left = 5
      Top = 110
      Width = 114
      Height = 25
      Hint = 'Para gravar as altera'#231#245'es feita no registro pressione CTRL + S'
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alTop
      Caption = 'Gravar'
      TabOrder = 4
    end
    object btnSair: TButton
      AlignWithMargins = True
      Left = 5
      Top = 503
      Width = 114
      Height = 25
      Hint = 'Para sair do cadastro pressione CTRL + X'
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alBottom
      Caption = 'Sair'
      TabOrder = 5
    end
  end
  object stbStatus: TStatusBar
    Left = 0
    Top = 580
    Width = 901
    Height = 19
    Panels = <>
  end
end
