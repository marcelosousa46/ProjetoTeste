unit uDepartamentosModel;

interface

type

  TDepartamentosModel = class
  private
    FLocal: string;
    FFNm_departamento: string;
    FId_departamento: integer;
  public
    property Id_departamento: integer read FId_departamento write FId_departamento;
    property Nm_departamento: string read FFNm_departamento write FFNm_departamento;
    property Local: string read FLocal write FLocal;
  end;

implementation

end.
