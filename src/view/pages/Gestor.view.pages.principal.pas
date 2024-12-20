unit Gestor.view.pages.principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Router4D.Interfaces, Vcl.ExtCtrls,
  Vcl.StdCtrls;

type
  TPagePrincipal = class(TForm, iRouter4DComponent)
    pnlPrincipal: TPanel;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure AplicarEstilo;
  public
    { Public declarations }
    function Render : TForm;
    procedure UnRender;
  end;

var
  PagePrincipal: TPagePrincipal;

implementation

uses
  Gestor.view.styles;

{$R *.dfm}

{ TPageMain }

procedure TPagePrincipal.AplicarEstilo;
begin
  pnlPrincipal.Color := COR_FUNDO;
end;

procedure TPagePrincipal.FormCreate(Sender: TObject);
begin
  AplicarEstilo;
end;

function TPagePrincipal.Render: TForm;
begin
  Result := Self;
end;

procedure TPagePrincipal.UnRender;
begin
//
end;

end.
