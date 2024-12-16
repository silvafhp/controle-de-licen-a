unit Gestor.model.resource.impl.rest.params;

interface

uses
  Gestor.model.resource.interfaces;

Type
  TRestParams = class(TInterfacedObject, iRestParams)
  private
    [weak]
    FParent : iRest;
    FBaseURL : string;
    FEndPoint : string;
    FAccept : string;
    FBody : string;
  public
    constructor Create(Parent : iRest);
    destructor Destroy; override;
    class function New(Parent : iRest) : iRestParams;
    function BaseURL (Value : String ) : iRestParams; overload;
    function BaseURL : String; overload;
    function EndPoint (Value : string ) : iRestParams; overload;
    function EndPoint : String; overload;
    function Accept(Value : string) : iRestParams; overload;
    function Accept : string; overload;
    function Body(Value : string) : iRestParams; overload;
    function Body : string; overload;
    function &End : iRest;
  end;

implementation

{ TRestParams }

function TRestParams.BaseURL(Value: String): iRestParams;
begin
  Result := Self;
  FBaseURL := Value;
end;

function TRestParams.Accept: string;
begin
  Result := FAccept;
end;

function TRestParams.Accept(Value: string): iRestParams;
begin
  Result := Self;
  FAccept := Value;
end;

function TRestParams.BaseURL: String;
begin
  Result := FBaseURL;
end;

function TRestParams.Body: string;
begin
  Result := FBody;
end;

function TRestParams.Body(Value: string): iRestParams;
begin
  Result := Self;
  FBody := Value;
end;

function TRestParams.&End: iRest;
begin
  Result := FParent;
end;

constructor TRestParams.Create(Parent : iRest);
begin
  FParent := Parent;
end;

destructor TRestParams.Destroy;
begin

  inherited;
end;

function TRestParams.EndPoint(Value: String): iRestParams;
begin
  Result := Self;
  FEndPoint := Value;
end;

function TRestParams.EndPoint: String;
begin
  Result := FEndPoint;
end;

class function TRestParams.New (Parent : iRest) : iRestParams;
begin
  Result := Self.Create(Parent);
end;

end.
