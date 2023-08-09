unit Vendas.Controller.Entidade.Venda;

interface

uses
  Data.DB,
  Generics.Collections,
  Vendas.Controller.Classes.BaseCadastroAtributo;

type
  TVendaControllerEntidadeVendas = class
  private
    FcdVenda: Integer;
    FcdCliente: Integer;
    FdtEmissao: TDate;
    FdsNomeCliente: string;
    Fvltotal: Currency;
  public
    [TMontaCamposDataSet('cdvenda','C�d. Venda', ftAutoInc)]
    property cdVenda: Integer read FcdVenda write FcdVenda;
    [TMontaCamposDataSet('cdcliente','C�d. Cliente', ftinteger)]
    property cdCliente: Integer read FcdCliente write FcdCliente;
    [TMontaCamposLooKup('cliente','cdcliente','cdcliente','dsnome','Nome do Cliente',ftString,100)]
    property dsNomeCliente: string read FdsNomeCliente write FdsNomeCliente;
    [TMontaCamposDataSet('dtemissao','Dt Emiss�o', ftDate)]
    property dtEmissao: TDate read FdtEmissao write FdtEmissao;
    [TMontaCamposDataSet('vltotal','Total', ftBCD,2, true)]
    property vltotal: Currency read Fvltotal write Fvltotal;
  end;

implementation

{ TVendaControllerEntidadeVendas }

end.
