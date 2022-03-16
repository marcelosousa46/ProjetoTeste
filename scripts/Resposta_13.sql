select 
  SUM(e.salario),
  d.nm_departamento,
  e.nm_funcao
from 
  "EMPREGADOS" e 
  inner join "DEPARTAMENTOS" d on (
    e.cod_departamento = d.id_departamento
  ) 
where 
  (extract(year from now()) - extract(year from e.data_admissao)) > 1 and
  d.local like '%Porto Alegre' 
  group by nm_departamento,e.nm_funcao 
  
  