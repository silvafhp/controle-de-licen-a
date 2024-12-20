unit Gestor.controller.dto.impl.cliente;

interface

uses
  System.Classes,
  Gestor.controller.dto.Interfaces,
  Gestor.model.service.Interfaces,
  Gestor.model.entity.Cliente;

Type
  TClienteDTO = class(TInterfacedObject, iCliente)
  private
    FEntity : TCliente;
    FService : iService<TCliente>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : iCliente;
    function ID(Value : string) : iCliente; overload;
    function ID : string; overload;
    function NOME(Value : string) : iCliente; overload;
    function NOME : string; overload;
    function CNPJ(Value : string) : iCliente; overload;
    function CNPJ : string; overload;
    function Build : iService<TCliente>;
    function PreencherLista(Value : TStrings) : iCliente;
  end;

implementation

uses
  System.SysUtils,
  Gestor.model.service.impl.Rest,
  Gestor.utils.tstrings.helper;

{ TClienteDTO }

function TClienteDTO.Build: iService<TCliente>;
begin
  Result := FService;
end;

function TClienteDTO.CNPJ(Value: string): iCliente;
begin
  Result := Self;
  FEntity.CNPJ := Value;
end;

function TClienteDTO.CNPJ: string;
begin
  Result := FEntity.CNPJ;
end;

constructor TClienteDTO.Create;
begin
  FEntity := TCliente.Create;
  FService := TServiceRest<TCliente>.New(FEntity);
end;

destructor TClienteDTO.Destroy;
begin
  FEntity.Free;
  inherited;
end;

function TClienteDTO.ID(Value: string): iCliente;
begin
  Result := Self;
  FEntity.ID := Value;
end;

function TClienteDTO.ID: string;
begin
  Result := FEntity.ID;
end;

class function TClienteDTO.New: iCliente;
begin
  Result := Self.Create;
end;

function TClienteDTO.NOME(Value: string): iCliente;
begin
  Result := Self;
  FEntity.NOME := Value;
end;

function TClienteDTO.NOME: string;
begin
  Result := FEntity.NOME;
end;

function TClienteDTO.PreencherLista(Value: TStrings): iCliente;
var
  Cliente : TCliente;
begin
  Value.FreeObjects;
  Value.Clear;
  for Cliente in FService.List do
    Value.AddStringAsObject(Cliente.NOME, Cliente.ID);
end;

end.
