unit Controller.Endereco;

interface

uses
  Data.DB,
  Entidade.Endereco,
  Controller.Servico.Endereco,
  System.Generics.Collections;

type
  TControllerEndereco = class
  private
    FService: TServicoEndereco;
  public
    constructor Create(const AConexao: TCustomConnection);
    destructor Destroy; override;
    procedure Atualizar(const Endereco: TEndereco);
    procedure Inserir(const Endereco: TEndereco);
    procedure Excluir(const Endereco: TEndereco);
    function ListarEnderecos: TObjectList<TEndereco>; overload;
    function ListarEnderecoPorID(const Codigo: Integer): TEndereco;
    function ListarEnderecoPorIDPessoa(const Codigo: Integer): TEndereco;
  end;

implementation

procedure TControllerEndereco.Atualizar(const Endereco: TEndereco);
begin
  FService.Atualizar(Endereco);
end;

constructor TControllerEndereco.Create(const AConexao: TCustomConnection);
begin
  FService := TServicoEndereco.Create(AConexao);
end;

destructor TControllerEndereco.Destroy;
begin
  FService.Free;
  inherited;
end;

procedure TControllerEndereco.Excluir(const Endereco: TEndereco);
begin
  FService.Excluir(Endereco);
end;

procedure TControllerEndereco.Inserir(const Endereco: TEndereco);
begin
  FService.Inserir(Endereco);
end;

function TControllerEndereco.ListarEnderecos: TObjectList<TEndereco>;
begin
  Result := FService.ObterTodos;
end;

function TControllerEndereco.ListarEnderecoPorID(const Codigo: Integer): TEndereco;
begin
  Result := FService.ObterPorID(Codigo);
end;

function TControllerEndereco.ListarEnderecoPorIDPessoa(const Codigo: Integer): TEndereco;
begin
  Result := FService.ObterPorIDPessoa(Codigo);
end;

end.


