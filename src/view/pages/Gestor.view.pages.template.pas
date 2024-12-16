unit Gestor.view.pages.template;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.WinXPanels, Router4D.Interfaces, Gestor.controller.interfaces;

type
  TTypeOperacao = (toNull, toIncluir, toAlterar);
  TPageTemplate = class(TForm, iRouter4DComponent)
    pnlPrincipal: TPanel;
    pnlTop: TPanel;
    pnlBody: TPanel;
    lblPage: TLabel;
    CardPanel1: TCardPanel;
    cardGrid: TCard;
    pnlGridTop: TPanel;
    btnNovo: TSpeedButton;
    pnlCardBody: TPanel;
    gridDados: TDBGrid;
    cardCadastro: TCard;
    DataSource: TDataSource;
    pnlCadastroBottom: TPanel;
    btnSalvar: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnFechar: TSpeedButton;
    btnAtualizar: TSpeedButton;
    pnlGridBottom: TPanel;
    lblRegistros: TLabel;
    pnlGrid: TPanel;
    pnlCadastroBody: TPanel;
    pnlCadastroCampos: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure gridDadosDblClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    procedure AplicarEstilo;
    procedure LimparCampos;
    procedure LimparLista(Value : TStrings);
  protected
    FController : iController;
    FTypeOperacao : TTypeOperacao;
    procedure Pesquisar; virtual;
    procedure PreencherCampos; virtual; abstract;
    function getValueCombo(Combo : TCustomCombo) : string;
    function getValueList(List : TCustomListBox) : string;
  public
    { Public declarations }
    function Render : TForm;
    procedure UnRender;
  end;

var
  PageTemplate: TPageTemplate;

implementation

uses
  Gestor.view.styles,
  Gestor.controller.impl.controller,
  Vcl.CheckLst,
  Vcl.WinXCtrls,
  Gestor.utils.tstrings.helper, Vcl.ComCtrls;


{$R *.dfm}

{ TPageTemplate }

procedure TPageTemplate.AplicarEstilo;
begin
  pnlTop.Color := COR_TOPO_CADASTRO;
  pnlPrincipal.Color := COR_FUNDO;
  pnlGrid.Color := COR_FUNDO_MENU;
end;

procedure TPageTemplate.btnAtualizarClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure TPageTemplate.btnExcluirClick(Sender: TObject);
begin
  CardPanel1.ActiveCard := CardGrid;
  Pesquisar;
end;

procedure TPageTemplate.btnFecharClick(Sender: TObject);
begin
  CardPanel1.ActiveCard := CardGrid;
end;

procedure TPageTemplate.btnNovoClick(Sender: TObject);
begin
  LimparCampos;
  FTypeOperacao := toIncluir;
  CardPanel1.ActiveCard := CardCadastro;
end;

procedure TPageTemplate.btnSalvarClick(Sender: TObject);
begin
  CardPanel1.ActiveCard := CardGrid;
  Pesquisar;
end;

procedure TPageTemplate.FormCreate(Sender: TObject);
begin
  AplicarEstilo;
  FTypeOperacao := toNull;
  FController := TController.New;
end;

procedure TPageTemplate.FormDestroy(Sender: TObject);
var
  Contador: Integer;
begin
  for Contador := 0 to Pred(ComponentCount) do
  begin
    if Components[Contador] is TCustomComboBox then
      TComboBox(Components[Contador]).items.FreeObjects
    else if Components[Contador] is TCustomListBox then
      TCustomListBox(Components[Contador]).items.FreeObjects;
  end;
end;

function TPageTemplate.getValueCombo(Combo: TCustomCombo): string;
begin
  Result := '';
  if Combo.ItemIndex > -1 then
    Result := Combo.items.GetStringObjectAtIndex(Combo.ItemIndex);
end;

function TPageTemplate.getValueList(List: TCustomListBox): string;
begin
  Result := '';
  if List.ItemIndex > -1 then
    Result := List.items.GetStringObjectAtIndex(List.ItemIndex);
end;

procedure TPageTemplate.gridDadosDblClick(Sender: TObject);
begin
  PreencherCampos;
  FTypeOperacao := toAlterar;
  CardPanel1.ActiveCard := CardCadastro;
end;

procedure TPageTemplate.LimparCampos;
var
  Contador : Integer;
begin
  for Contador := 0 to Pred(ComponentCount) do
  begin
    if Components[Contador] is TCustomEdit then
      TCustomEdit(Components[Contador]).Clear
    else if Components[Contador] is TCustomListBox then
      LimparLista(TCustomListBox(Components[Contador]).Items)
    else if Components[Contador] is TCustomComboBox then
      TCustomComboBox(Components[Contador]).ItemIndex := -1
    else if Components[Contador] is TDateTimePicker then
      TDateTimePicker(Components[Contador]).Date := now
    else if Components[Contador] is TToggleSwitch then
      TToggleSwitch(Components[Contador]).State := tssOff;
  end;

end;

procedure TPageTemplate.LimparLista(Value : TStrings);
begin
  Value.FreeObjects;
  Value.Clear;
end;

procedure TPageTemplate.Pesquisar;
var
  s : string;
begin
  s := 's';
  if DataSource.DataSet.RecordCount = 1 then
    s := '';

  lblRegistros.Caption := Format('%d registro%s encontrado%s', [DataSource.DataSet.RecordCount, s, s]);
end;

function TPageTemplate.Render: TForm;
begin
  Result := Self;
  Pesquisar;
end;

procedure TPageTemplate.UnRender;
begin
//
end;

end.
