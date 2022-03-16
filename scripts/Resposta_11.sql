select 
  d.id_departamento,
  nm_empregado
from 
  "EMPREGADOS" e 
  inner join "DEPARTAMENTOS" d on (
    e.cod_departamento = d.id_departamento
  ) 
where 
   d.nm_departamento like '%T%'
  