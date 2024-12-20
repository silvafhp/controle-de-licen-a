program Gestor;

uses
  Vcl.Forms,
  Gestor.view.pages.index in 'src\View\Pages\Gestor.view.pages.index.pas' {PageIndex},
  Gestor.view.routers in 'src\view\routers\Gestor.view.routers.pas',
  Gestor.view.pages.login in 'src\view\pages\Gestor.view.pages.login.pas' {PageLogin},
  Gestor.view.pages.principal in 'src\view\pages\Gestor.view.pages.principal.pas' {PagePrincipal},
  Gestor.view.styles in 'src\view\Styles\Gestor.view.styles.pas',
  Gestor.view.Main in 'src\view\Gestor.view.Main.pas' {FormMain},
  Gestor.view.pages.generic in 'src\view\pages\Gestor.view.pages.generic.pas' {PageGeneric},
  Gestor.view.pages.template in 'src\view\pages\Gestor.view.pages.template.pas' {PageTemplate},
  Gestor.view.pages.clientes in 'src\view\pages\Gestor.view.pages.clientes.pas' {PageClientes},
  Gestor.model.service.interfaces in 'src\model\service\Gestor.model.service.interfaces.pas',
  Gestor.model.resource.interfaces in 'src\model\resource\Gestor.model.resource.interfaces.pas',
  Gestor.model.resource.impl.rest in 'src\model\resource\impl\Gestor.model.resource.impl.rest.pas',
  Gestor.model.resource.impl.rest.params in 'src\model\resource\impl\Gestor.model.resource.impl.rest.params.pas',
  Gestor.model.service.impl.rest in 'src\model\service\impl\Gestor.model.service.impl.rest.pas',
  Gestor.model.entity.cliente in 'src\model\entity\Gestor.model.entity.cliente.pas',
  Gestor.controller.interfaces in 'src\controller\Gestor.controller.interfaces.pas',
  Gestor.utils.rest.attributes in 'src\utils\Gestor.utils.rest.attributes.pas',
  Gestor.controller.dto.impl.cliente in 'src\controller\dto\impl\Gestor.controller.dto.impl.cliente.pas',
  Gestor.controller.dto.interfaces in 'src\controller\dto\Gestor.controller.dto.interfaces.pas',
  Gestor.utils.rtti in 'src\utils\Gestor.utils.rtti.pas',
  Gestor.utils.rtti.helper in 'src\utils\Gestor.utils.rtti.helper.pas',
  Gestor.controller.impl.controller in 'src\controller\impl\Gestor.controller.impl.controller.pas',
  Gestor.model.resource.impl.rest.factory in 'src\model\resource\impl\Gestor.model.resource.impl.rest.factory.pas',
  Gestor.model.entity.software in 'src\model\entity\Gestor.model.entity.software.pas',
  Gestor.controller.dto.impl.Software in 'src\controller\dto\impl\Gestor.controller.dto.impl.Software.pas',
  Gestor.view.pages.softwares in 'src\view\pages\Gestor.view.pages.softwares.pas' {PageSoftwares},
  Gestor.view.pages.contratos in 'src\view\pages\Gestor.view.pages.contratos.pas' {PageContratos},
  Gestor.model.entity.software.modulo in 'src\model\entity\Gestor.model.entity.software.modulo.pas',
  Gestor.controller.dto.impl.software.modulo in 'src\controller\dto\impl\Gestor.controller.dto.impl.software.modulo.pas',
  Gestor.model.entity.contrato in 'src\model\entity\Gestor.model.entity.contrato.pas',
  Gestor.controller.dto.impl.contrato in 'src\controller\dto\impl\Gestor.controller.dto.impl.contrato.pas',
  Gestor.utils in 'src\utils\Gestor.utils.pas',
  Gestor.controller.dto.impl.contrato.modulos in 'src\controller\dto\impl\Gestor.controller.dto.impl.contrato.modulos.pas',
  Gestor.model.entity.Contrato.modulo in 'src\model\entity\Gestor.model.entity.Contrato.modulo.pas',
  Gestor.utils.tstrings.helper in 'src\utils\Gestor.utils.tstrings.helper.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := true;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TPageIndex, PageIndex);
  Application.Run;
end.
