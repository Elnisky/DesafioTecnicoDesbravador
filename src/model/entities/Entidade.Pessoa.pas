unit Entidade.Pessoa;

interface

{$M+}

uses
  SimpleAttributes;

type
  [Tabela('pessoa')]
  TPessoa = class
    private
      FIDPessoa,
      FFLNatureza  : Integer;
      FNMPrimeiro,
      FNMSegundo,
      FDSDocumento : string;
      FDTRegistro  : TDateTime;

      procedure setDSDocumento(const Value: string);
      procedure setDTRegistro(const Value: TDateTime);
      procedure setFLNatureza(const Value: Integer);
      procedure setIDPessoa(const Value: Integer);
      procedure setNMPrimeiro(const Value: string);
      procedure setNMSegundo(const Value: string);
    public
      constructor Create;
      destructor Destroy; override;
    published
      [PK, AutoInc]
      [Campo('idpessoa')]
      property IDPessoa: Integer read FIDPessoa write setIDPessoa;
      property FLNatureza: Integer read FFLNatureza write setFLNatureza;
      property DSDocumento: string read FDSDocumento write setDSDocumento;
      property NMPrimeiro: string read FNMPrimeiro write setNMPrimeiro;
      property NMSegundo: string read FNMSegundo write setNMSegundo;
      property DTRegistro: TDateTime read FDTRegistro write setDTRegistro;
  end;

implementation

{ TPessoa }

constructor TPessoa.Create;
begin

end;

destructor TPessoa.Destroy;
begin

  inherited;
end;

procedure TPessoa.setDSDocumento(const Value: string);
begin
  FDSDocumento := Value;
end;

procedure TPessoa.setDTRegistro(const Value: TDateTime);
begin
  FDTRegistro := Value;
end;

procedure TPessoa.setFLNatureza(const Value: Integer);
begin
  FFLNatureza := Value;
end;

procedure TPessoa.setIDPessoa(const Value: Integer);
begin
  FIDPessoa := Value;
end;

procedure TPessoa.setNMPrimeiro(const Value: string);
begin
  FNMPrimeiro := Value;
end;

procedure TPessoa.setNMSegundo(const Value: string);
begin
  FNMSegundo := Value;
end;

end.


