unit Controller.Servico.EnderecoIntegracao;

interface

uses
  Data.DB,
  Controller.Servico.Endereco,
  Entidade.Endereco,
  Entidade.EnderecoIntegracao,
  Fabrica.Repositorio,
  Persistencia.ORM,
  System.Generics.Collections;

type
  TServicoEnderecoIntegracao = class
  private
    FRepositorioEnderecoIntegracao : TPersistencia<TEnderecoIntegracao>;
    FServicoEndereco               : TServicoEndereco;
  public
    constructor Create(const AConexao: TCustomConnection);
    destructor Destroy; override;
    procedure Atualizar(const Endereco: TEnderecoIntegracao);
    procedure Inserir(const Endereco: TEnderecoIntegracao); overload;
    procedure Inserir(const ListaEnderecos: TObjectList<TEnderecoIntegracao>); overload;
    procedure Excluir(const Endereco: TEnderecoIntegracao);
    function ObterPorID(const ID: Integer): TEnderecoIntegracao;
    function ObterPorIDPessoa(const IDPessoa: Integer): TEnderecoIntegracao;
    function ObterTodos: TObjectList<TEnderecoIntegracao>;
  end;

implementation

{ TServicoEnderecoIntegracao }

procedure TServicoEnderecoIntegracao.Atualizar(const Endereco: TEnderecoIntegracao);
begin
  FRepositorioEnderecoIntegracao.Atualizar(Endereco);
end;

constructor TServicoEnderecoIntegracao.Create(const AConexao: TCustomConnection);
begin
  FRepositorioEnderecoIntegracao := TRepositoryFactory.RepositorioEnderecoIntegracao(AConexao);
  FServicoEndereco               := TServicoEndereco.Create(AConexao);
end;

destructor TServicoEnderecoIntegracao.Destroy;
begin
  FRepositorioEnderecoIntegracao.Free;
  FServicoEndereco.Free;
  inherited;
end;

procedure TServicoEnderecoIntegracao.Excluir(const Endereco: TEnderecoIntegracao);
begin
  FRepositorioEnderecoIntegracao.Excluir(Endereco);
end;

procedure TServicoEnderecoIntegracao.Inserir(const Endereco: TEnderecoIntegracao);
begin
  FRepositorioEnderecoIntegracao.Inserir(Endereco);
end;

procedure TServicoEnderecoIntegracao.Inserir(const ListaEnderecos: TObjectList<TEnderecoIntegracao>);
begin
  FRepositorioEnderecoIntegracao.Inserir(ListaEnderecos);
end;

function TServicoEnderecoIntegracao.ObterPorID(const ID: Integer): TEnderecoIntegracao;
begin
  Result := FRepositorioEnderecoIntegracao.ObterPorID(ID);
end;

function TServicoEnderecoIntegracao.ObterPorIDPessoa(const IDPessoa: Integer): TEnderecoIntegracao;
begin
  var LEndereco := FServicoEndereco.ObterPorIDPessoa(IDPessoa);
  if Assigned(LEndereco) then
    Result := ObterPorID(LEndereco.IDEndereco)
  else
    Result := nil;
end;

function TServicoEnderecoIntegracao.ObterTodos: TObjectList<TEnderecoIntegracao>;
begin
  Result := FRepositorioEnderecoIntegracao.ObterTodos;
end;

end.


