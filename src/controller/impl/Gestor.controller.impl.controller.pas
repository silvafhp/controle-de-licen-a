unit Gestor.controller.impl.controller;

interface

uses
  Gestor.controller.interfaces,
  Gestor.controller.dto.interfaces;

Type
  TController = class(TInterfacedObject, iController)
  private
    FCliente : iCliente;
    FSoftware : iSoftware;
    FSoftwareModulo : iSoftwareModulo;
    FContrato : iContrato;
    FContratoModulo : iContratoModulo;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : iController;
    function Cliente: iCliente;
    function Software: iSoftware;
    function SoftwareModulo : iSoftwareModulo;
    function Contrato : iContrato;
    function ContratoModulo : iContratoModulo;
  end;

implementation

uses
  Gestor.controller.dto.impl.cliente,
  Gestor.controller.dto.impl.software,
  Gestor.controller.dto.impl.software.modulo,
  Gestor.controller.dto.impl.contrato,
  Gestor.controller.dto.impl.contrato.modulos;

{ TController }

function TController.Cliente: iCliente;
begin
  if not assigned(FCliente) then
    FCliente := TClienteDTO.New;

  Result := FCliente;
end;

function TController.Contrato: iContrato;
begin
  if not Assigned(FContrato) then
    FContrato := TContratoDTO.New;

  Result := FContrato;
end;

function TController.ContratoModulo: iContratoModulo;
begin
  if not Assigned(FContratoModulo) then
    FContratoModulo := TContratoModuloDTO.New;

  Result := FContratoModulo;
end;

constructor TController.Create;
begin

end;

destructor TController.Destroy;
begin

  inherited;
end;

class function TController.New : iController;
begin
  Result := Self.Create;
end;

function TController.Software: iSoftware;
begin
  if not Assigned(FSoftware) then
    FSoftware := TSoftwareDTO.New;

  Result := FSoftware;
end;

function TController.SoftwareModulo: iSoftwareModulo;
begin
  if not Assigned(FSoftwareModulo) then
    FSoftwareModulo := TSoftwareModuloDTO.New;

  Result := FSoftwareModulo;
end;

end.
