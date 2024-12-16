unit Gestor.model.resource.interfaces;

interface

uses
  Data.DB;

type
  iRestParams = interface;

  iRest = interface
  ['{4AEDCC7D-FD47-439B-8146-A33411708F69}']
    function Content : string;
    function DataSource(Value : TDataSource) : iRest;
    function Delete : iRest;
    function Get : iRest;
    function Params : iRestParams;
    function Post : iRest; overload;
    function Put : iRest;
  end;

  iRestParams = interface
  ['{DCD99EB9-25D1-4660-85B1-43675959657A}']
    function BaseURL (Value : string) : iRestParams; overload;
    function BaseURL : String; overload;
    function EndPoint (Value : string) : iRestParams; overload;
    function EndPoint : String; overload;
    function Body(Value : string) : iRestParams; overload;
    function Body : string; overload;
    function Accept(Value : string) : iRestParams; overload;
    function Accept : string; overload;
    function &End : iRest;
  end;

implementation

end.
