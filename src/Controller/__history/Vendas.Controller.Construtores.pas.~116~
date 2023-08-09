unit Vendas.Controller.Construtores;

interface

uses
  FireDAC.Comp.Client,
  Data.DB,
  Generics.Collections,
  Vendas.Model.BaseCadastro,
  Vendas.Controller.Classes.BaseCadastroAtributo,
  System.Rtti,
  Vendas.Controller.Classes.Constantes,
  Vcl.Forms,
  System.SysUtils,
  Vendas.Model.Conexao,
  System.Classes,
  FireDAC.Stan.Param,
  System.Variants;
type

  TVendasControlerConstrutores = class
  private
    FConexao: iConexao;
    FFormParent: TForm;
    procedure MontarCampos<T:TField, constructor>(ACampos: TMontaCamposDataSet; ADataSet: TFDQuery);
    procedure MontarCamposLooKup<T:TField, constructor>(ACampos: TMontaCamposLooKup;
      ADataSet: TFDQuery; AListaDataSources: TDicionarioDataSource = nil);
    procedure MontarParametroQuery(AQueryExec: TFDQuery;
      ADadosFrame: TDadosFrame);
    procedure MontarSqlInsert(AListaDados: System.Generics.Collections.TList<TDadosFrame>; AChaveMaster: TField; ADataSet: TFDQuery);
    procedure MontarSqlUpdate(AListaDados: TDadosLista; AChaveMaster: TField;
      ADataSet: TFDQuery);
  public
    constructor Create(AFormParent: TForm; AConexao: iConexao);
    function CriarDataSets(AClassDataSet: TClass;
      ANomeTabela: string; ADataSet: TFDQuery = nil; AListaDataSources: TDicionarioDataSource = nil): TFDQuery;
    procedure PrepararMontarCampos(ACampos: TMontaCamposDataSet; ADataSet: TFDQuery);
    procedure PrepararMontarCamposLooKup(ACampos: TMontaCamposLooKup;
      ADataSet: TFDQuery; AListaDataSources: TDicionarioDataSource);
    function PegarNomeDataSource(const ANomeTabela: string): string;
    function GerarDadosGravacao(ATabela: string; ADataSet: TFDQuery): TDadosLista;
    procedure GravarDadosFrame(AListaDados: TDadosLista; AChaveMaster: TField; ADataSet: TFDQuery);
  end;

implementation

constructor TVendasControlerConstrutores.Create(AFormParent: TForm; AConexao: iConexao);
begin
  FFormParent := AFormParent;
  FConexao    := AConexao;
end;

function TVendasControlerConstrutores.CriarDataSets(AClassDataSet: TClass;
      ANomeTabela: string; ADataSet: TFDQuery = nil; AListaDataSources: TDicionarioDataSource = nil): TFDQuery;
var
  FRTTIContexto: TRttiContext;
  FRTTITipo: TRttiType;
  FRTTIproperty: TRttiProperty;
  FRTTIAtributo: TCustomAttribute;
  FCamposData: TMontaCamposDataSet;
  FCamposLooKup: TMontaCamposLooKup;
  FScriptSQL: string;
begin
  FScriptSQL := csFORMAT_SELECT;
  try
    if not Assigned(ADataSet) then
      result := TFDQuery.Create(FFormParent)
    else
      result := ADataSet;

    result.Name := format('qry%s',[ANomeTabela]);
    result.CachedUpdates := True;
    FConexao.SetarConexao(result);
    FRTTIContexto:= TRttiContext.Create;
    FRTTITipo := FRTTIContexto.GetType(AClassDataSet.ClassInfo);
    for FRTTIproperty in FRTTITipo.GetProperties do
      for FRTTIAtributo in FRTTIproperty.GetAttributes do
      begin
        if FRTTIAtributo is TMontaCamposDataSet then
        begin
          FCamposData:= TMontaCamposDataSet(FRTTIAtributo);
          PrepararMontarCampos(FCamposData, result);
        end;

        if FRTTIAtributo is TMontaCamposLooKup then
        begin
          FCamposLooKup:= TMontaCamposLooKup(FRTTIAtributo);
          PrepararMontarCamposLooKup(FCamposLooKup, result, AListaDataSources);
        end;
      end;
      result.SQL.Add(format(FScriptSQL,[ANomeTabela]));

  except
    on E:Exception do
      raise Exception.Create(format('errp: %s',[E.Message]));
  end;
end;

procedure TVendasControlerConstrutores.PrepararMontarCampos(ACampos: TMontaCamposDataSet;
  ADataSet: TFDQuery);
