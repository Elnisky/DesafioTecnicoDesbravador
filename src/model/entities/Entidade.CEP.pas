unit Entidade.CEP;

interface

{$M+}

type
  TCEP = class
    private
      FUF,
      FCidade,
      FBairro,
      FLogradouro,
      FComplemento : string;
      procedure setBairro(const Value: string);
      procedure setCidade(const Value: string);
      procedure setLogradouro(const Value: string);
      procedure setUF(const Value: string);
      procedure setComplemento(const Value: string);
    public
      constructor Create;
      destructor Destroy; override;
    published
      property UF: string read FUF write setUF;
      property Cidade: string read FCidade write setCidade;
      property Bairro: string read FBairro write setBairro;
      property Logradouro: string read FLogradouro write setLogradouro;
      property Complemento: string read FComplemento write setComplemento;
  end;

implementation

{ TCEP }

constructor TCEP.Create;
begin

end;

destructor TCEP.Destroy;
begin

  inherited;
end;

procedure TCEP.setBairro(const Value: string);
begin
  FBairro := Value;
end;

procedure TCEP.setCidade(const Value: string);
begin
  FCidade := Value;
end;

procedure TCEP.setComplemento(const Value: string);
begin
  FComplemento := Value;
end;

procedure TCEP.setLogradouro(const Value: string);
begin
  FLogradouro := Value;
end;

procedure TCEP.setUF(const Value: string);
begin
  FUF := Value;
end;

end.


