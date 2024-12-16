unit Gestor.controller.dto.impl.software.modulo;

interface

uses
  Gestor.controller.dto.interfaces,
  Gestor.model.service.interfaces,
  Gestor.model.entity.software.modulo, System.Classes;

Type
  TSoftwareModuloDTO = class(TInterfacedObject, iSoftwareModulo)
  private
    FEntity : TSoftwareModulo;
    FService : iService<TSoftwareModulo>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : iSoftwareModulo;
    function ID(Value : string) : iSoftwareModulo; overload;
    function ID : string; overload;
    function IDSOFTWARE(Value : string) : iSoftwareModulo; overload;
    function IDSOFTWARE : string; overload;
    function NOME(Value : string) : iSoftwareModulo; overload;
    function NOME : string; overload;
    function Build : iService<TSoftwareModulo>;
    function PreencherLista(Value : TStrings) : iSoftwareModulo;
  end;

implementation

uses
  System.SysUtils,
  Gestor.model.service.impl.rest,
  Gestor.utils.tstrings.helper;

{ TSoftwareModuloDTO }

function TSoftwareModuloDTO.Build: iService<TSoftwareModulo>;
begin
  Result := FService;
end;

constructor TSoftwareModuloDTO.Create;
begin
  FEntity := TSoftwareModulo.Create;
  FService := TServiceRest<TSoftwareModulo>.New(FEntity);
end;

destructor TSoftwareModuloDTO.Destroy;
begin
  FEntity.Free;
  inherited;
end;

function TSoftwareModuloDTO.ID: string;
begin
  Result := FEntity.ID;
end;

function TSoftwareModuloDTO.ID(Value: string): iSoftwareModulo;
begin
  Result := Self;
  FEntity.ID := Value;
end;

function TSoftwareModuloDTO.IDSOFTWARE: string;
begin
  Result := FEntity.IDSOFTWARE;
end;

function TSoftwareModuloDTO.IDSOFTWARE(Value: string): iSoftwareModulo;
begin
  Result := Self;
  FEntity.IDSOFTWARE := Value
end;

class function TSoftwareModuloDTO.New : iSoftwareModulo;
begin
  Result := Self.Create;
end;

function TSoftwareModuloDTO.NOME(Value: string): iSoftwareModulo;
begin
  Result := Self;
  FEntity.NOME := Value
end;

function TSoftwareModuloDTO.NOME: string;
begin
  Result := FEntity.NOME;
end;

function TSoftwareModuloDTO.PreencherLista(Value: TStrings): iSoftwareModulo;
var
  Modulo : TSoftwareModulo;
  I : integer;
begin
  Value.FreeObjects;
  Value.Clear;
  for Modulo in FService.List do
    Value.AddStringAsObject(Modulo.NOME, Modulo.ID);
end;

end.
