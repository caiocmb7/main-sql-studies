/*

DEP 

SELECT
    UnidadeAcademica.nome,
    COUNT(Departamento.nome) as total_deps
FROM UnidadeAcademica
INNER JOIN Departamento
    on Departamento.Cod_UA_fk = UnidadeAcademica.Cod_UA
INNER JOIN Dep_Curso
    on Dep_Curso.Cod_dep_fk = Departamento.Cod_dep
group by UnidadeAcademica.nome
order by UnidadeAcademica.Cod_UA;

*/

/*

CURSO

SELECT
    UnidadeAcademica.nome,
    COUNT(Curso.nome) as total_cursos
FROM UnidadeAcademica
INNER JOIN Departamento
    on Departamento.Cod_UA_fk = UnidadeAcademica.Cod_UA
INNER JOIN Dep_Curso
    on Dep_Curso.Cod_dep_fk = Departamento.Cod_dep
INNER JOIN Curso 
    on Curso.Cod_curso = Dep_Curso.Cod_curso_fk
group by UnidadeAcademica.nome
order by UnidadeAcademica.Cod_UA;

*/

/*

ALUNOS

SELECT
    UnidadeAcademica.nome,
    COUNT(Alunos.nome) as total_alunos
FROM UnidadeAcademica
INNER JOIN Departamento
    on Departamento.Cod_UA_fk = UnidadeAcademica.Cod_UA
INNER JOIN Dep_Curso
    on Dep_Curso.Cod_dep_fk = Departamento.Cod_dep
INNER JOIN Curso 
    on Curso.Cod_curso = Dep_Curso.Cod_curso_fk
INNER JOIN Alunos
    on Alunos.Cod_curso_fk = Curso.Cod_curso
group by UnidadeAcademica.nome
order by UnidadeAcademica.Cod_UA;


*/

/*
SELECT
    UnidadeAcademica.nome,
--    Departamento.nome,
--    Curso.nome,
--   Alunos.nome
    COUNT(Departamento.nome) as total_deps,
    COUNT(Curso.nome) as total_cursos,
    COUNT(Alunos.nome) as total_alunos
FROM UnidadeAcademica
INNER JOIN Departamento
    on Departamento.Cod_UA_fk = UnidadeAcademica.Cod_UA
INNER JOIN Dep_Curso
    on Dep_Curso.Cod_dep_fk = Departamento.Cod_dep
INNER JOIN Curso 
    on Curso.Cod_curso = Dep_Curso.Cod_curso_fk
INNER JOIN Alunos
    on Alunos.Cod_curso_fk = Curso.Cod_curso
-- order by UnidadeAcademica.Cod_UA
group by Departamento.Cod_dep, Curso.Cod_curso, UnidadeAcademica.Cod_UA


*/

/*

SELECT
    UA.nome,
    (SELECT
    COUNT(Departamento.nome) as total_deps
FROM UnidadeAcademica
INNER JOIN Departamento
    on Departamento.Cod_UA_fk = UnidadeAcademica.Cod_UA
INNER JOIN Dep_Curso
    on Dep_Curso.Cod_dep_fk = Departamento.Cod_dep
group by UnidadeAcademica.nome
order by UnidadeAcademica.Cod_UA
    ) as D
FROM UnidadeAcademica UA

*/

SELECT 
    a.nome,
    a.total_alunos,
    b.total_cursos,
    c.total_deps
FROM 
    (SELECT
        UnidadeAcademica.nome,
        COUNT(Alunos.nome) as total_alunos
    FROM UnidadeAcademica
    INNER JOIN Departamento
        on Departamento.Cod_UA_fk = UnidadeAcademica.Cod_UA
    INNER JOIN Dep_Curso
        on Dep_Curso.Cod_dep_fk = Departamento.Cod_dep
    INNER JOIN Curso 
        on Curso.Cod_curso = Dep_Curso.Cod_curso_fk
    INNER JOIN Alunos
        on Alunos.Cod_curso_fk = Curso.Cod_curso
    GROUP BY UnidadeAcademica.nome
    ) as a,
    (SELECT
        UnidadeAcademica.nome,
        COUNT(Curso.nome) as total_cursos
    FROM UnidadeAcademica
    INNER JOIN Departamento
        on Departamento.Cod_UA_fk = UnidadeAcademica.Cod_UA
    INNER JOIN Dep_Curso
        on Dep_Curso.Cod_dep_fk = Departamento.Cod_dep
    INNER JOIN Curso 
        on Curso.Cod_curso = Dep_Curso.Cod_curso_fk
    group by UnidadeAcademica.nome
    ) as b,
    (SELECT
        UnidadeAcademica.nome,
        COUNT(Departamento.nome) as total_deps
    FROM UnidadeAcademica
    INNER JOIN Departamento
        on Departamento.Cod_UA_fk = UnidadeAcademica.Cod_UA
    INNER JOIN Dep_Curso
        on Dep_Curso.Cod_dep_fk = Departamento.Cod_dep
    GROUP BY UnidadeAcademica.nome
    ) as c
WHERE (a.nome = b.nome and b.nome = c.nome)
ORDER BY a.total_alunos DESC
