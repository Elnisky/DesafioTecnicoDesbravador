unit Controller.Atualizacao;

interface

uses
  Controller.Servico.Atualizacao,
  Data.DB;

type
  TControllerAtualizacao = class
  private
    FService: TServicoAtualizacao;
  public
    constructor Create(AConnection : TCustomConnection);
    destructor Destroy; override;
    function Atualizar: Boolean;
  end;

implementation

constructor TControllerAtualizacao.Create(AConnection : TCustomConnection);
begin
  FService := TServicoAtualizacao.Create(AConnection);
end;

destructor TControllerAtualizacao.Destroy;
begin
  FService.Free;
  inherited;
end;

function TControllerAtualizacao.Atualizar: Boolean;
begin
  Result := FService.Atualizar;
end;

end.


