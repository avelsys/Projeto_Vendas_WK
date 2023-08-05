unit Vendas.Controller.Entidade.VendaItem;
interface

uses
  Data.DB,
  Generics.Collections,
  Vendas.Controller.Classes.BaseCadastroAtributo,
  Vcl.Dialogs, Vcl.StdCtrls,
  System.SysUtils, Vendas.Controller.Classes.Util,
  Vcl.DBCtrls,
  FireDAC.Comp.Client;

type
  TVendaControllerEntidadeVendaItem = class
  private
    FcdProduto: Integer;
    FcdVendaitem: Integer;
    FcdVenda: Integer;
    FdsNomeProduto: string;
    Fvlunitario: Currency;
    Fqtquantidade: Currency;
    Fvltotal: Currency;
  public

    [TEventoOnExitAtributes('vlunitario')]
    procedure OnExitvlunitario(Sender: TObject);

    [TEventoOnExitAtributes('nmQuantidade')]
    procedure OnExitQuantide(Sender: TObject);

    [TMontaCamposDataSet('cdvendaitem','C�d. Venda', ftAutoInc)]
    property cdVendaitem: Integer read FcdVendaitem write FcdVendaitem;
    [TMontaCamposDataSet('cdvenda','C�d. Venda', ftinteger)]
    property cdVenda: Integer read FcdVenda write FcdVenda;
    [TMontaCamposDataSet('cdproduto','C�d. Produto', ftinteger)]
    property cdproduto: Integer read FcdProduto write FcdProduto;
    [TMontaCamposLooKup('produto','cdproduto','cdproduto','dsnome','Descri��o do Produto',ftString,100)]
    property dsNomeProduto: string read FdsNomeProduto write FdsNomeProduto;
    [TMontaCamposDataSet('vlunitario','Valor Unit�rio', ftBCD, 2)]
    property vlunitario: Currency read Fvlunitario write Fvlunitario;
    [TMontaCamposDataSet('nmQuantidade','Quantidade', ftBCD, 3)]
    property qtquantidade: currency read Fqtquantidade write Fqtquantidade;
    [TMontaCamposDataSet('vltotal','Total', ftBCD, 2)]
    property vltotal: Currency read Fvltotal write Fvltotal;
  end;

implementation

{ TVendaControllerEntidadeVendaItem }

procedure TVendaControllerEntidadeVendaItem.OnExitQuantide(Sender: TObject);
var
  LnmQuantidade: TDBLabeledEdit absolute Sender;
  LDataSet: TFDQuery;
begin
  LDataSet:= LnmQuantidade.DataSource.DataSet as TFDQuery;
  LDataSet.FieldByName('vltotal').value :=  LDataSet.FieldByName('vlunitario').value *
                                            LDataSet.FieldByName('nmQuantidade').value;
end;

procedure TVendaControllerEntidadeVendaItem.OnExitvlunitario(Sender: TObject);
var
  LvlUnitario: TDBLabeledEdit absolute Sender;
  LDataSet: TFDQuery;
begin
  LDataSet:= LvlUnitario.DataSource.DataSet as TFDQuery;
  if (LDataSet.FieldByName('nmQuantidade').IsNull) or
     (LDataSet.FieldByName('nmQuantidade').value <= 0) then
     LDataSet.FieldByName('nmQuantidade').value := 1;

  LDataSet.FieldByName('vltotal').value :=  LDataSet.FieldByName('vlunitario').value *
                                            LDataSet.FieldByName('nmQuantidade').value;
end;

end.
