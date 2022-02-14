DELIMITER //

CREATE PROCEDURE relatorioAprovacao()
BEGIN

SELECT 
    * 
FROM (
SELECT 
    Alunos.nome AS Aluno, 
    Disciplina.nome AS Disciplina,
CASE 
    WHEN AF IS NULL THEN (PrimeiraAP+SegundaAP)/2 
    ELSE ((PrimeiraAP+SegundaAP)/2+AF)/2 
    END AS Media,
Disciplina.qte_creditos AS Creditos
FROM Curso
INNER JOIN Alunos
    ON Curso.Cod_curso = Alunos.Cod_curso_fk
INNER JOIN Aluno_disc
    ON Alunos.matr_aluno = Aluno_disc.matr_aluno_fk
INNER JOIN Disciplina
    ON Aluno_disc.Cod_disc_fk = Disciplina.Cod_disc
WHERE Curso.nome = 'Ciência da Computação'
) as procedure_questao3
WHERE Media >= 5;
 
END //

CALL relatorioAprovacao();

DROP PROCEDURE relatorioAprovacao;