unit Vendas.Controller.Entidade.Produto;

interface

uses
  Data.DB,
  Vendas.Controller.Classes.BaseCadastroAtributo;
type
  TVendaControllerEntidadeProduto = class
  private
    Fcdproduto: Integer;
    Fdsnome: string;
    Fvlpreco: Currency;
  public
    [TMontaCamposDataSet('cdproduto','C�d. Produto', ftAutoInc)]
    property cdproduto: Integer read Fcdproduto write Fcdproduto;
    [TMontaCamposDataSet('dsnome','Descri��o do produto', ftString, 100)]
    property dsnome: string read Fdsnome write Fdsnome;
    [TMontaCamposDataSet('vlpreco','Pre�o', ftBCD,2)]
    property vlpreco: Currency read Fvlpreco write Fvlpreco;
  end;


implementation

end.
