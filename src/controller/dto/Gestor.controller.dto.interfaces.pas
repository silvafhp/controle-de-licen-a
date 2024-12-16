unit Gestor.controller.dto.interfaces;

interface

uses
  System.Classes,
  Gestor.model.service.interfaces,
  Gestor.model.entity.cliente,
  Gestor.model.entity.software,
  Gestor.model.entity.software.modulo,
  Gestor.model.entity.contrato,
  Gestor.model.entity.Contrato.modulo;
type
  iCliente = interface
    ['{132658D2-2A61-4FCC-AD31-F21296E78396}']
    function ID(Value : string) : iCliente; overload;
    function ID : string; overload;
    function NOME(Value : string) : iCliente; overload;
    function NOME : string; overload;
    function CNPJ(Value : string) : iCliente; overload;
    function CNPJ : string; overload;
    function Build : iService<TCliente>;
    function PreencherLista(Value : TStrings) : iCliente;
  end;

  iSoftware = interface
    ['{281939FC-5C56-47D3-AD8F-116A60CF3725}']
    function ID(Value : string) : iSoftware; overload;
    function ID : string; overload;
    function NOME(Value : string) : iSoftware; overload;
    function NOME : string; overload;
    function DESCRICAO(Value : string) : iSoftware; overload;
    function DESCRICAO : string; overload;
    function Build : iService<TSoftware>;
    function PreencherLista(Value : TStrings) : iSoftware;
  end;

  iSoftwareModulo = interface
    ['{F4232DF3-EB14-44B0-A68C-AB51F98A42FE}']
    function ID(Value : string) : iSoftwareModulo; overload;
    function ID : string; overload;
    function IDSOFTWARE(Value : string) : iSoftwareModulo; overload;
    function IDSOFTWARE : string; overload;
    function NOME(Value : string) : iSoftwareModulo; overload;
    function NOME : string; overload;
    function Build : iService<TSoftwareModulo>;
    function PreencherLista(Value : TStrings) : iSoftwareModulo;
  end;

  iContrato = interface
    ['{BEB49930-E789-49CA-835B-E4972885DC17}']
    function ID(Value : string) : iContrato; overload;
    function ID : string; overload;
    function DESCRICAO(Value : string) : iContrato; overload;
    function DESCRICAO : string; overload;
    function IDCLIENTE(Value : string) : iContrato; overload;
    function IDCLIENTE : string; overload;
    function IDSOFTWARE(Value : string) : iContrato; overload;
    function IDSOFTWARE : string; overload;
    function BLOQUEADO(Value : string) : iContrato; overload;
    function BLOQUEADO : string; overload;
    function DATA(Value : TDateTime) : iContrato; overload;
    function DATA : TDateTime; overload;
    function VENCIMENTO(Value : TDateTime) : iContrato; overload;
    function VENCIMENTO : TDateTime; overload;
    function CHAVECONTRATO(Value : string) : iContrato; overload;
    function CHAVECONTRATO : string; overload;
    function Build : iService<TContrato>;
  end;

  iContratoModulo = interface
    ['{F4232DF3-EB14-44B0-A68C-AB51F98A42FE}']
    function ID(Value : string) : iContratoModulo; overload;
    function ID : string; overload;
    function IDCONTRATO(Value : string) : iContratoModulo; overload;
    function IDCONTRATO : string; overload;
    function IDMODULO(Value : string) : iContratoModulo; overload;
    function IDMODULO : string; overload;
    function Build : iService<TContratoModulo>;
  end;

implementation

end.
