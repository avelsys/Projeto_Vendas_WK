unit Vendas.Dao.Conexao.Pool;

interface

uses
  System.SysUtils,
  System.Types,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Phys,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,

  //Mysql
  FireDAC.Phys.MySQLDef,
  FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLWrapper,

  Vendas.Model.Conexao;

type
  TVendasDaoConexaoPool = class(TInterfacedObject, iConexaoPool)
  protected
    constructor Create(const AConnectionDefParams: TConnectionDefParams);
  private
    FConnectionName: string;
    FDriveName: string;
    FDriver: string;
    FConexao: TFDConnection;
    function ConfigurarConexao(
      const AConnectionDefDriverParams: TConnectionDefDriverParams;
      const AConnectionDefParams: TConnectionDefParams;
      const AConnectionDefPoolParams: TConnectionDefPoolParams): iConexaoPool; overload;

    procedure DefinirParametroConexaoMysql(
      AConnectionDefParams: TConnectionDefParams;
      AConnectionDefDriverParams: TConnectionDefDriverParams;
      AFDStanConnectionDef: IFDStanConnectionDef;
      AConnectionDefPoolParams: TConnectionDefPoolParams);

  public
    destructor Destroy; override;
    class function New(const AConnectionDefParams: TConnectionDefParams) : iConexaoPool;
    function SetarConexao(out AQuery: TFDQuery): iConexaoPool;
    function PegarConexao: TFDConnection;
    function IsConnected: Boolean;
  end;

implementation

resourcestring
  csBASE_DRIVER_ID_FIREBIRD = 'BaseDriverID';
  csVENDOR_LIB = 'VendorLib';

constructor TVendasDaoConexaoPool.Create(const AConnectionDefParams: TConnectionDefParams);
var
  LConnectionDefDriverParams: TConnectionDefDriverParams;
  LConnectionDefParams: TConnectionDefParams;
  LConnectionDefPoolParams: TConnectionDefPoolParams;
begin
  FDriver:= AConnectionDefParams.Driver;
  FDriveName:= AConnectionDefParams.DriverName;
  FConnectionName := AConnectionDefParams.ConnectionDefName;

  LConnectionDefDriverParams.DriverDefName := FDriver;

  if not AConnectionDefParams.VendorLib.IsEmpty then
    LConnectionDefDriverParams.VendorLib := AConnectionDefParams.VendorLib;

  LConnectionDefParams.ConnectionDefName := FConnectionName;
  LConnectionDefParams.Server := AConnectionDefParams.Server;
  LConnectionDefParams.Database := AConnectionDefParams.Database;
  LConnectionDefParams.UserName := AConnectionDefParams.UserName;
  LConnectionDefParams.Password := AConnectionDefParams.Password;
  LConnectionDefParams.LocalConnection := True;

  LConnectionDefPoolParams.Pooled := true;
  LConnectionDefPoolParams.PoolMaximumItems := 50;
  LConnectionDefPoolParams.PoolCleanupTimeout := 30000;
  LConnectionDefPoolParams.PoolExpireTimeout := 60000;

  ConfigurarConexao(LConnectionDefDriverParams,
                    LConnectionDefParams,
                    LConnectionDefPoolParams);

  FConexao := TFDConnection.Create(nil);
end;

function TVendasDaoConexaoPool.ConfigurarConexao(
      const AConnectionDefDriverParams: TConnectionDefDriverParams;
      const AConnectionDefParams: TConnectionDefParams;
      const AConnectionDefPoolParams: TConnectionDefPoolParams): iConexaoPool;
var
  LConnection: TFDCustomConnection;
  LFDStanConnectionDef: IFDStanConnectionDef;
  LFDStanDefinition: IFDStanDefinition;
