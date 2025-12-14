unit View.Splashscreen;

interface

uses
  System.Classes,
  System.SysUtils,
  System.Variants,
  Vcl.Controls,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.Forms,
  Vcl.Graphics,
  Vcl.Skia,
  Winapi.Messages,
  Winapi.Windows, Vcl.Imaging.jpeg, Vcl.Imaging.pngimage;

type
  TfrmSplash = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSplash: TfrmSplash;

implementation

{$R *.dfm}

procedure TfrmSplash.FormShow(Sender: TObject);
begin
  Timer1.Enabled := True;
end;

procedure TfrmSplash.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  Close;
end;

end.
