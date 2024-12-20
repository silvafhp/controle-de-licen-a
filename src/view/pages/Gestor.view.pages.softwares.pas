unit Gestor.view.pages.softwares;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Gestor.view.pages.template, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.WinXPanels, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.CheckLst;

type
  TPageSoftwares = class(TPageTemplate)
    pnlModulos: TStackPanel;
    Label1: TLabel;
    StackPanel2: TStackPanel;
    Label4: TLabel;
    edtID: TEdit;
    Label5: TLabel;
    edtNome: TEdit;
    Label6: TLabel;
    edtDescricao: TEdit;
    listModulos: TListBox;
    pnlModulosBotoes: TPanel;
    btnRemoverModulo: TSpeedButton;
    btnAdicionarModulo: TSpeedButton;
    Label2: TLabel;
    edtClientSecret: TEdit;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure gridDadosDblClick(Sender: TObject);
    procedure listModulosDblClick(Sender: TObject);
    procedure btnAdicionarModuloClick(Sender: TObject);
    procedure btnRemoverModuloClick(Sender: TObject);
    procedure CardPanel1CardChange(Sender: TObject; PrevCard, NextCard: TCard);
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
    procedure PreencherListaModulos(IDSoftware : String);
  public
    { Public declarations }
    procedure Pesquisar; override;
    procedure PreencherCampos; override;
  end;

var
  PageSoftwares: TPageSoftwares;

implementation

{$R *.dfm}

{ TPageSoftwares }

procedure TPageSoftwares.btnAdicionarModuloClick(Sender: TObject);
var
  NomeModulo : String;
begin
  inherited;
  NomeModulo := InputBox('Incluir M�dulo', 'Digite o nome do m�dulo', '');
  if not NomeModulo.IsEmpty then
  begin
    FController
      .SoftwareModulo
        .IDSOFTWARE(edtID.Text)
        .NOME(NomeModulo)
        .Build
          .Inserir;
    PreencherListaModulos(edtID.Text);
  end;
end;

procedure TPageSoftwares.btnExcluirClick(Sender: TObject);
begin
  FController
    .Software
      .ID(edtID.Text)
      .Build
        .Excluir;
  inherited;
end;

procedure TPageSoftwares.btnFecharClick(Sender: TObject);
begin
  inherited;
  Pesquisar;
end;

procedure TPageSoftwares.btnRemoverModuloClick(Sender: TObject);
begin
  if listModulos.ItemIndex > -1 then
  begin
    FController
      .SoftwareModulo
        .ID(getValueList(listModulos))
        .Build
          .Excluir;
    PreencherListaModulos(edtID.Text);
  end;  
end;

procedure TPageSoftwares.btnSalvarClick(Sender: TObject);
begin
  FController
    .Software
      .ID(edtID.Text)
      .NOME(EdtNome.Text)
      .DESCRICAO(edtDescricao.Text);
  case FTypeOperacao of
    toIncluir:
    begin
      FController.Software.build.Inserir;
      edtID.Text := FController.Software.build.this.ID;
      edtClientSecret.Text := FController.Software.build.this.CLIENTSECRET;
      FTypeOperacao := toAlterar;
      pnlModulos.Visible := true;
      exit
    end;
    toAlterar: FController.Software.build.Atualizar;
  end;

  inherited;
end;

procedure TPageSoftwares.CardPanel1CardChange(Sender: TObject; PrevCard,
  NextCard: TCard);
begin
  inherited;
  pnlModulos.Visible := FTypeOperacao = toAlterar;
end;

procedure TPageSoftwares.gridDadosDblClick(Sender: TObject);
begin
  inherited;
  if FTypeOperacao = toAlterar  then
  begin
    PreencherListaModulos(FController.Software.build.List[Pred(datasource.DataSet.RecNo)].ID);
  end;
end;

procedure TPageSoftwares.listModulosDblClick(Sender: TObject);
var
  NomeModulo : String;
begin
  inherited;
  NomeModulo := InputBox('Alterar M�dulo', 'Digite o nome do m�dulo', listModulos.Items[listModulos.ItemIndex]);
  if not NomeModulo.IsEmpty then
  begin
    FController
      .SoftwareModulo
        .ID(getValueList(listModulos))
        .NOME(NomeModulo)
        .IDSOFTWARE(edtID.Text)
        .Build
          .Atualizar;
    PreencherListaModulos(edtID.Text);
  end;

end;

procedure TPageSoftwares.Pesquisar;
begin
  FController
    .Software
      .Build
        .DataSource(DataSource)
        .ListarTodos;
  inherited;
end;

procedure TPageSoftwares.PreencherCampos;
begin
  edtID.Text := FController.software.build.List[Pred(datasource.DataSet.RecNo)].ID;
  edtNome.Text := FController.software.build.List[Pred(datasource.DataSet.RecNo)].NOME;
  edtDescricao.Text := FController.software.build.List[Pred(datasource.DataSet.RecNo)].DESCRICAO;
  edtClientSecret.Text := FController.software.build.List[Pred(datasource.DataSet.RecNo)].CLIENTSECRET;
end;

procedure TPageSoftwares.PreencherListaModulos(IDSoftware : String);
begin
  FController
    .SoftwareModulo
      .IDSOFTWARE(IDSoftware)
      .Build
        .ListarTodos;
  FController.SoftwareModulo.PreencherLista(listModulos.Items);
end;

end.
