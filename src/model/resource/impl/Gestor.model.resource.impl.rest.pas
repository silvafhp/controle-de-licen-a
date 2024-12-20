unit Gestor.model.resource.impl.rest;

interface

uses
  Data.DB,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.StorageBin,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  Gestor.model.resource.interfaces,
  Gestor.model.resource.impl.rest.params;

Type
  TRestRequest = class(TInterfacedObject, iRest)
  private
    FContent : string;
    FDataSet : TFDMemTable;
    FParams : IRestParams;
    procedure TratarRetorno(Value : string);
  public
    constructor Create;
    destructor Destroy; override;
    class function New : iRest;
    function Content : string;
    function DataSource(Value : TDataSource) : iRest;
    function Delete : iRest;
    function Get : iRest;
    function Params : iRestParams;
    function Post : iRest; overload;
    function Put : iRest;
  end;

implementation

uses
  RESTRequest4D,
  System.JSON,
  DataSet.Serialize;

{ TRestRequest }

function TRestRequest.Content: string;
begin
  Result := FContent;
end;

constructor TRestRequest.Create;
begin
  FParams := TRestParams.New(Self);
  FDataSet := TFDMemTable.Create(nil);
end;

function TRestRequest.DataSource(Value: TDataSource): iRest;
begin
  Result := Self;
  Value.DataSet := FDataSet;
end;

function TRestRequest.Delete: iRest;
begin
  Result := Self;
  TRequest
    .New
      .BaseURL(FParams.BaseURL + FParams.EndPoint)
      .Accept(FParams.Accept)
    .Delete;
end;

destructor TRestRequest.Destroy;
begin
  FDataSet.Free;
  inherited;
end;

function TRestRequest.Get: iRest;
var
  URL : string;
begin
  Result := Self;
  URL := FParams.BaseURL + FParams.EndPoint;
  FContent := TRequest.New
    .BaseURL(URL)
    .AcceptEncoding(FParams.Accept)
  .Get
  .Content;
  TratarRetorno(FContent);
end;

class function TRestRequest.New : iRest;
begin
  Result := Self.Create;
end;

function TRestRequest.Params: iRestParams;
begin
  Result := FParams;
end;

function TRestRequest.Post: iRest;
begin
  Result := Self;
  FContent := TRequest.New
    .BaseURL(FPArams.BaseURL + FParams.EndPoint)
    .Accept(FParams.Accept)
    .AddBody(FParams.Body)
  .Post
  .Content;
end;

function TRestRequest.Put: iRest;
begin
  Result := Self;
  TRequest.New
    .BaseURL(FPArams.BaseURL + FParams.EndPoint)
    .Accept(FParams.Accept)
    .AddBody(FParams.Body)
  .Put;
end;

procedure TRestRequest.TratarRetorno(Value : string);
var
  JsonResult : TJSONArray;
begin
  JsonResult := TJSONObject.ParseJSONValue(Value) as TJSONArray;
  try
    FDataSet.Close;
    FDataSet.DisableControls;
    FDataSet.LoadFromJSON(JsonResult, False);
    FDataSet.EnableControls;
  finally
    JsonResult.Free;
  end;
end;

end.
