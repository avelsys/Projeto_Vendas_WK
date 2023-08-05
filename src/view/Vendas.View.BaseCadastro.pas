unit Vendas.View.BaseCadastro;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  System.Actions,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.ComCtrls,
  Vcl.ActnList,
  Vcl.Grids,
  Vcl.DBGrids,
  Data.DB,
  FireDAC.Stan.Pool,
  Vendas.Model.Conexao,
  Vendas.Controller.Classes.BaseCadastroAtributo,
  Vendas.Model.BaseCadastro,
  Vendas.Controller.BaseCadastro;

type
  TfrmBaseCadastro = class(TForm)
    pnlTopo: TPanel;
    pnlBase: TPanel;
    lblTituloVendas: TLabel;
    pnlSide: TPanel;
    [TAcoesAtributes(taNovo)]
    btnNovo: TButton;
    [TAcoesAtributes(taEditar)]
    btnAlterar: TButton;
    [TAcoesAtributes(taExcluir)]
    btnExcluir: TButton;
    [TAcoesAtributes(taGravar)]
    btnGravar: TButton;
    [TAcoesAtributes(taCancelar)]
    btnCancelar: TButton;
    [TAcoesAtributes(taSair)]
    btnSair: TButton;
    stbStatus: TStatusBar;
    pgControleTelas: TPageControl;
    [TOperacaoAtributes(csVizualizacao)]
    tbsListagem: TTabSheet;
    [TOperacaoAtributes(csEdicao)]
    tbsFormulario: TTabSheet;
    dbgListagem: TDBGrid;
    gbxInformacao: TGroupBox;
    procedure FormCreate(Sender: TObject);
  private
    FControleBase: iModelBaseCadastro;
  public
    property ControleBase: iModelBaseCadastro read FControleBase write FControleBase;

  end;

implementation

uses
  Vendas.Dao.Conexao.Mysql;

{$R *.dfm}

procedure TfrmBaseCadastro.FormCreate(Sender: TObject);
begin
  for var Idx := 0 to Pred(pgControleTelas.PageCount) do
    pgControleTelas.Pages[Idx].TabVisible := False;

  FControleBase := TControllerVendaBaseCadastro.New(Self);
end;

end.
