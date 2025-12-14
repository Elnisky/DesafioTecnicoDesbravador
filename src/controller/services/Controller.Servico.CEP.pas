unit Controller.Servico.CEP;

interface

uses
  Entidade.CEP;

type
  TServicoCEP = class
  private
  public
    constructor Create;
    destructor Destroy; override;
    function ObterCEP(const CEP: string): TCEP;
  end;

implementation

uses
  System.JSON,
  System.Net.HttpClient,
  System.Net.HttpClientComponent,
  System.SysUtils;

{ TServicoCEP }

constructor TServicoCEP.Create;
begin

end;

destructor TServicoCEP.Destroy;
begin

  inherited;
end;

function TServicoCEP.ObterCEP(const CEP: string): TCEP;
var
  Resp   : IHTTPResponse;
  JSON   : TJSONObject;
  Client : TNetHTTPClient;
  Erro   : Boolean;
begin
  Client := TNetHTTPClient.Create(nil);
  try
    Resp   := Client.Get(Format('https://viacep.com.br/ws/%s/json/', [CEP]));
  finally
     Client.Free;
  end;

  if Resp.StatusCode <> 200 then
    Exit(nil);

  JSON := TJSONObject.ParseJSONValue(Resp.ContentAsString(TEncoding.UTF8)) as TJSONObject;
  try
    if Assigned(JSON) and not JSON.TryGetValue<Boolean>('erro', Erro) then
    begin
      Result             := TCEP.Create;
      Result.UF          := JSON.GetValue<string>('uf', '');
      Result.Cidade      := JSON.GetValue<string>('localidade', '');
      Result.Bairro      := JSON.GetValue<string>('bairro', '');
      Result.Logradouro  := JSON.GetValue<string>('logradouro', '');
      Result.Complemento := JSON.GetValue<string>('complemento', '');
    end
    else
      Result := nil;
  finally
    JSON.Free;
  end;
end;


end.


