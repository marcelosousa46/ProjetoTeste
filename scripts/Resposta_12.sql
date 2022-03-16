select 
  nm_empregado,
  d.nm_departamento,
  d."local",
  e.nm_funcao,
  e.data_admissao
from 
  "EMPREGADOS" e 
  inner join "DEPARTAMENTOS" d on (
    e.cod_departamento = d.id_departamento
  ) 
where 
  (extract(year from now()) - extract(year from e.data_admissao)) > 5 and
  e.salario > (select MIN(salario) from "EMPREGADOS" where nm_funcao = 'Gerente') 
  
  