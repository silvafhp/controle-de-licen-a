unit Gestor.view.pages.contratos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Gestor.view.pages.template, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.WinXPanels, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.CheckLst, Vcl.WinXCtrls, Vcl.ComCtrls;

type
  TPageContratos = class(TPageTemplate)
    StackPanel2: TStackPanel;
    Label4: TLabel;
    edtID: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    pnlModulos: TStackPanel;
    Label1: TLabel;
    cbCliente: TComboBox;
    cbSoftware: TComboBox;
    Label2: TLabel;
    dateData: TDateTimePicker;
    Label3: TLabel;
    dateVencimento: TDateTimePicker;
    Panel1: TPanel;
    Label7: TLabel;
    tgBloqueado: TToggleSwitch;
    listModulos: TCheckListBox;
    Label8: TLabel;
    edtChaveContrato: TEdit;
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure CardPanel1CardChange(Sender: TObject; PrevCard, NextCard: TCard);
    procedure listModulosClickCheck(Sender: TObject);
  private
    { Private declarations }
    function GetToggleValue(Toggle : TToggleSwitch) : string;
    procedure PreencherListaClientes;
    procedure PreencherListaSoftwares;
    procedure PreencherListaModulos(IDSoftware : string);
    procedure MarcarModulosHabilitados;
    procedure VerificarControles;
    procedure ExcluirContratoModulo(IDContratoModulo : string);
    procedure IncluirContratoModulo(IDContrato, IDModulo : string);
  public
    { Public declarations }
    procedure Pesquisar; override;
    procedure PreencherCampos; override;
  end;

var
  PageContratos: TPageContratos;

implementation

uses
  Gestor.utils.tstrings.helper;

{$R *.dfm}

procedure TPageContratos.btnExcluirClick(Sender: TObject);
begin
  FController
    .Contrato
      .ID(edtID.Text)
      .Build
        .Excluir;
  inherited;
end;

procedure TPageContratos.btnSalvarClick(Sender: TObject);
begin
  FController
    .Contrato
      .ID(edtID.Text)
      .DESCRICAO(Format('%s - %s', [cbCliente.Text, cbSoftware.Text]))
      .IDCLIENTE(getValueCombo(cbCliente))
      .IDSOFTWARE(getValueCombo(cbSoftware))
      .DATA(dateData.Date)
      .Vencimento(dateVencimento.Date)
      .BLOQUEADO(GetToggleValue(tgBloqueado));

  case FTypeOperacao of
    toIncluir:
    begin
      FController.Contrato.build.Inserir;
      edtID.Text := FController.Contrato.build.this.ID;
      edtChaveContrato.Text := FController.Contrato.build.this.CHAVECONTRATO;
      PreencherListaModulos(FController.Contrato.Build.This.IDSOFTWARE);
      FTypeOperacao := toAlterar;
      VerificarControles;
      exit
    end;
    toAlterar: FController.Contrato.build.Atualizar;
  end;

  inherited;
end;

procedure TPageContratos.CardPanel1CardChange(Sender: TObject; PrevCard,
  NextCard: TCard);
begin
  inherited;
  VerificarControles;
end;

procedure TPageContratos.ExcluirContratoModulo(IDContratoModulo : string);
begin
  FController
    .ContratoModulo
      .ID(IDContratoModulo)
      .Build
        .Excluir;
end;

function TPageContratos.GetToggleValue(Toggle: TToggleSwitch): string;
begin
  Result := 'N';
  if Toggle.State = tssOn then
    Result := 'S';
end;

procedure TPageContratos.IncluirContratoModulo(IDContrato, IDModulo : string);
begin
    FController
      .ContratoModulo
        .IDCONTRATO(edtID.Text)
        .IDMODULO(IDModulo)
        .Build
          .Inserir;
end;

procedure TPageContratos.listModulosClickCheck(Sender: TObject);
var
  Contador : integer;
begin
  if ListModulos.Checked[listModulos.ItemIndex] then
    IncluirContratoModulo(edtID.Text, ListModulos.items.GetStringObjectAtIndex(ListModulos.ItemIndex))
  else
  begin
    for Contador := 0 to Pred(Fcontroller.ContratoModulo.Build.List.Count) do
      if ListModulos.items.GetStringObjectAtIndex(ListModulos.ItemIndex) = Fcontroller.ContratoModulo.Build.List[Contador].IDMODULO then
      begin
        ExcluirContratoModulo(Fcontroller.ContratoModulo.Build.List[Contador].ID);
        break;
      end;
  end;
  FController
    .ContratoModulo
      .IDCONTRATO(edtID.Text)
      .Build
        .ListarTodos;

end;

procedure TPageContratos.MarcarModulosHabilitados;
var
  I: Integer;
  Indice : Integer;
begin
  FController
    .ContratoModulo
      .IDCONTRATO(FController.Contrato.build.List[Pred(datasource.DataSet.RecNo)].ID)
      .Build
        .ListarTodos;
  for I := 0 to Pred(FController.ContratoModulo.Build.List.Count) do
  begin
    Indice := ListModulos.Items.IndexOfStringObject(FController.ContratoModulo.build.List[I].IDMODULO);
    if Indice > -1 then
      ListModulos.Checked[Indice] := true;
  end;

end;

procedure TPageContratos.VerificarControles;
begin
  pnlModulos.Visible := FTypeOperacao = toAlterar;
  cbCliente.Enabled := FTypeOperacao = toIncluir;
  cbSoftware.Enabled := FTypeOperacao = toIncluir;
end;

procedure TPageContratos.Pesquisar;
begin
  FController
    .Contrato
      .Build
        .DataSource(DataSource)
        .ListarTodos;
  PreencherListaClientes;
  PreencherListaSoftwares;
  inherited;
end;

procedure TPageContratos.PreencherCampos;
begin
  edtID.Text := FController.Contrato.build.List[Pred(datasource.DataSet.RecNo)].ID;
  cbCliente.ItemIndex := cbCliente.Items.IndexOfStringObject(FController.contrato.build.List[Pred(datasource.DataSet.RecNo)].IDCLIENTE);
  cbSoftware.ItemIndex := cbSoftware.Items.IndexOfStringObject(FController.contrato.build.List[Pred(datasource.DataSet.RecNo)].IDSOFTWARE);
  dateData.Date := FController.Contrato.build.List[Pred(datasource.DataSet.RecNo)].DATA;
  dateVencimento.Date := FController.Contrato.build.List[Pred(datasource.DataSet.RecNo)].VENCIMENTO;
  if FController.Contrato.build.List[Pred(datasource.DataSet.RecNo)].BLOQUEADO = 'S' then
    tgBloqueado.State := tssOn;
  edtChaveContrato.Text := FController.Contrato.Build.List[Pred(datasource.DataSet.RecNo)].ChaveContrato;
  PreencherListaModulos(FController.Contrato.build.List[Pred(datasource.DataSet.RecNo)].IDSOFTWARE);
  MarcarModulosHabilitados;
end;

procedure TPageContratos.PreencherListaClientes;
begin
  FController
    .Cliente
      .Build.ListarTodos;

  FController.Cliente.PreencherLista(cbCliente.Items);
end;

procedure TPageContratos.PreencherListaModulos(IDSoftware : string);
begin
  FController
    .SoftwareModulo
      .IDSOFTWARE(IDSoftware)
      .Build.ListarTodos;

  FController.SoftwareModulo.PreencherLista(listModulos.Items);
end;

procedure TPageContratos.PreencherListaSoftwares;
begin
  FController
    .Software
      .Build.ListarTodos;

  FController.Software.PreencherLista(cbSoftware.Items);
end;


end.
