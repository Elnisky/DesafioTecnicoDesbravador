unit Entidade.Endereco;

interface

{$M+}

uses
  SimpleAttributes;

type
  [Tabela('endereco')]
  TEndereco = class
    private
      FIDPessoa,
      FIDEndereco  : Integer;
      FDSCEP       : string;
    procedure setDSCEP(const Value: string);
    procedure setIDEndereco(const Value: Integer);
    procedure setIDPessoa(const Value: Integer);
    public
      constructor Create;
      destructor Destroy; override;
    published
      [PK, AutoInc]
      [Campo('idendereco')]
      property IDEndereco: Integer read FIDEndereco write setIDEndereco;
      [FK]
      property IDPessoa: Integer read FIDPessoa write setIDPessoa;
      property DSCEP: string read FDSCEP write setDSCEP;
  end;

implementation

{ TEndereco }

constructor TEndereco.Create;
begin

end;

destructor TEndereco.Destroy;
begin

  inherited;
end;

procedure TEndereco.setDSCEP(const Value: string);
begin
  FDSCEP := Value;
end;

procedure TEndereco.setIDEndereco(const Value: Integer);
begin
  FIDEndereco := Value;
end;

procedure TEndereco.setIDPessoa(const Value: Integer);
begin
  FIDPessoa := Value;
end;

end.


