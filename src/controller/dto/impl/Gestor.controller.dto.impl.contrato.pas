unit Gestor.controller.dto.impl.contrato;

interface

uses
  Gestor.controller.dto.interfaces,
  Gestor.model.entity.contrato,
  Gestor.model.service.interfaces;

Type
  TContratoDTO = class(TInterfacedObject, iContrato)
  private
    FEntity : TContrato;
    FService : iService<TContrato>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : iContrato;
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

implementation

uses
  Gestor.model.service.impl.rest;

{ TContratoDTO }

function TContratoDTO.BLOQUEADO: string;
begin
  Result := FEntity.BLOQUEADO;
end;

function TContratoDTO.BLOQUEADO(Value: string): iContrato;
begin
  Result := Self;
  FEntity.BLOQUEADO := Value;
end;

function TContratoDTO.Build: iService<TContrato>;
begin
  Result := FService;
end;

function TContratoDTO.CHAVECONTRATO: string;
begin
  Result := FEntity.CHAVECONTRATO;
end;

function TContratoDTO.CHAVECONTRATO(Value: string): iContrato;
begin
  Result := Self;
  FEntity.CHAVECONTRATO := Value;
end;

constructor TContratoDTO.Create;
begin
  FEntity := TContrato.Create;
  FService := TServiceRest<TContrato>.New(FEntity);
end;

function TContratoDTO.DATA: TDateTime;
begin
  Result := FEntity.DATA;
end;

function TContratoDTO.DESCRICAO: string;
begin
  Result := FEntity.DESCRICAO;
end;

function TContratoDTO.DESCRICAO(Value: string): iContrato;
begin
  Result := Self;
  FEntity.DESCRICAO := Value;
end;

function TContratoDTO.DATA(Value: TDateTime): iContrato;
begin
  Result := Self;
  FEntity.DATA := Value;
end;

destructor TContratoDTO.Destroy;
begin
  FEntity.Free;
  inherited;
end;

function TContratoDTO.ID(Value: string): iContrato;
begin
  Result := Self;
  FEntity.ID := Value;
end;

function TContratoDTO.ID: string;
begin
  Result := FEntity.ID;
end;

function TContratoDTO.IDCLIENTE(Value: string): iContrato;
begin
  Result := Self;
  FEntity.IDCLIENTE := Value;
end;

function TContratoDTO.IDCLIENTE: string;
begin
  Result := FEntity.IDCLIENTE;
end;

function TContratoDTO.IDSOFTWARE: string;
begin
  Result := FEntity.IDSOFTWARE;
end;

function TContratoDTO.IDSOFTWARE(Value: string): iContrato;
begin
  Result := Self;
  FEntity.IDSOFTWARE := Value;
end;

class function TContratoDTO.New : iContrato;
begin
  Result := Self.Create;
end;

function TContratoDTO.VENCIMENTO(Value : TDateTime): iContrato;
begin
  Result := Self;
  FEntity.VENCIMENTO := Value;
end;

function TContratoDTO.VENCIMENTO: TDateTime;
begin
  Result := FEntity.VENCIMENTO;
end;

end.
