unit Controller.Servico.Importacao;
{$INLINE OFF}
interface

uses
  Entidade.Pessoa,
  Data.DB,
  System.Generics.Collections;

type
  TServicoImportacao = class
  private
    FConnection : TCustomConnection;
    function LerCSV(const FileName: string): TObjectList<TPessoa>;
  public
    constructor Create(AConnection : TCustomConnection);
    destructor Destroy; override;
    function Importar: Boolean;
  end;

implementation

uses
  Controller.Pessoa,
  Impl.ConnectionFiredac,
  Interfaces.IConexaoFiredac,
  System.DateUtils,
  System.IOUtils,
  System.Math,
  System.SysUtils,
  System.Threading,
  Winapi.Windows;

{ TServicoImportacao }

constructor TServicoImportacao.Create(AConnection : TCustomConnection);
begin
  FConnection := AConnection;
end;

destructor TServicoImportacao.Destroy;
begin

  inherited;
end;

function TServicoImportacao.LerCSV(const FileName: string): TObjectList<TPessoa>;
var
  Lines: TArray<string>;
  Pessoas: TObjectList<TPessoa>;
begin
  Pessoas := TObjectList<TPessoa>.Create(True);
  Lines   := TFile.ReadAllLines(FileName);

  TParallel.For(1, // começa em 1 para pular cabeçalho
                High(Lines),
                procedure (Idx: Integer)
                var
                  Parts : TArray<string>;
                  P     : TPessoa;
                begin
                  Parts := Lines[Idx].Split([',']);
                  if Length(Parts) >= 5 then
                  begin
                    P             := TPessoa.Create;
                    P.IDPessoa    := 0;
                    P.FLNatureza  := Parts[0].ToInteger;
                    P.DSDocumento := Parts[1];
                    P.NMPrimeiro  := Parts[2];
                    P.NMSegundo   := Parts[3];
                    P.DTRegistro  := ISO8601ToDate(Parts[4]);

                    // sincroniza o acesso à lista
                    TMonitor.Enter(Pessoas);
                    try
                      Pessoas.Add(P);
                    finally
                      TMonitor.Exit(Pessoas);
                    end;
                  end;
                end);
  Result := Pessoas;
end;

function TServicoImportacao.Importar: Boolean;
const
  LOTE = 1000;
begin
  var LPessoas    := LerCSV(ExtractFilePath(ParamStr(0)) + 'pessoas.csv');
  var LMax        := Ceil(LPessoas.Count / LOTE);
  var LImportacao := TObjectList<TPessoa>.Create(True);

  try
    for var I := 0 to Pred(LMax) do
    begin
      if LPessoas.Count > 0 then
      begin
        var Inicio := I * LOTE;
        var Fim    := Min(LOTE, LPessoas.Count - Inicio);
        LImportacao.InsertRange(0, Copy(LPessoas.ToArray, Inicio, Fim), Fim);
        if LImportacao.Count > 0 then
        begin
          var LControllerPessoa := TControllerPessoa.Create(FConnection);
          LControllerPessoa.Inserir(LImportacao);
          LControllerPessoa.Free;
        end;
      end;
      LImportacao.Clear;
    end;
    Result := True;
  finally
    LPessoas.Free;
    LImportacao.Free;
  end;
end;

end.


