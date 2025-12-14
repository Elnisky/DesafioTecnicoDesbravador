unit Controller.Servico.Endereco;

interface

uses
  Data.DB,
  Entidade.Endereco,
  Fabrica.Repositorio,
  Persistencia.ORM,
  System.Generics.Collections;

type
  TServicoEndereco = class
  private
    FRepositorioEndereco : TPersistencia<TEndereco>;
  public
    constructor Create(const AConexao: TCustomConnection);
    destructor Destroy; override;
    procedure Atualizar(const Endereco: TEndereco);
    procedure Inserir(const Endereco: TEndereco);
    procedure Excluir(const Endereco: TEndereco);
    function ObterPorID(const ID: Integer): TEndereco;
    function ObterPorIDPessoa(const ID: Integer): TEndereco;
    function ObterTodos: TObjectList<TEndereco>;
  end;

implementation

{ TServicoEndereco }

procedure TServicoEndereco.Atualizar(const Endereco: TEndereco);
begin
  FRepositorioEndereco.Atualizar(Endereco);
end;

constructor TServicoEndereco.Create(const AConexao: TCustomConnection);
begin
  FRepositorioEndereco := TRepositoryFactory.RepositorioEndereco(AConexao);
end;

destructor TServicoEndereco.Destroy;
begin
  FRepositorioEndereco.Free;
  inherited;
end;

procedure TServicoEndereco.Excluir(const Endereco: TEndereco);
begin
  FRepositorioEndereco.Excluir(Endereco);
end;

procedure TServicoEndereco.Inserir(const Endereco: TEndereco);
begin
  FRepositorioEndereco.Inserir(Endereco);
end;

function TServicoEndereco.ObterPorID(const ID: Integer): TEndereco;
begin
  Result := FRepositorioEndereco.ObterPorID(ID);
end;

function TServicoEndereco.ObterPorIDPessoa(const ID: Integer): TEndereco;
begin
  Result := FRepositorioEndereco.ObterPorChave('idpessoa', ID);
end;

function TServicoEndereco.ObterTodos: TObjectList<TEndereco>;
begin
  Result := FRepositorioEndereco.ObterTodos;
end;

end.


