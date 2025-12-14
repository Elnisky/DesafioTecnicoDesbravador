unit Fabrica.Repositorio;

interface

uses
  Data.DB,
  Entidade.Pessoa,
  Entidade.Endereco,
  Entidade.EnderecoIntegracao,
  Persistencia.ORM;

type
  TRepositoryFactory = class
    public
      class function RepositorioPessoa(const AConexao: TCustomConnection): TPersistencia<TPessoa>;
      class function RepositorioEndereco(const AConexao: TCustomConnection): TPersistencia<TEndereco>;
      class function RepositorioEnderecoIntegracao(const AConexao: TCustomConnection): TPersistencia<TEnderecoIntegracao>;
  end;

implementation

{ TRepositoryFactory }

class function TRepositoryFactory.RepositorioPessoa(const AConexao: TCustomConnection): TPersistencia<TPessoa>;
begin
  Result := TPersistencia<TPessoa>.Create(AConexao);
end;

class function TRepositoryFactory.RepositorioEndereco(const AConexao: TCustomConnection): TPersistencia<TEndereco>;
begin
  Result := TPersistencia<TEndereco>.Create(AConexao);
end;

class function TRepositoryFactory.RepositorioEnderecoIntegracao( const AConexao: TCustomConnection): TPersistencia<TEnderecoIntegracao>;
begin
  Result := TPersistencia<TEnderecoIntegracao>.Create(AConexao);
end;

end.

