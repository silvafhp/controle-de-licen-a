unit Gestor.view.pages.generic;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Router4D.Interfaces;

type
  TPageGeneric = class(TForm, iRouter4DComponent)
  private
    { Private declarations }
  public
    { Public declarations }
    function Render : TForm;
    procedure UnRender;
  end;

var
  PageGeneric: TPageGeneric;

implementation

{$R *.dfm}

{ TForm1 }

function TPageGeneric.Render: TForm;
begin
  Result := Self;
end;

procedure TPageGeneric.UnRender;
begin
//
end;

end.
