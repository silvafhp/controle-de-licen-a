unit Gestor.model.entity.contrato;

interface
uses
  Gestor.utils.Rest.Attributes;

type
  [RestData('contratos')]
  TContrato = class
    private
    FID: String;
    FIDCLIENTE: string;
    FIDSOFTWARE: string;
    FBLOQUEADO: string;
    FDATA: TDateTime;
    FVENCIMENTO: TDateTime;
    FDESCRICAO: string;
    FCHAVECONTRATO: string;
    public
      constructor Create;
      destructor Destroy; override;
      [RestPK]
      property ID: String read FID write FID;
      property DESCRICAO: string read FDESCRICAO write FDESCRICAO;
      property IDCLIENTE: String read FIDCLIENTE write FIDCLIENTE;
      property IDSOFTWARE: String read FIDSOFTWARE write FIDSOFTWARE;
      property BLOQUEADO: String read FBLOQUEADO write FBLOQUEADO;
      property DATA: TDateTime read FDATA write FDATA;
      property VENCIMENTO: TDateTime read FVENCIMENTO write FVENCIMENTO;
      property CHAVECONTRATO:  string read FCHAVECONTRATO write FCHAVECONTRATO;
  end;

implementation

{ TContrato }

constructor TContrato.Create;
begin

end;

destructor TContrato.Destroy;
begin

  inherited;
end;

end.
