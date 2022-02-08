select nome from Aluno_disc, Alunos where (Aluno_disc.matr_aluno_fk = Alunos.matr_aluno)
and (Aluno_disc.Semestre = '2018.2' )