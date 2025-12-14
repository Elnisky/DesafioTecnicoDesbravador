unit Persistencia.ORM;

interface

uses
  Data.DB,
  FireDAC.Comp.Client,
  SimpleDAO,
  SimpleInterface,
  SimpleQueryFiredac,
  System.Character,
  System.Classes,
  System.Generics.Collections,
  System.Rtti,
  System.SysUtils,

  System.Variants;

type
  TPersistencia<T: class, constructor> = class
  private
    FConexao         : TCustomConnection;
    FQuery           : iSimpleQuery;
    FDAOPersistencia : iSimpleDAO<T>;
  public
    constructor Create(AConexao: TCustomConnection);
    destructor Destroy; override;
    procedure Atualizar(Objeto: T);
    procedure Excluir(Objeto: T);
    function Inserir(Objeto: T): Integer; overload;
    procedure Inserir(ListaObjetos: TObjectList<T>); overload;
    function ObterPorChave(const Chave: string; const Valor: Variant): T;
    function ObterPagina(const Pagina: Integer): TObjectList<T>;
    function ObterPorID(const ID: Integer): T;
    function ObterTodos(const Filtro: string): TObjectList<T>; overload;
    function ObterTodos: TObjectList<T>; overload;
    function ObterTotal: Integer;
  end;

implementation



{ TPersistencia<T> }

procedure TPersistencia<T>.Atualizar(Objeto: T);
begin
  FDAOPersistencia.Update(Objeto);
end;

constructor TPersistencia<T>.Create(AConexao: TCustomConnection);
begin
  FConexao         := AConexao;
  FQuery           := TSimpleQueryFiredac.New(TFDConnection(FConexao));
  FDAOPersistencia := TSimpleDAO<T>.New(FQuery);
end;

destructor TPersistencia<T>.Destroy;
begin
  inherited;
end;

procedure TPersistencia<T>.Excluir(Objeto: T);
begin
  FDAOPersistencia.Delete(Objeto);
end;

function TPersistencia<T>.Inserir(Objeto: T): Integer;
begin
  FDAOPersistencia.Insert(Objeto);
  Result := FQuery.DataSet.Fields[0].AsInteger;
end;

procedure TPersistencia<T>.Inserir(ListaObjetos: TObjectList<T>);
begin
  FDAOPersistencia.Insert(ListaObjetos);
end;

function TPersistencia<T>.ObterPorChave(const Chave: string; const Valor: Variant): T;
begin
  FDAOPersistencia.Find(Chave, Valor);
  Result := FDAOPersistencia.Find(FQuery.DataSet.Fields[0].AsInteger);
  if FQuery.DataSet.IsEmpty then
    FreeAndNil(Result);
end;

function TPersistencia<T>.ObterPagina(const Pagina: Integer): TObjectList<T>;
const
  TAMANHO = 100;
begin
  Result := TObjectList<T>.Create(True);
  FDAOPersistencia
    .SQL
       .OrderBy('idpessoa')
       .Limit(Format('%d OFFSET %d', [TAMANHO, (Pagina - 1) * TAMANHO]))
    .&End
    .Find(Result);
end;

function TPersistencia<T>.ObterPorID(const ID: Integer): T;
begin
  Result := FDAOPersistencia.Find(ID);
end;

function TPersistencia<T>.ObterTodos(const Filtro: string): TObjectList<T>;
begin
  FDAOPersistencia
    .SQL
      .Where(Filtro)
    .&End
    .Find(Result);
end;

function TPersistencia<T>.ObterTodos: TObjectList<T>;
begin
  Result := TObjectList<T>.Create(True);
  FDAOPersistencia.Find(Result);
end;

function TPersistencia<T>.ObterTotal: Integer;
begin
  FDAOPersistencia
    .SQL
       .Fields('COUNT(*)')
    .&End
    .Find;
  Result := FQuery.DataSet.Fields[0].AsInteger;
end;

end.
