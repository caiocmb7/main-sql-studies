select UnidadeAcademica.nome from Departamento, UnidadeAcademica, Dep_Curso where 
  (
  (Departamento.Cod_UA_fk != all(select Cod_UA from UnidadeAcademica)) 
  or
    (Departamento.Cod_UA_fk = UnidadeAcademica.Cod_UA 
    and Dep_Curso.Cod_dep_fk != all (select Cod_dep from Departamento))
  )