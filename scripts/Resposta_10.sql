select 
  nm_empregado, 
  data_admissao 
from 
  "EMPREGADOS" e 
  inner join "DEPARTAMENTOS" d on (
    e.cod_departamento = d.id_departamento
  ) 
where 
  not exists (
    select 
      * 
    from 
      "EMPREGADOS" 
    where 
      e.nm_empregado like 'Marcelo%'
  ) 
  and (
    select 
      cod_departamento 
    from 
      "EMPREGADOS" 
    where 
      nm_empregado like 'Marcelo%'
  ) = e.cod_departamento
