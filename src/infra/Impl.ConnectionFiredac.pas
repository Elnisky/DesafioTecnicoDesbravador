unit Impl.ConnectionFiredac;

interface

uses
  Interfaces.IConexaoFiredac,
  FireDAC.Comp.Client,
  FireDAC.DApt,
  FireDAC.Phys,
  FireDAC.Phys.Intf,
  FireDAC.Phys.PG,
  FireDAC.Phys.PGDef,
  FireDAC.Stan.Async,
  FireDAC.Stan.Def,
  FireDAC.Stan.Error,
  FireDAC.Stan.Factory,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Pool,
  FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait,
  System.SysUtils;

type
  TFDConnectionImpl = class(TInterfacedObject, IFDConnection)
  private
    FConnection : TFDConnection;
    FLink       : TFDPhysPgDriverLink;
    procedure Connect;
    procedure Disconnect;
    function IsConnected: Boolean;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IFDConnection;
    function GetConnection: TFDConnection;
  end;

implementation

{ TFDConnectionImpl }

procedure TFDConnectionImpl.Connect;
begin
  if not IsConnected then
    FConnection.Connected := True;
end;

constructor TFDConnectionImpl.Create;
begin
  FLink                                     := TFDPhysPgDriverLink.Create(nil);
  FLink.VendorLib                           := ExtractFilePath(ParamStr(0)) + 'libpq.dll';
  FConnection                               := TFDConnection.Create(nil);
  FConnection.DriverName                    := 'PG';
  FConnection.Params.Values['Server']       := '127.0.0.1';
  FConnection.Params.Values['Database']     := 'desbravador';
  FConnection.Params.Values['User_Name']    := 'postgres';
  FConnection.Params.Values['Password']     := 'root';
  FConnection.Params.Values['Port']         := '5432';
  FConnection.Params.Values['CharacterSet'] := 'UTF8';
  FConnection.LoginPrompt                   := False;
  try
    Connect;
  except
    on E: Exception do
      raise Exception.Create('Erro ao conectar ao banco PostgreSQL: ' + E.Message);
  end;
end;

destructor TFDConnectionImpl.Destroy;
begin
  Disconnect;
  FConnection.Free;
  FLink.Free;
  inherited;
end;

procedure TFDConnectionImpl.Disconnect;
begin
  if IsConnected then
    FConnection.Connected := False;
end;

function TFDConnectionImpl.GetConnection: TFDConnection;
begin
  Result := FConnection;
end;

function TFDConnectionImpl.IsConnected: Boolean;
begin
  Result := FConnection.Connected;
end;

class function TFDConnectionImpl.New: IFDConnection;
begin
  Result := Self.Create;
end;

end.
