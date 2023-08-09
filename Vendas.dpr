program Vendas;

uses
  Vcl.Forms,
  Vendas.View.BaseCadastro in 'src\view\Vendas.View.BaseCadastro.pas' {frmBaseCadastro},
  Vendas.Model.BaseCadastro in 'src\Model\Vendas.Model.BaseCadastro.pas',
  Vendas.Controller.BaseCadastro in 'src\Controller\Vendas.Controller.BaseCadastro.pas',
  Vendas.Controller.Classes.BaseCadastroAtributo in 'src\Controller\Classes\Vendas.Controller.Classes.BaseCadastroAtributo.pas',
  Vendas.Model.Conexao in 'src\Model\Vendas.Model.Conexao.pas',
  Vendas.Controller.FrameBase in 'src\Controller\Vendas.Controller.FrameBase.pas',
  Vendas.Dao.Conexao.Pool in 'src\Dao\Vendas.Dao.Conexao.Pool.pas',
  Vendas.Dao.Conexao.Mysql in 'src\Dao\Vendas.Dao.Conexao.Mysql.pas',
  Vendas.View.Venda in 'src\view\Vendas.View.Venda.pas' {frmVenda},
  Vendas.Controller.Entidade.Venda in 'src\Controller\Entidade\Vendas.Controller.Entidade.Venda.pas',
  Vendas.Controller.Classes.CriaEventosAnonimous in 'src\Controller\Classes\Vendas.Controller.Classes.CriaEventosAnonimous.pas',
  Vendas.Controller.Entidade.Cliente in 'src\Controller\Entidade\Vendas.Controller.Entidade.Cliente.pas',
  Vendas.Controller.Classes.Constantes in 'src\Controller\Classes\Vendas.Controller.Classes.Constantes.pas',
  Vendas.Controller.Construtores in 'src\Controller\Vendas.Controller.Construtores.pas',
  Vendas.Controller.Entidade.VendaItem in 'src\Controller\Entidade\Vendas.Controller.Entidade.VendaItem.pas',
  Vendas.View.Frame.Base in 'src\view\Frame\Vendas.View.Frame.Base.pas' {frameBase: TFrame},
  Vendas.View.Frame.VendaItem in 'src\view\Frame\Vendas.View.Frame.VendaItem.pas' {frameVendaItem: TFrame},
  Vendas.Controller.Entidade.Produto in 'src\Controller\Entidade\Vendas.Controller.Entidade.Produto.pas',
  Vendas.Controller.Classes.Util in 'src\Controller\Classes\Vendas.Controller.Classes.Util.pas',
  Vendas.Model.LabelEditDB in 'src\Model\Vendas.Model.LabelEditDB.pas';

{$R *.res}

begin
  Application.Initialize;
  {$IFDEF DEBUG}
    ReportMemoryLeaksOnShutdown := True;
  {$ENDIF}
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmVenda, frmVenda);
  Application.Run;
end.