begin
  case ACampos.TipoCampo of
    ftString:
      MontarCampos<TStringField>(ACampos,ADataSet);
    ftInteger:
      MontarCampos<TIntegerField>(ACampos,ADataSet);
    ftBoolean:
      MontarCampos<TBooleanField>(ACampos,ADataSet);
    ftFloat:
      MontarCampos<TFloatField>(ACampos,ADataSet);
    ftCurrency:
      MontarCampos<TCurrencyField>(ACampos,ADataSet);
    ftBCD:
      MontarCampos<TBCDField>(ACampos,ADataSet);
    ftDate:
      MontarCampos<TDateField>(ACampos,ADataSet);
    ftDateTime:
      MontarCampos<TDateTimeField>(ACampos,ADataSet);
    ftAutoInc:
      MontarCampos<TAutoIncField>(ACampos,ADataSet);
  end;
end;

procedure TVendasControlerConstrutores.PrepararMontarCamposLooKup(ACampos: TMontaCamposLooKup;
  ADataSet: TFDQuery; AListaDataSources: TDicionarioDataSource);
begin
  case ACampos.TipoCampo of
    ftString:
      MontarCamposLooKup<TStringField>(ACampos, ADataSet, AListaDataSources);
    ftInteger:
      MontarCamposLooKup<TIntegerField>(ACampos,ADataSet, AListaDataSources);
    ftBoolean:
      MontarCamposLooKup<TBooleanField>(ACampos, ADataSet, AListaDataSources);
    ftFloat:
      MontarCamposLooKup<TFloatField>(ACampos, ADataSet, AListaDataSources);
    ftCurrency:
      MontarCamposLooKup<TCurrencyField>(ACampos,ADataSet, AListaDataSources);
    ftBCD:
      MontarCamposLooKup<TBCDField>(ACampos,ADataSet, AListaDataSources);
    ftDate:
      MontarCamposLooKup<TDateField>(ACampos,ADataSet, AListaDataSources);
    ftDateTime:
      MontarCamposLooKup<TDateTimeField>(ACampos,ADataSet, AListaDataSources);
    ftAutoInc:
      MontarCamposLooKup<TAutoIncField>(ACampos,ADataSet, AListaDataSources);
  end;
end;

procedure TVendasControlerConstrutores.MontarCampos<T>(ACampos: TMontaCamposDataSet;
  ADataSet: TFDQuery);
var
  LField: T;
begin
  LField := T(TNumericFieldClass(T).create(ADataSet));
  if ACampos.TipoCampo = ftAutoInc then
    LField.ProviderFlags:= [pfInKey,pfInWhere,pfInUpdate]
  else
  LField.ProviderFlags:= [pfInWhere,pfInUpdate];
  LField.FieldName    := ACampos.NomeCampo;
  LField.Displaylabel := ACampos.DisplayLabel;
  LField.Size         := ACampos.Tamanho;
  LField.FieldKind    := fkData;
  LField.DataSet      := ADataSet;
end;

procedure TVendasControlerConstrutores.MontarCamposLooKup<T>(ACampos: TMontaCamposLooKup;
  ADataSet: TFDQuery; AListaDataSources: TDicionarioDataSource = nil);
var
  LField: T;
begin
  LField := T(TNumericFieldClass(T).create(ADataSet));
  LField.FieldName        := ACampos.CampoResult;
  LField.Displaylabel     := ACampos.DisplayLabel;
  LField.Size             := ACampos.Tamanho;
  LField.FieldKind        := fkLookup;
  LField.KeyFields        := ACampos.ChaveEstrangeira;
  LField.DataSet          := ADataSet;
  LField.LookupDataSet    := AListaDataSources[format(csPREFIXO_DATASOURCE,[ACampos.NomeTabelaFK])].DataSet;
  LField.LookupKeyFields  := ACampos.ChavePrimaria;
  LField.LookupResultField:= ACampos.CampoResult;
end;

function TVendasControlerConstrutores.PegarNomeDataSource(const ANomeTabela: string): string;
begin
  result := format(csPREFIXO_DATASOURCE,[ANomeTabela])
end;

function TVendasControlerConstrutores.GerarDadosGravacao(ATabela: string; ADataSet: TFDQuery): TDadosLista;
var
  LField: TField;
  LData: TDadosFrame;
begin
  Result := TList<TDadosFrame>.Create;
  for LField in ADataSet.fields do
  begin
    if ADataSet.State = dsInsert then
      LData.Acao     := taNovo
    else
      LData.Acao     := taEditar;

    if ((LField.DataType = ftAutoInc) and (LData.Acao = taNovo)) or
       (LField.FieldKind = fkLookup) then
      Continue;

    LData.Tabela   := ATabela;
    LData.Campo    := LField.FieldName;
    LData.TipoDado := LField.DataType;
    LData.Valor    := LField.Value;
    Result.Add(LData);
  end;
