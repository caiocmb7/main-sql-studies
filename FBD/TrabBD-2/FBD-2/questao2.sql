DROP VIEW visaoQuestao2;
CREATE VIEW visaoQuestao2 AS 
SELECT
    Alunos.nome AS Nome_aluno,
    Curso.nome AS Nome_curso,
    COUNT(Disciplina.Cod_disc) AS soma_disciplina,
    COUNT(Disciplina.qte_creditos) AS soma_creditos,
    ROUND(AVG(
        CASE
            WHEN Aluno_disc.AF IS NULL THEN ((Aluno_disc.PrimeiraAP + Aluno_disc.SegundaAP)/2)
            ELSE ((Aluno_disc.PrimeiraAP + Aluno_disc.SegundaAP + Aluno_disc.AF)/3)
        END
    ),2) as media_global
FROM Disciplina
INNER JOIN Aluno_disc
    ON Aluno_disc.Cod_disc_fk = Disciplina.Cod_disc
INNER JOIN Alunos
    ON Alunos.matr_aluno = Aluno_disc.matr_aluno_fk
INNER JOIN Cur_Disc
    ON Cur_Disc.Cod_disc_fk = Disciplina.Cod_disc
INNER JOIN Curso
    ON Cur_Disc.Cod_curso_fk = Curso.Cod_curso
GROUP BY Disciplina.Cod_disc;

SELECT 
    Nome_aluno,
    Nome_curso,
    soma_disciplina,
    soma_creditos
FROM visaoQuestao2
WHERE media_global > 7;