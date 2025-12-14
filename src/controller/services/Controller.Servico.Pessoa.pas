unit Controller.Servico.Pessoa;

interface

uses
  Data.DB,
  Entidade.Pessoa,
  Fabrica.Repositorio,
  Persistencia.ORM,
  System.Generics.Collections;

type
  TServicoPessoa = class
  private
    FRepositorioProduto : TPersistencia<TPessoa>;

  public
    constructor Create(const AConexao: TCustomConnection);
    destructor Destroy; override;
    procedure Atualizar(const Pessoa: TPessoa);
    procedure Inserir(const Pessoa: TPessoa);
    procedure Excluir(const Pessoa: TPessoa);
    function ObterPagina(const Pagina: Integer): TObjectList<TPessoa>;
    function ObterPorID(const ID: Integer): TPessoa;
    function ObterTodas: TObjectList<TPessoa>;
    function ObterTotal: Integer;
  end;

implementation

{ TServicoPessoa }

procedure TServicoPessoa.Atualizar(const Pessoa: TPessoa);
begin
  FRepositorioProduto.Atualizar(Pessoa);
end;

constructor TServicoPessoa.Create(const AConexao: TCustomConnection);
begin
  FRepositorioProduto := TRepositoryFactory.RepositorioPessoa(AConexao);
end;

destructor TServicoPessoa.Destroy;
begin
  FRepositorioProduto.Free;
  inherited;
end;

procedure TServicoPessoa.Excluir(const Pessoa: TPessoa);
begin
  FRepositorioProduto.Excluir(Pessoa);
end;

procedure TServicoPessoa.Inserir(const Pessoa: TPessoa);
begin
  FRepositorioProduto.Inserir(Pessoa);
end;

function TServicoPessoa.ObterPagina(const Pagina: Integer): TObjectList<TPessoa>;
begin
  Result := FRepositorioProduto.ObterPagina(Pagina);
end;

function TServicoPessoa.ObterPorID(const ID: Integer): TPessoa;
begin
  Result := FRepositorioProduto.ObterPorID(ID);
end;

function TServicoPessoa.ObterTodas: TObjectList<TPessoa>;
begin
  Result := FRepositorioProduto.ObterTodos;
end;

function TServicoPessoa.ObterTotal: Integer;
begin
  Result := FRepositorioProduto.ObterTotal;
end;

end.


