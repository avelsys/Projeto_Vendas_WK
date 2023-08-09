unit Vendas.View.Frame.Base;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Actions,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.ActnList,
  Vcl.ComCtrls,
  Data.DB,
  Vendas.Model.BaseCadastro, Vendas.Controller.FrameBase,
  Vendas.Controller.Classes.BaseCadastroAtributo,
  Vendas.Dao.Conexao.Mysql,
  Vendas.Controller.Entidade.VendaItem;
type
  TRotinaExterna = procedure(Sender: TObject) of object;

  TframeBase = class(TFrame)
    pnlCenter: TPanel;
    pnlSide: TPanel;
    [TAcoesAtributes(taNovo)]
    btnNew: TButton;
    [TAcoesAtributes(taEditar)]
    btnEdit: TButton;
    [TAcoesAtributes(taExcluir)]
    btnDel: TButton;
    [TAcoesAtributes(taCancelar)]
    btnCan: TButton;
    [TAcoesAtributes(taGravar)]
    btnSaf: TButton;
    pgChildBase: TPageControl;
    [TOperacaoAtributes(csVizualizacao)]
    tbsChildListagem: TTabSheet;
    [TOperacaoAtributes(csEdicao)]
    tbsChildCadastro: TTabSheet;
    dbgFrame: TDBGrid;
    lblTotalizador: TLabel;
  private
    FControllerFrame: iModelBaseCadastro;
    FRotinaExterna: TRotinaExterna;
    FGravarAutomatico: TRotinaGravaAutomatico;
    FNomeBasePrincipal: string;
    FTotalizador: TLabel;
    FTotalizadorValue: Currency;
    procedure ConfigurarTela;
    function GEtNomeBasePrincipal: string;
    procedure SetNomeBasePrincipal(const Value: string);
    function GetTotalizador: Currency;
    procedure SetTotalizador(const Value: Currency);
  public
    constructor Create(AOwner: TComponent); override;

    property RotinaExterna: TRotinaExterna read FRotinaExterna write FRotinaExterna;
    property GravarAutomatico: TRotinaGravaAutomatico read FGravarAutomatico write FGravarAutomatico;
    property ControllerFrame: iModelBaseCadastro read FControllerFrame write FControllerFrame;
    property NomeBasePrincipal: string read GEtNomeBasePrincipal write SetNomeBasePrincipal;
    property TotalizadorValue: Currency read GetTotalizador write SetTotalizador;
  end;

implementation

{$R *.dfm}

{ TframeBase }

constructor TframeBase.Create(AOwner: TComponent);
begin
  inherited;
  FControllerFrame:= TBaseFrameController.New(Self);
  ConfigurarTela;
end;

function TframeBase.GEtNomeBasePrincipal: string;
begin
  result := Self.FNomeBasePrincipal;
end;

function TframeBase.GetTotalizador: Currency;
begin
  Result := FTotalizadorValue;
end;

procedure TframeBase.SetNomeBasePrincipal(const Value: string);
begin
  Self.FNomeBasePrincipal := Value;
end;

procedure TframeBase.SetTotalizador(const Value: Currency);
begin
  FTotalizadorValue     := Value;
  FTotalizador.Caption  := FTotalizadorValue.ToString;
end;

procedure TframeBase.ConfigurarTela;
begin
  for var Idx := 0 to Pred(pgChildBase.PageCount) do
    pgChildBase.Pages[Idx].TabVisible := False;

  FControllerFrame.IniciarAcao(taBrowse);
end;

end.
