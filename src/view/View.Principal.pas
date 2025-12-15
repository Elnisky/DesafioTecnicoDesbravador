unit View.Principal;

interface

uses
  Controller.Atualizacao,
  Controller.EnderecoIntegracao,
  Controller.Pessoa,
  Entidade.EnderecoIntegracao,
  Entidade.Pessoa,
  Impl.ConnectionFiredac,
  Interfaces.IConexaoFiredac,
  Data.DB,
  Datasnap.DBClient,
  System.Classes,
  System.Generics.Collections,
  System.MaskUtils,
  System.Math,
  System.StrUtils,
  System.SysUtils,
  System.TypInfo,
  System.UITypes,
  System.Variants,
  Vcl.Buttons,
  Vcl.Controls,
  Vcl.DBGrids,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.Forms,
  Vcl.Graphics,
  Vcl.Grids,
  Vcl.Menus,

  Winapi.Messages,
  Winapi.Windows;

type
  TfrmPrincipal = class(TForm)
    grdVendas               : TDBGrid;
    cdsCadastro             : TClientDataSet;
    dsCadastro              : TDataSource;
    pnlToolbar              : TPanel;
    pnlAtualizar            : TPanel;
    shpAtualizar            : TShape;
    btnAtualizar            : TSpeedButton;
    pnlIncluir              : TPanel;
    shpIncluir              : TShape;
    btnIncluir              : TSpeedButton;
    pnlExcluir              : TPanel;
    shpExcluir              : TShape;
    btnExcluir              : TSpeedButton;
    pnlPaginacao            : TPanel;
    pnlPagAnterior          : TPanel;
    shpAnterior             : TShape;
    btnAnterior             : TSpeedButton;
    pnlPagProxima           : TPanel;
    shpProxima              : TShape;
    btnProxima              : TSpeedButton;
    cdsCadastroIDPessoa     : TIntegerField;
    cdsCadastroTipo         : TStringField;
    cdsCadastroNome         : TStringField;
    cdsCadastroDocumento    : TStringField;
    cdsCadastroDataRegistro : TDateTimeField;
    pnlPagPrimeira          : TPanel;
    shpPrimeira             : TShape;
    btnPrimeira             : TSpeedButton;
    pnlPagUltima            : TPanel;
    shpUltima               : TShape;
    btnUltima               : TSpeedButton;
    cdsCadastroEndereco     : TStringField;
    pnlAtualizarEnderecos   : TPanel;
    shpAtualizarEnderecos   : TShape;
    btnAtualizarEnderecos   : TSpeedButton;
    pnlImportarMassa: TPanel;
    shpImportarMassa: TShape;
    btnImportarMassa: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnIncluirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnPrimeiraClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAtualizarEnderecosClick(Sender: TObject);
    procedure btnImportarMassaClick(Sender: TObject);
  private
    FDConnImpl                    : IFDConnection;
    FControllerPessoa             : TControllerPessoa;
    FControllerEnderecoIntegracao : TControllerEnderecoIntegracao;
    FListaPessoas                 : TObjectList<TPessoa>;
    procedure AtualizarGrid;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  Controller.Importacao,
  System.Diagnostics,
  View.CadastroPessoa,
  View.Splashscreen;

{$R *.dfm}

procedure TfrmPrincipal.AtualizarGrid;
begin
  FListaPessoas := FControllerPessoa.ListarPessoas(Tag);
  cdsCadastro.DisableControls;
  try
    cdsCadastro.EmptyDataSet;
    for var Pessoa in FListaPessoas do
    begin
      cdsCadastro.Append;
      cdsCadastroIDPessoa.AsInteger      := Pessoa.IDPessoa;
      cdsCadastroTipo.AsString           := IfThen(Pessoa.FLNatureza = 1, 'Física', 'Jurídica');
      cdsCadastroDocumento.AsString      := FormatMaskText(IfThen(Pessoa.FLNatureza = 1, '000.000.000-00;0', '00.000.000/0000-00;0'), Pessoa.DSDocumento);
      cdsCadastroNome.AsString           := Concat(Pessoa.NMPrimeiro, ' ', Pessoa.NMSegundo);
      cdsCadastroDataRegistro.AsDateTime := Pessoa.DTRegistro;
      var LEndereco                      := FControllerEnderecoIntegracao.ListarEnderecoPorIDPessoa(Pessoa.IDPessoa);
      if Assigned(LEndereco) then
      begin
        cdsCadastroEndereco.AsString := LEndereco.NMLogradouro;
        LEndereco.Free;
      end;
      cdsCadastro.Post;
    end;
    cdsCadastro.First;
  finally
    if Assigned(FListaPessoas) then
      FListaPessoas.Free;
    cdsCadastro.EnableControls;
  end;
