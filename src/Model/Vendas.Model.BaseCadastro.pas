unit Vendas.Model.BaseCadastro;

interface

uses
  System.Generics.Collections,
  Vcl.ActnList,
  Vcl.ComCtrls,
  Vcl.Forms,
  Data.DB,
  Vcl.DBCtrls, Vcl.Controls;

type
  TTipoAcao      = (taBrowse, taNovo, taEditar, taExcluir, taGravar, taCancelar, taSair);
  TArrayAcao     = Set of TTipoAcao;

const
  csTipoAcaoDescricao: array[TTipoAcao] of String = ('Listagem','Novo', 'Editar',
                                                    'Excluir','Gravar','Cancelar','Sair');

  csVizualizacao = [taBrowse,  taExcluir, taGravar, taCancelar];
  csEdicao       = [taNovo, taEditar, taExcluir];
  csModEdicao    = [taBrowse, taGravar, taExcluir, taCancelar];
  csModPersisten = [taNovo, taEditar];

type
  TDicionarioAcoes           = TDictionary<TTipoAcao,TAction>;
  TDicionarioTabSheets       = TDictionary<TArrayAcao,TTabSheet>;
  TDicionarioDataSource      = TDictionary<string,TDataSource>;
  TDicionarioControle        = TDictionary<Tframe,TDataSource>;

  TNotifyEventAuxiliar       = procedure(Sender: TObject; Lista: TDicionarioDataSource) of object;

  TDadosFrame = record
    Acao: TTipoAcao;
    Tabela: string;
    Campo: string;
    TipoDado: TFieldType;
    Valor: Variant;
  end;

  TDadosLista        = TList<TDadosFrame>;
  TDadosColecao      = TDictionary<variant,TDadosLista>;
  TNumericFieldClass = class of TField;


  iModelBaseCadastro         = interface;
  TRotinaGravaAutomatico     = reference to function: iModelBaseCadastro;

  iModelBaseCadastro = interface
    ['{AD0F9E33-AE8B-4E76-A8F0-6DFFAF390D3C}']
    /// <summary>
    ///   Fun��o que inicia uma a��o do tipo TTipoAcao.
    /// </summary>
    /// <param name="AAcao">
    ///   Par�metro que inst�ncia uma a��o no CRUD do tipo: taNovo, taEditar, taExcluir...
    /// </param>
    function IniciarAcao(const AAcao: TTipoAcao; AResetDados: Boolean = false): iModelBaseCadastro;
    /// <summary>
    ///   Set a fun��o para gravar automaticamente os dados
    /// </summary>
    /// <param name="AProcedimento">
    ///   Rotina para controle da fun��o gravar
    /// </param>
    function SetGravaAutomatico(AProcedimento: TRotinaGravaAutomatico):iModelBaseCadastro;
    /// <summary>
    ///   Captura a fun��o de grava��o
    /// </summary>
    function GetGravaAutomatico: TRotinaGravaAutomatico;
    /// <summary>
    ///   Captura o DataSource principal da tela
    /// </summary>
    function PegarDataSourcePrincpal: TDataSource;
    /// <summary>
    ///   Pegar Colecao de Dados vindo de um Frame Auxiliar
    /// </summary>
    function PegarColecaoDados: TDadosColecao;
  end;

implementation

end.