begin
  Result := Self;
  FDManager.CloseConnectionDef(AConnectionDefParams.ConnectionDefName);
  FDManager.ActiveStoredUsage := [auRunTime];
  FDManager.ConnectionDefFileAutoLoad := False;
  FDManager.DriverDefFileAutoLoad := False;
  FDManager.SilentMode := True;

  LFDStanDefinition := FDManager.DriverDefs.FindDefinition(AConnectionDefDriverParams.DriverDefName);
  if not Assigned(FDManager.DriverDefs.FindDefinition(AConnectionDefDriverParams.DriverDefName)) then
  begin
    LFDStanDefinition := FDManager.DriverDefs.Add;
    LFDStanDefinition.Name := AConnectionDefDriverParams.DriverDefName;
  end;
  LFDStanDefinition.AsString[csBASE_DRIVER_ID_FIREBIRD] := FDriver;
  if not AConnectionDefDriverParams.VendorLib.Trim.IsEmpty then
    LFDStanDefinition.AsString[csVENDOR_LIB] := AConnectionDefDriverParams.VendorLib;

  LFDStanConnectionDef := FDManager.ConnectionDefs.FindConnectionDef(AConnectionDefParams.ConnectionDefName);
  if not Assigned(FDManager.ConnectionDefs.FindConnectionDef(AConnectionDefParams.ConnectionDefName)) then
  begin
    LFDStanConnectionDef := FDManager.ConnectionDefs.AddConnectionDef;
    LFDStanConnectionDef.Name := AConnectionDefParams.ConnectionDefName;
  end;

  DefinirParametroConexaoMysql(AConnectionDefParams,
                               AConnectionDefDriverParams,
                               LFDStanConnectionDef,
                               AConnectionDefPoolParams);

  LConnection := TFDCustomConnection.Create(nil);
  try
    LConnection.FetchOptions.Mode := TFDFetchMode.fmAll; //fmAll
    LConnection.ResourceOptions.AutoConnect := False;

    with LConnection.FormatOptions.MapRules.Add do
    begin
      SourceDataType := dtDateTime; { TFDParam.DataType }
      TargetDataType := dtDateTimeStamp; { Firebird TIMESTAMP }
    end;

    LFDStanConnectionDef.WriteOptions(LConnection.FormatOptions,
                                      LConnection.UpdateOptions,
                                      LConnection.FetchOptions,
                                      LConnection.ResourceOptions);
  finally
    LConnection.Free;
  end;

  if (FDManager.State <> TFDPhysManagerState.dmsActive) then
    FDManager.Open;

end;

destructor TVendasDaoConexaoPool.Destroy;
begin
  FConexao.DisposeOf;
  inherited;
end;

function TVendasDaoConexaoPool.IsConnected: Boolean;
var
  LFDConnection: TFDConnection;
begin
  LFDConnection := TFDConnection.Create(nil);
  try
    LFDConnection.ConnectionDefName := FConnectionName;
    LFDConnection.Connected := True;
    Result := LFDConnection.Connected;
  finally
    LFDConnection.Free;
  end;
end;

procedure TVendasDaoConexaoPool.DefinirParametroConexaoMysql(
      AConnectionDefParams: TConnectionDefParams;
      AConnectionDefDriverParams: TConnectionDefDriverParams;
      AFDStanConnectionDef: IFDStanConnectionDef;
      AConnectionDefPoolParams: TConnectionDefPoolParams);
var
  LPGConnectionDefParams: TFDPhysMySQLConnectionDefParams;
begin
  LPGConnectionDefParams := TFDPhysMySqlConnectionDefParams(AFDStanConnectionDef.Params);
  LPGConnectionDefParams.DriverID := AConnectionDefDriverParams.DriverDefName;
  LPGConnectionDefParams.Database := AConnectionDefParams.Database;
  LPGConnectionDefParams.UserName := AConnectionDefParams.UserName;
  LPGConnectionDefParams.Password := AConnectionDefParams.Password;
  LPGConnectionDefParams.Server := AConnectionDefParams.Server;

  LPGConnectionDefParams.Pooled := AConnectionDefPoolParams.Pooled;
  LPGConnectionDefParams.PoolMaximumItems := AConnectionDefPoolParams.PoolMaximumItems;
  LPGConnectionDefParams.PoolCleanupTimeout := AConnectionDefPoolParams.PoolCleanupTimeout;
  LPGConnectionDefParams.PoolExpireTimeout := AConnectionDefPoolParams.PoolExpireTimeout;
end;

class function TVendasDaoConexaoPool.New (const AConnectionDefParams: TConnectionDefParams) : iConexaoPool;
begin
  Result := Self.Create(AConnectionDefParams);
end;

function TVendasDaoConexaoPool.PegarConexao: TFDConnection;
begin
  result := FConexao;
end;

function TVendasDaoConexaoPool.SetarConexao(out AQuery: TFDQuery): iConexaoPool;
begin
  Result := Self;
  AQuery.Connection := FConexao;
  AQuery.Connection.ConnectionDefName := FConnectionName;
end;

end.
