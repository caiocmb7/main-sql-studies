SELECT 
    Professor.nome as Nome_Professor,
    Departamento.nome as Nome_Dep,
    Prof_Disc.Semestre,
    SUM(Disciplina.qte_creditos) AS soma_creditos
FROM Professor
inner join Prof_Disc
    on Prof_Disc.matr_fk = Professor.matr
inner join Departamento
    on Professor.chefe_cod_dep = Departamento.Cod_dep
inner join Disciplina
    on Disciplina.Cod_disc = Prof_Disc.Cod_disc_fk
where Departamento.nome = 'CC' and Prof_Disc.Semestre IN (2018.1, 2018.2)
group by Professor.nome, Prof_Disc.Semestre
having soma_creditos < 8;
