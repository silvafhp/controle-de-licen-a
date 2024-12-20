unit Gestor.utils;

interface

type
  TStringObject = class
    private
    FStringValue : string;
    procedure SetStringValue(const Value: string);
    public
      constructor Create (aString : string);
      property StringValue : string read FStringValue write SetStringValue;
  end;

implementation

{ TStringObject }

constructor TStringObject.Create(aString: string);
begin
  FStringValue := aString;
end;

procedure TStringObject.SetStringValue(const Value: string);
begin
  FStringValue := Value;
end;

end.
