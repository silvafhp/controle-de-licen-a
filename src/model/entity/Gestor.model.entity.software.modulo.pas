unit Gestor.model.entity.software.modulo;

interface
uses
  Gestor.utils.Rest.Attributes;

type
  [RestData('softwares/:IDSOFTWARE/modulos')]
  TSoftwareModulo = class
    private
    FID: String;
    FIDSOFTWARE: String;
    FNOME: String;
    public
      constructor Create;
      destructor Destroy; override;
      [RestPK]
      property ID : String read FID write FID;
      property IDSOFTWARE : String read FIDSOFTWARE write FIDSOFTWARE;
      property NOME : String read FNOME write FNOME;
  end;

implementation

{ TSoftwareModulo }

constructor TSoftwareModulo.Create;
begin

end;

destructor TSoftwareModulo.Destroy;
begin

  inherited;
end;

end.
