unit Gestor.utils.tstrings.helper;

interface
uses
  System.Classes;

type
  TStringsHelper = class helper for TStrings
    private
    public
      function AddStringAsObject(Text, ID : string) : Integer;
      procedure FreeObjects;
      function IndexOfStringObject (Value : string): integer;
      function GetStringObjectAtIndex(Index : Integer) : string;
  end;

implementation

uses
  Gestor.utils;

{ TStringsHelper }

function TStringsHelper.AddStringAsObject(Text, ID: string): Integer;
begin
  Result := Self.AddObject(Text, TStringObject.Create(ID));
end;

procedure TStringsHelper.FreeObjects;
var
  Contador : Integer;
begin
  for Contador := 0 to Pred(Self.Count) do
    Self.Objects[Contador].Free;
end;

function TStringsHelper.GetStringObjectAtIndex(Index: Integer): string;
begin
  Result := TStringObject(Self.Objects[Index]).StringValue;
end;

function TStringsHelper.IndexOfStringObject(Value : string): integer;
var
  Contador : Integer;
begin
  Result := -1;
  for Contador := 0 to Pred(Self.Count) do
    if TStringObject(Self.Objects[Contador]).StringValue = Value then
    begin
      Result := Contador;
      exit;
    end;
end;

end.
