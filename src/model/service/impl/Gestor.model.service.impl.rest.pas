unit Gestor.model.service.impl.rest;

interface

uses
  Data.DB,
  System.Generics.Collections,
  Gestor.model.service.interfaces,
  Gestor.model.resource.interfaces;

Type
  TServiceRest<T : class, constructor> = class(TInterfacedObject, iService<T>)
  private
    FParent : T;
    FList : TObjectList<T>;
    FRest : iRest;
    function ObjectToJSONString : string;
  public
    constructor Create(Parent : T);
    destructor Destroy; override;
    class function New(Parent : T) : iService<T>;
    function Atualizar: iService<T>;
    function DataSource(Value : TDataSource) : iService<T>;
    function Excluir: iService<T>; overload;
    function Inserir: iService<T>;
    function List : TObjectList<T>;
    function ListarPorId(aId: String): iService<T>;
    function ListarTodos: iService<T>;
    function This: T;
  end;

implementation

uses
  Gestor.model.resource.impl.rest.factory,
  Gestor.utils.Rtti,
  GBJSON.Helper,
  GBJSON.Interfaces,
  System.SysUtils,
  System.JSON;

{ TServiceRest<T> }

function TServiceRest<T>.Atualizar: iService<T>;
var
  EndPoint : string;
  ID : string;
begin
  Result := Self;

  TUtilsRtti<T>
    .New(FParent)
      .EndPoint(EndPoint)
      .RestID(ID);
  FRest
    .Params
      .EndPoint(Format('%s/%s', [EndPoint, ID]))
      .Body(ObjectToJSONString)
    .&End
  .Put;
end;

constructor TServiceRest<T>.Create(Parent : T);
begin
  FParent := Parent;
  FList := TObjectList<T>.Create;
  FRest := TRestFactory.GetInstance.Rest;
  TGBJSONConfig.GetInstance.CaseDefinition(TCaseDefinition.cdLower);
end;

function TServiceRest<T>.DataSource(Value: TDataSource): iService<T>;
begin
  Result := Self;
  FRest.DataSource(Value);
end;

destructor TServiceRest<T>.Destroy;
begin
  FList.Free;
  inherited;
end;

function TServiceRest<T>.Excluir: iService<T>;
var
  EndPoint : string;
  ID : string;
begin
  Result := Self;
  TUtilsRtti<T>
    .New(FParent)
      .EndPoint(EndPoint)
      .RestID(ID);
  FRest
    .Params
      .EndPoint(Format('%s/%s', [EndPoint, ID]))
    .&End
  .Delete;
end;

function TServiceRest<T>.Inserir: iService<T>;
var
  EndPoint : string;
  JSONContent : TJSONObject;
begin
  Result := Self;
  TUtilsRtti<T>.New(FParent).EndPoint(EndPoint);
  FRest
    .Params
      .EndPoint(EndPoint)
      .Body(ObjectToJSONString)
    .&End
  .Post;
  JSONContent := TJSONObject.ParseJSONValue(FRest.Content) as TJSONObject;
  try
    TGBJSONDefault.Serializer<T>(false).JsonObjectToObject(FParent, JSONContent);
  finally
    JSONContent.Free;
  end;
end;

function TServiceRest<T>.List: TObjectList<T>;
begin
  Result := FList;
end;

function TServiceRest<T>.ListarPorId(aId: String): iService<T>;
var
  EndPoint : string;
  ID : string;
  JSONContent : TJSONObject;
begin
  Result := Self;
  TUtilsRtti<T>
    .New(FParent)
      .EndPoint(EndPoint)
      .RestID(ID);
  FRest
    .Params
      .EndPoint(Format('%s/%s', [EndPoint, ID]))
    .&End
  .Get;
  JSONContent := TJSONObject.ParseJSONValue(FRest.Content) as TJSONObject;
  try
    TGBJSONDefault.Serializer<T>(false).JsonObjectToObject(FParent, JSONContent);
  finally
    JSONContent.Free;
  end;
end;

function TServiceRest<T>.ListarTodos: iService<T>;
var
  EndPoint : string;
begin
  Result := Self;
  TUtilsRtti<T>.New(FParent).EndPoint(EndPoint);
  FRest
    .Params
      .EndPoint(EndPoint)
    .&End
  .Get;
  if Assigned(FList) then
    FList.Free;
  FList := TGBJSONDefault.Serializer<T>(false).JsonStringToList(FRest.Content);
end;

class function TServiceRest<T>.New(Parent : T) : iService<T>;
begin
  Result := Self.Create(Parent);
end;

function TServiceRest<T>.ObjectToJSONString: String;
begin
  Result := TGBJSONDefault.Deserializer<T>(true).ObjectToJsonString(FParent);
end;

function TServiceRest<T>.This: T;
begin
  Result := FParent;
end;

end.
