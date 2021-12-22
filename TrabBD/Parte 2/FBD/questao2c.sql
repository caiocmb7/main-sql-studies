SELECT 
    Professor.nome as Nome_Professor,
    Departamento.nome as Nome_Dep,
    Prof_Disc.Semestre,
    SUM(Disciplina.qte_creditos) AS soma_creditos
FROM Professor
INNER JOIN Prof_Disc
    on Prof_Disc.matr_fk = Professor.matr
INNER JOIN Departamento
    on Professor.lotacao = Departamento.Cod_dep
INNER JOIN UnidadeAcademica
    on Departamento.Cod_UA_fk = UnidadeAcademica.Cod_UA
INNER JOIN Disciplina
    on Disciplina.Cod_disc = Prof_Disc.Cod_disc_fk
WHERE UnidadeAcademica.nome = 'Centro de Ciências' and Prof_Disc.Semestre IN (2018.1, 2018.2)
GROUP BY Professor.nome, Prof_Disc.Semestre
HAVING SUM(Disciplina.qte_creditos) < 8;
