unit View.CadastroPessoa;

interface

uses
  Controller.Endereco,
  Controller.Pessoa,
  Entidade.Endereco,
  Entidade.Pessoa,
  Impl.ConnectionFiredac,
  Interfaces.IConexaoFiredac,

  System.Classes,
  System.DateUtils,
  System.StrUtils,
  System.SysUtils,
  System.Variants,
  Vcl.Buttons,
  Vcl.Controls,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.Forms,
  Vcl.Graphics,
  Vcl.Mask,
  Vcl.StdCtrls,
  Winapi.Windows,
  Winapi.Messages;

type
  TfrmCadastroPessoa = class(TForm)
    pnlToolbar     : TPanel;
    pnlCancelar    : TPanel;
    shpCancelar    : TShape;
    btnCancelar    : TSpeedButton;
    pnlSalvar      : TPanel;
    shpSalvar      : TShape;
    btnSalvar      : TSpeedButton;
    edtPrimeiro    : TLabeledEdit;
    edtSegundo     : TLabeledEdit;
    gbxDocumento   : TGroupBox;
    cmbTipo        : TComboBox;
    lblTipo        : TLabel;
    edtDocumento   : TLabeledEdit;
    gbxEndereco    : TGroupBox;
    edtCEP         : TLabeledEdit;
    edtUF          : TLabeledEdit;
    edtCidade      : TLabeledEdit;
    edtBairro      : TLabeledEdit;
    edtLogradouro  : TLabeledEdit;
    edtComplemento : TLabeledEdit;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cmbTipoChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtCEPChange(Sender: TObject);
  private
    FDConnImpl          : IFDConnection;
    FPessoa             : TPessoa;
    FControllerPessoa   : TControllerPessoa;
    FControllerEndereco : TControllerEndereco;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroPessoa: TfrmCadastroPessoa;

implementation

uses
  Controller.CEP,
  Entidade.CEP;

{$R *.dfm}

procedure TfrmCadastroPessoa.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadastroPessoa.btnSalvarClick(Sender: TObject);
begin
  FPessoa.NMPrimeiro  := edtPrimeiro.Text;
  FPessoa.NMSegundo   := edtSegundo.Text;
  FPessoa.FLNatureza  := Succ(cmbTipo.ItemIndex);
  FPessoa.DSDocumento := edtDocumento.Text;
  if Tag > 0 then
    FControllerPessoa.Atualizar(FPessoa)
  else
  begin
    FPessoa.DTRegistro := Today;
    FControllerPessoa.Inserir(FPessoa);
  end;
  btnCancelar.Click;
end;

procedure TfrmCadastroPessoa.cmbTipoChange(Sender: TObject);
begin
  edtDocumento.Text     := '';
  edtDocumento.EditMask := IfThen(cmbTipo.ItemIndex = 0, '000.000.000-00;0', '00.000.000/0000-00;0');
end;

procedure TfrmCadastroPessoa.edtCEPChange(Sender: TObject);
begin
  if Length(edtCEP.Text) = 8 then
  begin
    var LControllerCEP  := TControllerCEP.Create;
    var CEP             := LControllerCEP.ListarCEP(edtCEP.Text);
    edtUF.Text          := CEP.UF;
    edtCidade.Text      := CEP.Cidade;
    edtBairro.Text      := CEP.Bairro;
    edtLogradouro.Text  := CEP.Logradouro;
    edtComplemento.Text := CEP.Complemento;
    CEP.Free;
    LControllerCEP.Free;
  end;
end;

procedure TfrmCadastroPessoa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FPessoa.Free;
  FControllerEndereco.Free;
end;

procedure TfrmCadastroPessoa.FormCreate(Sender: TObject);
begin
  FDConnImpl          := TFDConnectionImpl.New;
  FControllerPessoa   := TControllerPessoa.Create(FDConnImpl.GetConnection);
  FControllerEndereco := TControllerEndereco.Create(FDConnImpl.GetConnection);
end;

procedure TfrmCadastroPessoa.FormShow(Sender: TObject);
begin
   if Tag > 0 then
   begin
     FPessoa                 := FControllerPessoa.ListarPessoaPorID(Tag);
     edtPrimeiro.Text        := FPessoa.NMPrimeiro;
     edtSegundo.Text         := FPessoa.NMSegundo;
     cmbTipo.ItemIndex       := Pred(FPessoa.FLNatureza);
     edtDocumento.EditMask   := IfThen(FPessoa.FLNatureza = 1, '000.000.000-00;0', '00.000.000/0000-00;0');
     edtDocumento.Text       := FPessoa.DSDocumento;
     var LEnderecoIntegracao := FControllerEndereco.ListarEnderecoPorIDPessoa(FPessoa.IDPessoa);
     edtCEP.Text             := LEnderecoIntegracao.DSCEP;
   end
   else
   begin
     FPessoa := TPessoa.Create;
     cmbTipoChange(nil);
   end;
end;

end.
