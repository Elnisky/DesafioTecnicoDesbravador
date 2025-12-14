unit Interfaces.IConexaoFiredac;

interface

uses
  FireDAC.Comp.Client;

type
  IFDConnection = interface(IInterface)
    ['{A1B2C3D4-E5F6-1122-3344-556677889900}']
    function GetConnection: TFDConnection;
    procedure Connect;
    procedure Disconnect;
    function IsConnected: Boolean;
  end;

implementation

end.
