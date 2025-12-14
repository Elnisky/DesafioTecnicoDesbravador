unit Controller.Servico.Atualizacao;

interface

uses
  Data.DB;

type
  TServicoAtualizacao = class
  private
    FConnection : TCustomConnection;
  public
    constructor Create(AConnection : TCustomConnection);
    destructor Destroy; override;
    function Atualizar: Boolean;
  end;

implementation

uses
  Controller.CEP,
  Controller.Endereco,
  Controller.EnderecoIntegracao,
  Controller.Pessoa,
  Entidade.Endereco,
  Entidade.EnderecoIntegracao,
  Entidade.Pessoa,
  Impl.ConnectionFiredac,
  Interfaces.IConexaoFiredac,
  System.JSON,
  System.Generics.Collections,
  System.Math,
  System.Net.HttpClient,
  System.Net.HttpClientComponent,
  System.SysUtils,
  System.Threading;

{ TServicoAtualizacao }

constructor TServicoAtualizacao.Create(AConnection : TCustomConnection);
begin
  FConnection := AConnection;
end;

destructor TServicoAtualizacao.Destroy;
begin

  inherited;
end;

function TServicoAtualizacao.Atualizar: Boolean;
var
  LPessoas    : TObjectList<TPessoa>;
begin
  var LControllerPessoa := TControllerPessoa.Create(FConnection);
  var LMax              := Ceil(LControllerPessoa.ObterTotal / 100);

  try
    for var I := 1 to LMax do
    begin
      var LIntegracao := TObjectList<TEnderecoIntegracao>.Create(True);
      LPessoas        := LControllerPessoa.ListarPessoas(I);
      try
        if LPessoas.Count > 0 then
        begin
          TParallel.For(0,
                        Pred(LPessoas.Count),
                        procedure (Idx: Integer)
                        begin
                          var LDConnImpl          := TFDConnectionImpl.New;
                          var LControllerCEP      := TControllerCEP.Create;
                          var LControllerEndereco := TControllerEndereco.Create(LDConnImpl.GetConnection);
                          var LEndereco           := LControllerEndereco.ListarEnderecoPorIDPessoa(LPessoas.Items[Idx].IDPessoa);
                          var LCEP                := LControllerCEP.ListarCEP(LEndereco.DSCEP);
                          if Assigned(LCEP) then
                          begin
                            TMonitor.Enter(LIntegracao);
                            try
                              var ObjIntegracao           := TEnderecoIntegracao.Create;
                              ObjIntegracao.IDEndereco    := LEndereco.IDEndereco;
                              ObjIntegracao.DSUF          := LCEP.UF;
                              ObjIntegracao.NMCidade      := LCEP.Cidade;
                              ObjIntegracao.NMBairro      := LCEP.Bairro;
                              ObjIntegracao.NMLogradouro  := LCEP.Logradouro;
                              ObjIntegracao.DSComplemento := LCEP.Complemento;
                              LIntegracao.Add(ObjIntegracao);
                            finally
                              TMonitor.Exit(LIntegracao);
                            end;
                          end;
                          LControllerCEP.Free;
                          LControllerEndereco.Free;
                          LEndereco.Free;
                          LCEP.Free;
                        end);

          if LIntegracao.Count > 0 then
          begin
            var LControllerEnderecoIntegracao := TControllerEnderecoIntegracao.Create(FConnection);
            LControllerEnderecoIntegracao.Inserir(LIntegracao);
            LControllerEnderecoIntegracao.Free;
          end;
        end;
      finally
        LIntegracao.Free;
        LPessoas.Free;
      end;
    end;
    Result := True;
  finally
    LControllerPessoa.Free;
  end;
end;

end.


