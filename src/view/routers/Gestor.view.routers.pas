unit Gestor.view.routers;

interface

type
  TRouters = class
    private
    public
      constructor Create;
      destructor Destroy; override;
  end;

var
  Routers : TRouters;

implementation
uses
  Router4D,
  Gestor.view.pages.login,
  Gestor.view.pages.Principal,
  Gestor.view.Main,
  Gestor.view.pages.generic,
  Gestor.view.pages.clientes,
  Gestor.view.pages.softwares,
  Gestor.view.pages.contratos;

{ TRouters }

constructor TRouters.Create;
begin
  TRouter4D
    .Switch
      .Router('Login', TPageLogin)
      .Router('Main', TFormMain)
      .Router('Generic', TPageGeneric)
      .Router('Principal', TPagePrincipal)
      .Router('Clientes', TPageClientes)
      .Router('Softwares', TPageSoftwares)
      .Router('Contratos', TPageContratos);
end;

destructor TRouters.Destroy;
begin

  inherited;
end;

initialization
  Routers := TRouters.Create;

finalization
  Routers.Free;

end.
