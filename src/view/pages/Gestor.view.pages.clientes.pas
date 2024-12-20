unit Gestor.view.pages.clientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Gestor.view.pages.Template, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.WinXPanels, Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  TPageClientes = class(TPageTemplate)
    StackPanel1: TStackPanel;
    edtID: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtNome: TEdit;
    Label3: TLabel;
    edtCNPJ: TEdit;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Pesquisar; override;
    procedure PreencherCampos; override;
  end;

var
  PageClientes: TPageClientes;

implementation

{$R *.dfm}

procedure TPageClientes.btnExcluirClick(Sender: TObject);
begin
  FController
    .Cliente
      .ID(edtID.Text)
      .Build
        .Excluir;
  inherited;
end;

procedure TPageClientes.btnSalvarClick(Sender: TObject);
begin
  FController
    .Cliente
      .ID(edtID.Text)
      .NOME(EdtNome.Text)
      .CNPJ(edtCNPJ.Text);
  case FTypeOperacao of
    toIncluir: FController.Cliente.build.Inserir;
    toAlterar: FController.Cliente.build.Atualizar;
  end;
  inherited;
end;

procedure TPageClientes.Pesquisar;
begin
  FController
    .Cliente
      .Build
        .DataSource(DataSource)
        .ListarTodos;
  inherited;
end;

procedure TPageClientes.PreencherCampos;
begin
  edtID.Text := FController.cliente.build.List[Pred(datasource.DataSet.RecNo)].ID;
  edtNome.Text := FController.cliente.build.List[Pred(datasource.DataSet.RecNo)].NOME;
  edtCNPJ.Text := FController.cliente.build.List[Pred(datasource.DataSet.RecNo)].CNPJ;
end;

end.
