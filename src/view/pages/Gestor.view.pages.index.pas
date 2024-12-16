unit Gestor.view.pages.index;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls;

type
  TPageIndex = class(TForm)
    pnlIndex: TPanel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PageIndex: TPageIndex;

implementation

uses
  Router4D, Gestor.view.pages.login;

{$R *.dfm}

procedure TPageIndex.FormCreate(Sender: TObject);
begin
  TRouter4D.Render<TPageLogin>.SetElement(pnlIndex, pnlIndex);
end;

end.
