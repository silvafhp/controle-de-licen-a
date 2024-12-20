unit Gestor.controller.dto.impl.contrato.modulos;

interface

uses
  System.Classes,
  Gestor.controller.dto.interfaces,
  Gestor.model.entity.Contrato.modulo,
  Gestor.model.service.interfaces;

Type
  TContratoModuloDTO = class(TInterfacedObject, iContratoModulo)
  private
    FEntity : TContratoModulo;
    FService : iService<TContratoModulo>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : iContratoModulo;
    function ID(Value : string) : iContratoModulo; overload;
    function ID : string; overload;
    function IDCONTRATO(Value : string) : iContratoModulo; overload;
    function IDCONTRATO : string; overload;
    function IDMODULO(Value : string) : iContratoModulo; overload;
    function IDMODULO : string; overload;
    function Build : iService<TContratoModulo>;
  end;

implementation

uses
  System.SysUtils,
  Gestor.model.service.impl.rest;

{ TContratoModuloDTO }

function TContratoModuloDTO.Build: iService<TContratoModulo>;
begin
  Result := FService;
end;

constructor TContratoModuloDTO.Create;
begin
  FEntity := TContratoModulo.Create;
  FService := TServiceRest<TContratoModulo>.New(FEntity);
end;

destructor TContratoModuloDTO.Destroy;
begin
  FEntity.Free;
  inherited;
end;

function TContratoModuloDTO.ID(Value: string): iContratoModulo;
begin
  Result := Self;
  FEntity.ID := Value;
end;

function TContratoModuloDTO.ID: string;
begin
  Result := FEntity.ID;
end;

function TContratoModuloDTO.IDCONTRATO(Value: string): iContratoModulo;
begin
  Result := Self;
  FEntity.IDCONTRATO := Value;

end;

function TContratoModuloDTO.IDCONTRATO: string;
begin
  Result := FEntity.IDCONTRATO;
end;

function TContratoModuloDTO.IDMODULO: string;
begin
  Result := FEntity.IDMODULO;
end;

function TContratoModuloDTO.IDMODULO(Value: string): iContratoModulo;
begin
  Result := Self;
  FEntity.IDMODULO := Value;
end;

class function TContratoModuloDTO.New : iContratoModulo;
begin
  Result := Self.Create;
end;

end.
