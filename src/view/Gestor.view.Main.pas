unit Gestor.view.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Router4D.Interfaces, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.StdCtrls;

type
  TFormMain = class(TForm, iRouter4DComponent)
    pnlPrincipal: TPanel;
    pnlTop: TPanel;
    pnlMenu: TPanel;
    pnlPages: TPanel;
    lblProgramName: TLabel;
    btnClientes: TSpeedButton;
    btnSair: TSpeedButton;
    btnSoftwares: TSpeedButton;
    btnPrincipal: TSpeedButton;
    bntContratos: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnPrincipalClick(Sender: TObject);
    procedure btnClientesClick(Sender: TObject);
    procedure btnSoftwaresClick(Sender: TObject);
    procedure bntContratosClick(Sender: TObject);
  private
    { Private declarations }
    procedure AplicarEstilo;
  public
    { Public declarations }
    function Render : TForm;
    procedure UnRender;
  end;

var
  FormMain: TFormMain;

implementation

uses
  Router4D,
  Gestor.View.styles,
  Gestor.view.pages.generic;

{$R *.dfm}

{ TFormMain }

procedure TFormMain.AplicarEstilo;
begin
  pnlPages.Color := COR_FUNDO;
  pnlTop.Color := COR_TEMA;
  pnlMenu.Color := COR_FUNDO_MENU;
end;

procedure TFormMain.bntContratosClick(Sender: TObject);
begin
  TRouter4D.Link.&To('Contratos');
end;

procedure TFormMain.btnClientesClick(Sender: TObject);
begin
  TRouter4D.Link.&To('Clientes');
end;

procedure TFormMain.btnPrincipalClick(Sender: TObject);
begin
  TRouter4D.Link.&To('Principal');
end;

procedure TFormMain.btnSairClick(Sender: TObject);
begin
  Halt;
end;

procedure TFormMain.btnSoftwaresClick(Sender: TObject);
begin
  TRouter4D.Link.&To('Softwares');
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  AplicarEstilo;
end;

function TFormMain.Render: TForm;
begin
  Result := Self;
  TRouter4D.Render<TPageGeneric>.SetElement(pnlPages);
  TRouter4D.Link.&To('Principal');
end;

procedure TFormMain.UnRender;
begin
//
end;

end.
