unit Controller.Importacao;

interface

uses
  Controller.Servico.Importacao,
  Entidade.Pessoa,
  Data.DB,
  System.Generics.Collections;

type
  TControllerImportacao = class
  private
    FService: TServicoImportacao;
  public
    constructor Create(AConnection : TCustomConnection);
    destructor Destroy; override;
    function Importar: Boolean;
  end;

implementation

constructor TControllerImportacao.Create(AConnection : TCustomConnection);
begin
  FService := TServicoImportacao.Create(AConnection);
end;

destructor TControllerImportacao.Destroy;
begin
  FService.Free;
  inherited;
end;

function TControllerImportacao.Importar: Boolean;
begin
  Result := FService.Importar;
end;


end.


