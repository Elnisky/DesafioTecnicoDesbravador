program DesafioTecnicoDesbravador;

uses
  Vcl.Forms,
  View.Splashscreen in 'src\view\View.Splashscreen.pas' {frmSplash},
  View.Principal in 'src\view\View.Principal.pas' {frmPrincipal},
  Impl.ConnectionFiredac in 'src\infra\Impl.ConnectionFiredac.pas',
  Interfaces.IConexaoFiredac in 'src\infra\Interfaces.IConexaoFiredac.pas',
  Entidade.Pessoa in 'src\model\entities\Entidade.Pessoa.pas',
  Controller.Servico.Pessoa in 'src\controller\services\Controller.Servico.Pessoa.pas',
  Fabrica.Repositorio in 'src\model\factories\Fabrica.Repositorio.pas',
  Persistencia.ORM in 'src\model\persistence\Persistencia.ORM.pas',
  Controller.Pessoa in 'src\controller\Controller.Pessoa.pas',
  View.CadastroPessoa in 'src\view\View.CadastroPessoa.pas' {frmCadastroPessoa},
  Entidade.Endereco in 'src\model\entities\Entidade.Endereco.pas',
  Controller.Servico.Endereco in 'src\controller\services\Controller.Servico.Endereco.pas',
  Controller.Endereco in 'src\controller\Controller.Endereco.pas',
  Entidade.EnderecoIntegracao in 'src\model\entities\Entidade.EnderecoIntegracao.pas',
  Controller.Servico.EnderecoIntegracao in 'src\controller\services\Controller.Servico.EnderecoIntegracao.pas',
  Controller.EnderecoIntegracao in 'src\controller\Controller.EnderecoIntegracao.pas',
  Controller.CEP in 'src\controller\Controller.CEP.pas',
  Controller.Servico.CEP in 'src\controller\services\Controller.Servico.CEP.pas',
  Entidade.CEP in 'src\model\entities\Entidade.CEP.pas',
  Controller.Atualizacao in 'src\controller\Controller.Atualizacao.pas',
  Controller.Servico.Atualizacao in 'src\controller\services\Controller.Servico.Atualizacao.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmCadastroPessoa, frmCadastroPessoa);
  Application.Run;
end.
