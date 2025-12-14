unit Controller.EnderecoIntegracao;

interface

uses
  Data.DB,
  Entidade.EnderecoIntegracao,
  Controller.Servico.EnderecoIntegracao,
  System.Generics.Collections;

type
  TControllerEnderecoIntegracao = class
  private
    FService: TServicoEnderecoIntegracao;
  public
    constructor Create(const AConexao: TCustomConnection);
    destructor Destroy; override;
    procedure Atualizar(const Endereco: TEnderecoIntegracao);
    procedure Inserir(const Endereco: TEnderecoIntegracao); overload;
    procedure Inserir(const Enderecos: TObjectList<TEnderecoIntegracao>); overload;
    procedure Excluir(const Endereco: TEnderecoIntegracao);
    function ListarEnderecos: TObjectList<TEnderecoIntegracao>; overload;
    function ListarEnderecoPorID(const Codigo: Integer): TEnderecoIntegracao;
    function ListarEnderecoPorIDPessoa(const Codigo: Integer): TEnderecoIntegracao;
  end;

implementation

procedure TControllerEnderecoIntegracao.Atualizar(const Endereco: TEnderecoIntegracao);
begin
  FService.Atualizar(Endereco);
end;

constructor TControllerEnderecoIntegracao.Create(const AConexao: TCustomConnection);
begin
  FService := TServicoEnderecoIntegracao.Create(AConexao);
end;

destructor TControllerEnderecoIntegracao.Destroy;
begin
  FService.Free;
  inherited;
end;

procedure TControllerEnderecoIntegracao.Excluir(const Endereco: TEnderecoIntegracao);
begin
  FService.Excluir(Endereco);
end;

procedure TControllerEnderecoIntegracao.Inserir(const Endereco: TEnderecoIntegracao);
begin
  FService.Inserir(Endereco);
end;

procedure TControllerEnderecoIntegracao.Inserir(const Enderecos: TObjectList<TEnderecoIntegracao>);
begin
  FService.Inserir(Enderecos);
end;

function TControllerEnderecoIntegracao.ListarEnderecos: TObjectList<TEnderecoIntegracao>;
begin
  Result := FService.ObterTodos;
end;

function TControllerEnderecoIntegracao.ListarEnderecoPorID(const Codigo: Integer): TEnderecoIntegracao;
begin
  Result := FService.ObterPorID(Codigo);
end;

function TControllerEnderecoIntegracao.ListarEnderecoPorIDPessoa(const Codigo: Integer): TEnderecoIntegracao;
begin
  Result := FService.ObterPorIDPessoa(Codigo);
end;

end.