end;

procedure TfrmPrincipal.btnAtualizarEnderecosClick(Sender: TObject);
begin
  var LControllerAtualizacao := TControllerAtualizacao.Create(FDConnImpl.GetConnection);
  try
    var Stopwatch := TStopwatch.StartNew;
    LControllerAtualizacao.Atualizar;
    Stopwatch.Stop;
    ShowMessage(FormatDateTime('hh:nn:ss', Stopwatch.Elapsed.TotalSeconds / SecsPerDay));
  finally
    LControllerAtualizacao.Free;
    Tag := 1;
    AtualizarGrid;
  end;
end;

procedure TfrmPrincipal.btnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Deseja realmente excluir esta pessoa?',
                mtConfirmation,
                [mbYes, mbNo],
                0,
                mbNo) = mrYes then
  begin
    var LPessoa := FControllerPessoa.ListarPessoaPorID(cdsCadastroIDPessoa.AsInteger);
    if Assigned(LPessoa) then
    begin
      FControllerPessoa.Excluir(LPessoa);
      LPessoa.Free;
      ShowMessage('Pessoa excluída com sucesso!');
    end;
  end;
end;

procedure TfrmPrincipal.btnImportarMassaClick(Sender: TObject);
begin
  var LControllerImportacao := TControllerImportacao.Create(FDConnImpl.GetConnection);
  try
    var Stopwatch := TStopwatch.StartNew;
    LControllerImportacao.Importar;
    Stopwatch.Stop;
    ShowMessage(FormatDateTime('hh:nn:ss', Stopwatch.Elapsed.TotalSeconds / SecsPerDay));
  finally
    LControllerImportacao.Free;
    Tag := 1;
    AtualizarGrid;
  end;
end;

procedure TfrmPrincipal.btnIncluirClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCadastroPessoa, frmCadastroPessoa);
  try
    if Sender = btnAtualizar then
      frmCadastroPessoa.Tag := cdsCadastroIDPessoa.AsInteger;
    frmCadastroPessoa.ShowModal;
  finally
    FreeAndNil(frmCadastroPessoa);
  end;

  AtualizarGrid;
end;

procedure TfrmPrincipal.btnPrimeiraClick(Sender: TObject);
begin
  var LMax := Ceil(FControllerPessoa.ObterTotal / 100);

  if Sender = btnPrimeira then
    Tag := 1
  else if (Sender = btnAnterior) and InRange(Pred(Tag), 1, LMax) then
    Tag := Tag - 1
  else if (Sender = btnProxima) and InRange(Succ(Tag), 1, LMax) then
    Tag := Tag + 1
  else if Sender = btnUltima then
    Tag := LMax
  else
    Exit;

  AtualizarGrid;
  pnlPaginacao.Caption := 'Página ' + Tag.ToString + ' de ' + LMax.ToString;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FControllerPessoa.Free;
  FControllerEnderecoIntegracao.Free;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  Application.CreateForm(TfrmSplash, frmSplash);
  try
    frmSplash.ShowModal;
  finally
    FreeAndNil(frmSplash);
  end;
  Tag                           := 2;
  FDConnImpl                    := TFDConnectionImpl.New;
  FControllerPessoa             := TControllerPessoa.Create(FDConnImpl.GetConnection);
  FControllerEnderecoIntegracao := TControllerEnderecoIntegracao.Create(FDConnImpl.GetConnection);
end;

procedure TfrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_INSERT : btnIncluir.Click;
    VK_DELETE : btnExcluir.Click;
  end;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  BringToFront;
  btnAnterior.Click;
end;

end.

