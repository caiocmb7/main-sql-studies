DROP VIEW IF EXISTS visaoQuestao2;

CREATE VIEW visaoQuestao2 AS 
SELECT
    Alunos.nome AS Aluno,
    Curso.nome AS Curso,
    COUNT(DISTINCT Disciplina.Cod_disc) AS qte_disciplinas,
    SUM(Disciplina.qte_creditos) AS qte_creditos
FROM Disciplina
INNER JOIN Aluno_disc
    ON Aluno_disc.Cod_disc_fk = Disciplina.Cod_disc
INNER JOIN Alunos
    ON Alunos.matr_aluno = Aluno_disc.matr_aluno_fk
INNER JOIN Cur_Disc
    ON Cur_Disc.Cod_disc_fk = Disciplina.Cod_disc
INNER JOIN Curso
    ON Cur_Disc.Cod_curso_fk = Curso.Cod_curso
WHERE ((Aluno_disc.PrimeiraAP + Aluno_disc.SegundaAP)/2 > 7) OR (((Aluno_disc.PrimeiraAP + Aluno_disc.SegundaAP)/2 + Aluno_disc.AF)/2 > 5)
GROUP BY Curso.nome, Alunos.nome;

SELECT 
    *
FROM visaoQuestao2;