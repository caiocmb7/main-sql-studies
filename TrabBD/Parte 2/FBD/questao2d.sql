/*
SELECT 
    Alunos.nome as Nome_Aluno,
    Departamento.nome as Nome_Dep,
    Disciplina.nome as Nome_Disc,
    AVG(
        CASE
            WHEN Aluno_disc.AF IS NULL THEN ((Aluno_disc.PrimeiraAP + Aluno_disc.SegundaAP)/2)
            ELSE ((Aluno_disc.PrimeiraAP + Aluno_disc.SegundaAP + Aluno_disc.AF)/3)
        END
    ) as media_global 
FROM Alunos
inner join Aluno_disc
    on Aluno_disc.matr_aluno_fk = Alunos.matr_aluno
inner join Disciplina
    on Disciplina.Cod_disc = Aluno_disc.Cod_disc_fk
inner join Cur_Disc
    on Disciplina.Cod_disc = Cur_Disc.Cod_disc_fk
inner join Dep_Curso
    on Dep_Curso.Cod_curso_fk = Cur_Disc.Cod_disc_fk
inner join Departamento
    on Departamento.Cod_dep = Dep_Curso.Cod_dep_fk
where Departamento.Cod_dep = 3
group by Alunos.matr_aluno
*/

SELECT 
    Alunos.nome as Nome_Aluno,
    Departamento.nome as Nome_Dep,
    AVG(
        CASE
            WHEN Aluno_disc.AF IS NULL THEN ((Aluno_disc.PrimeiraAP + Aluno_disc.SegundaAP)/2)
            ELSE ((Aluno_disc.PrimeiraAP + Aluno_disc.SegundaAP + Aluno_disc.AF)/3)
        END
    ) as media_global 
FROM Alunos
inner join Aluno_disc
    on Aluno_disc.matr_aluno_fk = Alunos.matr_aluno
inner join Disciplina
    on Disciplina.Cod_disc = Aluno_disc.Cod_disc_fk
inner join Cur_Disc
    on Disciplina.Cod_disc = Cur_Disc.Cod_disc_fk
inner join Dep_Curso
    on Dep_Curso.Cod_curso_fk = Cur_Disc.Cod_disc_fk
inner join Departamento
    on Departamento.Cod_dep = Dep_Curso.Cod_dep_fk
where Departamento.Cod_dep = 3
group by Alunos.matr_aluno
order by media_global DESC
