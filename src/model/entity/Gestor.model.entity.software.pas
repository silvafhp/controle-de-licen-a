unit Gestor.model.entity.software;

interface
uses
  Gestor.utils.Rest.Attributes;

type
  [RestData('softwares')]
  TSoftware = class
    private
      FID : String;
      FNOME : String;
      FDESCRICAO : String;
      FCLIENTSECRET: string;
    public
      constructor Create;
      destructor Destroy; override;
      [RestPK]
      property ID : String read FID write FID;
      property NOME : String read FNOME write FNOME;
      property DESCRICAO : String read FDESCRICAO write FDESCRICAO;
      property CLIENTSECRET : string read FCLIENTSECRET write FCLIENTSECRET;
  end;
implementation

{ TSoftware }

constructor TSoftware.Create;
begin

end;

destructor TSoftware.Destroy;
begin

  inherited;
end;

end.