end;

procedure TVendasControlerConstrutores.GravarDadosFrame(AListaDados: TDadosLista; AChaveMaster: TField; ADataSet: TFDQuery);
begin
  if AListaDados.Items[0].Acao = taNovo then
    MontarSqlInsert(AListaDados, AChaveMaster, ADataSet)
  else
    MontarSqlUpdate(AListaDados, AChaveMaster, ADataSet)
end;

procedure TVendasControlerConstrutores.MontarSqlInsert(AListaDados: TDadosLista; AChaveMaster: TField; ADataSet: TFDQuery);
var
  LCammpos: TStringList;
  LValues: TStringList;
  LDadosFrame: TDadosFrame;
  LDadosFrameSub: TDadosFrame;
begin
  LCammpos := TStringList.Create;
  try
    LValues := TStringList.Create;
    try
      for LDadosFrame in AListaDados do
      begin
        if LCammpos.Count = 0 then
        begin
          LCammpos.Add(LDadosFrame.Campo);
          LValues.Add(format(':%s', [LDadosFrame.Campo]));
        end
        else
        begin
          LCammpos.Add(format(', %s', [LDadosFrame.Campo]));
          LValues.Add(format(', :%s', [LDadosFrame.Campo]));
        end;
        ADataSet.SQL.Text := format(csSCRIPT_INSERT, [LDadosFrame.Tabela, LCammpos.Text, LValues.Text]);
        if LDadosFrame.Campo = AChaveMaster.FieldName then
        begin
          LDadosFrameSub.Tabela := LDadosFrame.Tabela;
          LDadosFrameSub.Campo := LDadosFrame.Campo;
          LDadosFrameSub.TipoDado := LDadosFrame.TipoDado;
          LDadosFrameSub.Valor := AChaveMaster.Value;
          MontarParametroQuery(ADataSet, LDadosFrameSub);
        end
        else
          MontarParametroQuery(ADataSet, LDadosFrame);
      end;
    finally
      LValues.DisposeOf;
    end;
  finally
    LCammpos.DisposeOf;
  end;
end;

procedure TVendasControlerConstrutores.MontarSqlUpdate(AListaDados: TDadosLista; AChaveMaster: TField; ADataSet: TFDQuery);
var
  LCammposSet: TStringList;
  LWhere: TStringList;
  LDadosFrame: TDadosFrame;
  LDadosFrameSub: TDadosFrame;
begin
  LCammposSet := TStringList.Create;
  try
    LWhere := TStringList.Create;
    try
      for LDadosFrame in AListaDados do
      begin
        if (LDadosFrame.TipoDado = ftAutoInc) then
        begin
          LWhere.Add(format('%s = :%s', [LDadosFrame.Campo, LDadosFrame.Campo]));
          ADataSet.SQL.Text := format(csSCRIPT_UPDATE, [LDadosFrame.Tabela, LCammposSet.Text, LWhere.Text]);
          MontarParametroQuery(ADataSet, LDadosFrame);
          Continue;
        end;

        if LCammposSet.Count = 0 then
          LCammposSet.Add(format('%s = :%s', [LDadosFrame.Campo, LDadosFrame.Campo]))
        else
          LCammposSet.Add(format(', %s = :%s', [LDadosFrame.Campo, LDadosFrame.Campo]));

        ADataSet.SQL.Text := format(csSCRIPT_UPDATE, [LDadosFrame.Tabela, LCammposSet.Text, LWhere.Text]);
        if LDadosFrame.Campo = AChaveMaster.FieldName then
        begin
          LDadosFrameSub.Tabela := LDadosFrame.Tabela;
          LDadosFrameSub.Campo := LDadosFrame.Campo;
          LDadosFrameSub.TipoDado := LDadosFrame.TipoDado;
          LDadosFrameSub.Valor := AChaveMaster.Value;
          MontarParametroQuery(ADataSet, LDadosFrameSub);
        end
        else
          MontarParametroQuery(ADataSet, LDadosFrame);
      end;
    finally
      LWhere.DisposeOf;
    end;
  finally
    LCammposSet.DisposeOf;
  end;
end;

procedure TVendasControlerConstrutores.MontarParametroQuery(AQueryExec: TFDQuery;
  ADadosFrame: TDadosFrame);
begin
  if ADadosFrame.TipoDado = ftAutoInc then
    AQueryExec.ParamByName(ADadosFrame.Campo).DataType := ftInteger
  else
    AQueryExec.ParamByName(ADadosFrame.Campo).DataType := ADadosFrame.TipoDado;
  AQueryExec.ParamByName(ADadosFrame.Campo).Value := ADadosFrame.Valor;
end;

end.
