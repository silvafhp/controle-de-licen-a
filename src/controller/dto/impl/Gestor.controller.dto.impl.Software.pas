unit Gestor.controller.dto.impl.software;

interface

uses
  System.Classes,
  Gestor.controller.dto.interfaces,
  Gestor.model.service.interfaces,
  Gestor.model.entity.Software;

Type
  TSoftwareDTO = class(TInterfacedObject, iSoftware)
  private
    FEntity : TSoftware;
    FService : iService<TSoftware>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : iSoftware;
    function ID(Value : string) : iSoftware; overload;
    function ID : string; overload;
    function NOME(Value : string) : iSoftware; overload;
    function NOME : string; overload;
    function DESCRICAO(Value : string) : iSoftware; overload;
    function DESCRICAO : string; overload;
    function Build : iService<TSoftware>;
    function PreencherLista(Value : TStrings) : iSoftware;
  end;

implementation

uses
  System.SysUtils,
  Gestor.model.service.impl.rest,
  Gestor.utils.tstrings.helper;

{ TSoftwareDTO }

function TSoftwareDTO.Build: iService<TSoftware>;
begin
  Result := FService;
end;

constructor TSoftwareDTO.Create;
begin
  FEntity := TSoftware.Create;
  FService := TServiceRest<TSoftware>.New(FEntity);
end;

function TSoftwareDTO.DESCRICAO(Value: string): iSoftware;
begin
  Result := Self;
  FEntity.DESCRICAO := Value;
end;

function TSoftwareDTO.DESCRICAO: string;
begin
  Result := FEntity.DESCRICAO;
end;

destructor TSoftwareDTO.Destroy;
begin
  FEntity.Free;
  inherited;
end;

function TSoftwareDTO.ID(Value: string): iSoftware;
begin
  Result := Self;
  FEntity.ID := Value;
end;

function TSoftwareDTO.ID: string;
begin
  Result := FEntity.ID;
end;

class function TSoftwareDTO.New : iSoftware;
begin
  Result := Self.Create;
end;

function TSoftwareDTO.NOME(Value: string): iSoftware;
begin
  Result := Self;
  FEntity.NOME := Value;
end;

function TSoftwareDTO.NOME: string;
begin
  Result := FEntity.NOME;
end;

function TSoftwareDTO.PreencherLista(Value: TStrings): iSoftware;
var
  Software : TSoftware;
begin
  Value.FreeObjects;
  Value.Clear;
  for Software in FService.List do
    Value.AddStringAsObject(Software.NOME, Software.ID);
end;

end.
