unit Controller.Pessoa;

interface

uses
  Data.DB,
  Entidade.Pessoa,
  Controller.Servico.Pessoa,
  System.Generics.Collections;

type
  TControllerPessoa = class
  private
    FService: TServicoPessoa;

  public
    constructor Create(const AConexao: TCustomConnection);
    destructor Destroy; override;
    procedure Atualizar(const Pessoa: TPessoa);
    procedure Inserir(const Pessoa: TPessoa); overload;
    procedure Inserir(const ListaPessoas: TObjectList<TPessoa>); overload;
    procedure Excluir(const Pessoa: TPessoa);
    function ListarPessoas: TObjectList<TPessoa>; overload;
    function ListarPessoas(const Pagina: Integer): TObjectList<TPessoa>; overload;
    function ListarPessoaPorID(const Codigo: Integer): TPessoa;
    function ObterTotal: Integer;
  end;

implementation

procedure TControllerPessoa.Atualizar(const Pessoa: TPessoa);
begin
  FService.Atualizar(Pessoa);
end;

constructor TControllerPessoa.Create(const AConexao: TCustomConnection);
begin
  FService := TServicoPessoa.Create(AConexao);
end;

destructor TControllerPessoa.Destroy;
begin
  FService.Free;
  inherited;
end;

procedure TControllerPessoa.Excluir(const Pessoa: TPessoa);
begin
  FService.Excluir(Pessoa);
end;

procedure TControllerPessoa.Inserir(const Pessoa: TPessoa);
begin
  FService.Inserir(Pessoa);
end;

procedure TControllerPessoa.Inserir(const ListaPessoas: TObjectList<TPessoa>);
begin
  FService.Inserir(ListaPessoas);
end;

function TControllerPessoa.ListarPessoas: TObjectList<TPessoa>;
begin
  Result := FService.ObterTodas;
end;

function TControllerPessoa.ListarPessoas(const Pagina: Integer): TObjectList<TPessoa>;
begin
  Result := FService.ObterPagina(Pagina);
end;

function TControllerPessoa.ListarPessoaPorID(const Codigo: Integer): TPessoa;
begin
  Result := FService.ObterPorID(Codigo);
end;

function TControllerPessoa.ObterTotal: Integer;
begin
  Result := FService.ObterTotal;
end;

end.


