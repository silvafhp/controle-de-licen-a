unit Gestor.utils.rtti.helper;

interface

uses
  RTTI;

type
  TRttiPropertyHelper = class helper for TRttiProperty
  public
    function Tem<T : TCustomAttribute> : Boolean;
    function GetAttribute<T: TCustomAttribute>: T;
  end;

  TRttiTypeHelper = class helper for TRttiType
  public
    function Tem<T: TCustomAttribute> : Boolean;
    function GetAttribute<T: TCustomAttribute>: T;
  end;

  TRttiFieldHelper = class helper for TRttiField
  public
    function Tem<T: TCustomAttribute>: Boolean;
    function GetAttribute<T: TCustomAttribute>: T;
  end;

implementation

{ TRttiPropertyHelper }

function TRttiPropertyHelper.GetAttribute<T>: T;
var
  oAtributo: TCustomAttribute;
begin
  Result := nil;
  for oAtributo in GetAttributes do
    if oAtributo is T then
      Exit((oAtributo as T));
end;

function TRttiPropertyHelper.Tem<T>: Boolean;
begin
  Result := GetAttribute<T> <> nil;
end;

{ TRttiFieldHelper }

function TRttiFieldHelper.GetAttribute<T>: T;
var
  oAtributo: TCustomAttribute;
begin
  Result := nil;
  for oAtributo in GetAttributes do
    if oAtributo is T then
      Exit((oAtributo as T));
end;

function TRttiFieldHelper.Tem<T>: Boolean;
begin
  Result := GetAttribute<T> <> nil;
end;

{ TRttiTypeHelper }

function TRttiTypeHelper.GetAttribute<T>: T;
var
  oAtributo: TCustomAttribute;
begin
  Result := nil;
  for oAtributo in GetAttributes do
    if oAtributo is T then
      Exit((oAtributo as T));
end;

function TRttiTypeHelper.Tem<T>: Boolean;
begin
  Result := GetAttribute<T> <> nil;
end;

end.
