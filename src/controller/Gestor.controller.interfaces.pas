unit Gestor.controller.interfaces;

interface
uses
  gestor.controller.dto.Interfaces;
type
  iController = interface
    ['{31263D1B-2F36-4D40-BF93-3CB4822F8A68}']
    function Software: iSoftware;
    function SoftwareModulo: iSoftwareModulo;
    function Cliente: iCliente;
    function Contrato : iContrato;
    function ContratoModulo : iContratoModulo;
  end;

implementation

end.