unit Gestor.utils.rest.attributes;

interface

type
  RestData = class(TCustomAttribute)
    private
      FEndPoint: string;
    public
      constructor Create(aEndPoint : string);
      function EndPoint : string;
  end;

  RestPK = class(TCustomAttribute)
  end;

implementation

uses
  System.SysUtils;

{ RestData }

constructor RestData.Create(aEndPoint: string);
begin
  FEndPoint := aEndPoint;
end;

function RestData.EndPoint: string;
begin
  Result := FEndPoint;
end;

end.
