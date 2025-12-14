unit Controller.CEP;

interface

uses
  Entidade.CEP,
  Controller.Servico.CEP,
  System.Generics.Collections;

type
  TControllerCEP = class
  private
    FService: TServicoCEP;
  public
    constructor Create;
    destructor Destroy; override;
    function ListarCEP(const CEP: string): TCEP;
  end;

implementation

constructor TControllerCEP.Create;
begin
  FService := TServicoCEP.Create;
end;

destructor TControllerCEP.Destroy;
begin
  FService.Free;
  inherited;
end;

function TControllerCEP.ListarCEP(const CEP: string): TCEP;
begin
  Result := FService.ObterCEP(CEP);
end;

end.


