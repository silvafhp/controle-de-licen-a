unit Gestor.model.resource.impl.rest.factory;

interface

uses
  Gestor.model.resource.interfaces;

type
  TRestFactory = class
    private
      FBaseURL : string;
      FToken : string;
      procedure ConfigurarParametros;
    public
      constructor Create;
      destructor Destroy; override;
      class function GetInstance : TRestFactory;
      function Rest : iRest;
      function Token(Value : string) : TRestFactory;

  end;

var
  aRestFactory : TRestFactory;

implementation

uses
  Gestor.model.resource.impl.rest;

{ TRestFactory }

procedure TRestFactory.ConfigurarParametros;
begin
  FBaseURL := 'http://localhost:9000';
end;

constructor TRestFactory.Create;
begin
  ConfigurarParametros;
end;

destructor TRestFactory.Destroy;
begin

  inherited;
end;

class function TRestFactory.GetInstance: TRestFactory;
begin
  Result := aRestFactory;
end;

function TRestFactory.Rest: iRest;
begin
  Result := TRestRequest
    .New
      .Params
        .BaseURL(FBASEURL)
      .&End;
end;

function TRestFactory.Token(Value: string): TRestFactory;
begin
  Result := Self;
  FToken := Value;
end;

initialization
  aRestFactory := TRestFactory.Create;

finalization
  aRestFactory.Free;
end.
