unit Gestor.view.pages.login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.WinXPanels, Vcl.ExtCtrls, Router4D.Interfaces;

type
  TPageLogin = class(TForm, iRouter4DComponent)
    PnlPrincipal: TPanel;
    PnlLeft: TPanel;
    PnlRight: TPanel;
    StackPanel1: TStackPanel;
    Label2: TLabel;
    Label1: TLabel;
    Panel3: TPanel;
    Label3: TLabel;
    Edit2: TEdit;
    Label4: TLabel;
    Edit1: TEdit;
    Panel4: TPanel;
    BtnEntrar: TSpeedButton;
    procedure BtnEntrarClick(Sender: TObject);
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
  PageLogin: TPageLogin;

implementation

uses
  Router4D,
  Gestor.view.styles;

{$R *.dfm}

{ TForm1 }

procedure TPageLogin.AplicarEstilo;
begin
  PnlLeft.Color := COR_TEMA;
  PnlRight.Color := COR_FUNDO;

end;

procedure TPageLogin.BtnEntrarClick(Sender: TObject);
begin
  TRouter4D.Link.IndexLink('Main');
end;

procedure TPageLogin.FormCreate(Sender: TObject);
begin
  AplicarEstilo;
end;

function TPageLogin.Render: TForm;
begin
  Result := Self;
end;

procedure TPageLogin.UnRender;
begin

end;

end.
