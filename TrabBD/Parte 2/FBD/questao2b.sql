SELECT
    Alunos.nome as Nome,
    Disciplina.nome as Disciplina,
    Disciplina.qte_creditos,
    Aluno_disc.Semestre,
    Aluno_disc.PrimeiraAP,
    Aluno_disc.SegundaAP,
    CASE
    WHEN Aluno_disc.AF IS NULL THEN "--"
    ELSE Aluno_disc.AF
    END as AF
FROM Alunos
INNER JOIN Curso 
    on Alunos.Cod_curso_fk = Curso.Cod_curso
INNER JOIN Aluno_disc
    on Alunos.matr_aluno = Aluno_disc.matr_aluno_fk
INNER JOIN Disciplina
    on Disciplina.Cod_disc = Aluno_disc.Cod_disc_fk
where Curso.Cod_curso = 1 -- Filtro "CC"











