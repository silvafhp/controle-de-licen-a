unit Gestor.model.entity.Contrato.modulo;

interface

uses
  Gestor.utils.Rest.Attributes;

type
  [RestData('contratos/:IDCONTRATO/modulos')]
  TContratoModulo = class
    private
    FID: String;
    FIDCONTRATO: string;
    FIDMODULO: string;
    public
      constructor Create;
      destructor Destroy; override;
      [RestPK]
      property ID: String read FID write FID;
      property IDCONTRATO: String read FIDCONTRATO write FIDCONTRATO;
      property IDMODULO: String read FIDMODULO write FIDMODULO;
  end;
implementation

{ TContratoModulo }

constructor TContratoModulo.Create;
begin

end;

destructor TContratoModulo.Destroy;
begin

  inherited;
end;

end.
