SELECT 
    Alunos.nome,
    Aluno_disc.PrimeiraAP,
    Aluno_disc.SegundaAP,
    ((Aluno_disc.PrimeiraAP + Aluno_disc.SegundaAP + Aluno_disc.AF) / 3) as media,
    Aluno_disc.AF,
    Aluno_disc.Semestre,
    Departamento.nome,
    Disciplina.nome
FROM Alunos
inner join Aluno_disc
    on Aluno_disc.matr_aluno_fk = Alunos.matr_aluno
inner join Disciplina
    on Disciplina.Cod_disc = Aluno_disc.Cod_disc_fk
inner join Cur_Disc
    on Cur_Disc.Cod_disc_fk = Disciplina.Cod_disc
inner join Curso 
    on Curso.Cod_curso = Cur_Disc.Cod_curso_fk
inner join Dep_Curso
    on Dep_Curso.Cod_curso_fk = Curso.Cod_curso
inner join Departamento
    on Dep_Curso.Cod_dep_fk = Departamento.Cod_dep
group by Alunos.nome
UPDATE Aluno_disc
SET AF is NULL
HAVING media > 7;
