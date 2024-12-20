unit Gestor.model.service.interfaces;

interface

uses
  Data.DB, System.Generics.Collections;
type
  iService<T: Class> = interface
  ['{6813D348-15EC-41EE-9532-BE920FBAFF49}']
    function Atualizar: iService<T>;
    function DataSource(Value : TDataSource) : iService<T>;
    function Excluir: iService<T>; overload;
    function Inserir: iService<T>;
    function List : TObjectList<T>;
    function ListarPorId(aId: String): iService<T>;
    function ListarTodos: iService<T>;
    function This: T;
  end;
implementation

end.
