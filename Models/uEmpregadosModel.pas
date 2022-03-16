unit uEmpregadosModel;

interface

type

  TEmpregadosModel = class
  private
    FCod_departamento: integer;
    FNm_empregado: string;
    FId_empregado: integer;
    FNm_funcao: string;
    FNm_fucao: string;
    FCod_emp_funcao: integer;
    FData_admissao: TDate;
    FSalario: Extended;
    FComissao: Extended;
  public
    property Id_empregado: integer read FId_empregado write FId_empregado;
    property Cod_departamento: integer read FCod_departamento write FCod_departamento;
    property Cod_emp_funcao: integer read FCod_emp_funcao write FCod_emp_funcao;
    property Nm_empregado: string read FNm_empregado write FNm_empregado;
    property Nm_funcao: string read FNm_funcao write FNm_funcao;
    property Data_admissao: TDate read FData_admissao write FData_admissao;
    property Salario: Extended read FSalario write FSalario;
    property Comissao: Extended read FComissao write FComissao;

  end;

implementation

end.
