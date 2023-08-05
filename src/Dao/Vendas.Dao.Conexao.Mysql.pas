unit Vendas.Dao.Conexao.Mysql;

interface

uses
  FireDAC.Comp.Client,
  Vendas.Dao.Conexao.Pool,
  Vendas.Model.Conexao;

const
  csNOME_CONEXAO   = 'MYSQL_CONNECTION';
  csHOSTNAME       = 'localhost';
  csDATABASE       = 'DBVendas';
  csUSER           = 'root';
  csPASSWORD       = '12936511';
  csDRIVER_CONEXAO = 'MYSQL_CONN';
  csDRIVER         = 'MYSQL';
  csVENDOR_LIBRARY = 'D:\projetos\ProjetoVendas_WK\bin\debug\libmariadb.dll';

type
  TVencasDaoConexaoMySql = class(TInterfacedObject, iConexao)
  private
    FConexaoPool: iConexaoPool;
    constructor Create;
  public
    destructor Destroy; override;
    class function New : iConexao;
    function SetarConexao(out AQuery: TFDQuery): iConexao; overload;
    function IsConected: Boolean;
    function Commit: iConexao;
    function RollBack: iConexao;
    function AbreTransacao: iConexao;
    function PegarConexao: TFDConnection;
  end;

implementation

function TVencasDaoConexaoMySql.AbreTransacao: iConexao;
begin
  Result := Self;
  FConexaoPool.PegarConexao.StartTransaction;
end;

function TVencasDaoConexaoMySql.Commit: iConexao;
begin
  Result := Self;
  FConexaoPool.PegarConexao.Commit;
end;

constructor TVencasDaoConexaoMySql.Create;
var
  LConnectionDefParams: TConnectionDefParams;
begin
  LConnectionDefParams.ConnectionDefName := csNOME_CONEXAO;
  LConnectionDefParams.Server            := csHOSTNAME;
  LConnectionDefParams.Database          := csDATABASE;
  LConnectionDefParams.UserName          := csUSER;
  LConnectionDefParams.Password          := csPASSWORD;
  LConnectionDefParams.DriverName        := csDRIVER_CONEXAO;
  LConnectionDefParams.Driver            := csDRIVER;
  LConnectionDefParams.VendorLib         := csVENDOR_LIBRARY;
  LConnectionDefParams.LocalConnection   := True;
  FConexaoPool:= TVendasDaoConexaoPool.New(LConnectionDefParams);
end;

destructor TVencasDaoConexaoMySql.Destroy;
begin
  inherited;
end;

function TVencasDaoConexaoMySql.IsConected: Boolean;
begin
  Result := FConexaoPool.IsConnected;
end;

class function TVencasDaoConexaoMySql.New : iConexao;
begin
  Result := Self.Create;
end;

function TVencasDaoConexaoMySql.PegarConexao: TFDConnection;
begin
  Result := FConexaoPool.PegarConexao;
end;

function TVencasDaoConexaoMySql.SetarConexao(out AQuery: TFDQuery): iConexao;
begin
  result:= Self;
  FConexaoPool.SetarConexao(AQuery);
end;

function TVencasDaoConexaoMySql.RollBack: iConexao;
begin
  result := Self;
  FConexaoPool.PegarConexao.Rollback;
end;

end.

