unit Entidade.EnderecoIntegracao;

interface

{$M+}

uses
  SimpleAttributes;

type
  [Tabela('endereco_integracao')]
  TEnderecoIntegracao = class
    private
      FIDEndereco : Integer;
      FDSUF,
      FNMCidade,
      FNMBairro,
      FNMLogradouro,
      FDSComplemento: string;
    procedure setDSComplemento(const Value: string);
    procedure setDSUF(const Value: string);
    procedure setIDEndereco(const Value: Integer);
    procedure setNMBairro(const Value: string);
    procedure setNMCidade(const Value: string);
    procedure setNMLogradouro(const Value: string);
    public
      constructor Create;
      destructor Destroy; override;
    published
      [PK, FK]
      property IDEndereco: Integer read FIDEndereco write setIDEndereco;
      property DSUF: string read FDSUF write setDSUF;
      property NMCidade: string read FNMCidade write setNMCidade;
      property NMBairro: string read FNMBairro write setNMBairro;
      property NMLogradouro: string read FNMLogradouro write setNMLogradouro;
      property DSComplemento: string read FDSComplemento write setDSComplemento;
  end;

implementation

{ TEnderecoIntegracao }

constructor TEnderecoIntegracao.Create;
begin

end;

destructor TEnderecoIntegracao.Destroy;
begin

  inherited;
end;

procedure TEnderecoIntegracao.setDSComplemento(const Value: string);
begin
  FDSComplemento := Value;
end;

procedure TEnderecoIntegracao.setDSUF(const Value: string);
begin
  FDSUF := Value;
end;

procedure TEnderecoIntegracao.setIDEndereco(const Value: Integer);
begin
  FIDEndereco := Value;
end;

procedure TEnderecoIntegracao.setNMBairro(const Value: string);
begin
  FNMBairro := Value;
end;

procedure TEnderecoIntegracao.setNMCidade(const Value: string);
begin
  FNMCidade := Value;
end;

procedure TEnderecoIntegracao.setNMLogradouro(const Value: string);
begin
  FNMLogradouro := Value;
end;

end.


