unit Gestor.model.entity.cliente;

interface

uses
Gestor.utils.Rest.Attributes;

type
  [RestData('clientes')]
  TCliente = class
    private
    FID: String;
    FNOME: String;
    FCNPJ: String;
    public
      constructor Create;
      destructor Destroy; override;
      [RestPK]
      property ID: String read FID write FID;
      property NOME: String read FNOME write FNOME;
      property CNPJ: String read FCNPJ write FCNPJ;
  end;

implementation

{ TCliente }

constructor TCliente.Create;
begin

end;

destructor TCliente.Destroy;
begin

  inherited;
end;

end.
