DROP DATABASE IF EXISTS FBD_db;
CREATE DATABASE FBD_db;
USE FBD_db;

-- t6 (ok)
CREATE TABLE Alunos ( 
    matr_aluno INTEGER PRIMARY KEY,
    nome VARCHAR(255),
    endereco VARCHAR(255),
    CPF BIGINT UNIQUE,
    RG BIGINT UNIQUE
);

-- t4 (ok)
CREATE TABLE Curso (
    Cod_curso INTEGER PRIMARY KEY,
    nome VARCHAR(255),
    endereco VARCHAR(255)
);

-- t7 (ok)
CREATE TABLE UnidadeAcademica (
    Cod_UA INTEGER PRIMARY KEY,
    nome VARCHAR(255),
    endereco VARCHAR(255)
);

-- t8 (ok)
CREATE TABLE Disciplina (
    Cod_disc INTEGER PRIMARY KEY,
    nome VARCHAR(255),
    endereco VARCHAR(255),
    qte_creditos INTEGER
);

-- t9 (ok)
CREATE TABLE Telefones_UA (
    Num_tel BIGINT PRIMARY KEY,
    tipo_fone VARCHAR(255),
    Cod_UA_fk INTEGER,
    FOREIGN KEY(Cod_UA_fk) REFERENCES UnidadeAcademica(Cod_UA)
);

-- t10 (ok)
CREATE TABLE Aluno_disc (
    Semestre NUMERIC(5,1),
    AF INTEGER,
    PrimeiraAP INTEGER,
    SegundaAP INTEGER,
    Cod_disc_fk INTEGER,
    matr_aluno_fk INTEGER,
    FOREIGN KEY(Cod_disc_fk) REFERENCES Disciplina(Cod_disc),
    FOREIGN KEY(matr_aluno_fk) REFERENCES Alunos(matr_aluno),
    PRIMARY KEY(Cod_disc_fk, matr_aluno_fk)
);

-- t1 
CREATE TABLE Departamento (
    Cod_dep INTEGER PRIMARY KEY,
    nome VARCHAR(255),
    endereco VARCHAR(255),
    Cod_UA_fk INTEGER,
    FOREIGN KEY(Cod_UA_fk) REFERENCES UnidadeAcademica(Cod_UA)
);

-- t2
CREATE TABLE telefones_dep (
    Num_tel BIGINT PRIMARY KEY,
    tipo_fone VARCHAR(255),
    Cod_dep_fk INTEGER,
    FOREIGN KEY(Cod_dep_fk) REFERENCES Departamento(Cod_dep)
);

-- t3
CREATE TABLE Professor (
    matr INTEGER PRIMARY KEY,
    salario INTEGER,
    nome VARCHAR(255),
    endereco VARCHAR(255),
    CPF BIGINT UNIQUE,
    RG BIGINT UNIQUE,
    diretor_Cod_UA INTEGER,
    chefe_cod_dep INTEGER,
    coordenador_cod_curso INTEGER,
    FOREIGN KEY(diretor_Cod_UA) REFERENCES UnidadeAcademica(Cod_UA),
    FOREIGN KEY(chefe_cod_dep) REFERENCES Departamento(Cod_dep),
    FOREIGN KEY(coordenador_cod_curso) REFERENCES Curso(Cod_curso)
);

-- t5
CREATE TABLE Cur_Disc (
    Cod_disc_fk INTEGER,
    Cod_curso_fk INTEGER,
    FOREIGN KEY(Cod_disc_fk) REFERENCES Disciplina(Cod_disc),
    FOREIGN KEY(Cod_curso_fk) REFERENCES Curso(Cod_curso),
    PRIMARY KEY(Cod_disc_fk, Cod_curso_fk)
);

-- t11
CREATE TABLE Prof_Disc (
    Semestre NUMERIC(5,1),
    Cod_disc_fk INTEGER,
    matr_fk INTEGER,
    FOREIGN KEY(Cod_disc_fk) REFERENCES Disciplina(Cod_disc),
    FOREIGN KEY(matr_fk) REFERENCES Professor(matr),
    PRIMARY KEY(Cod_disc_fk, matr_fk)
);

-- t12
CREATE TABLE Dep_Curso (
    Cod_curso_fk INTEGER,
    Cod_dep_fk INTEGER,
    FOREIGN KEY(Cod_curso_fk) REFERENCES Curso(Cod_curso),
    FOREIGN KEY(Cod_dep_fk) REFERENCES Departamento(Cod_dep),
    PRIMARY KEY(Cod_curso_fk, Cod_dep_fk)
);

-- t13
CREATE TABLE Pre_requisito (
    Cod_disc_fk INTEGER,
    Cod_pre_requisito INTEGER,
    FOREIGN KEY(Cod_disc_fk) REFERENCES Disciplina(Cod_disc),
    FOREIGN KEY(Cod_pre_requisito) REFERENCES Disciplina(Cod_disc),
    PRIMARY KEY(Cod_disc_fk, Cod_pre_requisito)
);

/*

ETAPA
DE
INGESTÃO 

*/
insert into Alunos (matr_aluno, nome, endereco, CPF, RG) values (3873, 'Toiboid Batrim', '86 Warner Place', 4716162540, 3394773910);
insert into Alunos (matr_aluno, nome, endereco, CPF, RG) values (860, 'Malissa Khan', '594 Buell Way', 6544267732, 2217502063);
insert into Alunos (matr_aluno, nome, endereco, CPF, RG) values (17, 'Gabriellia Badrick', '265 Blaine Crossing', 8613611257, 9459891888);
insert into Alunos (matr_aluno, nome, endereco, CPF, RG) values (328, 'Ranique Cassius', '05 Comanche Crossing', 9811331383, 2125296152);
insert into Alunos (matr_aluno, nome, endereco, CPF, RG) values (248, 'Prudy Hayter', '4802 Truax Way', 2657923720, 6327845627);
insert into Alunos (matr_aluno, nome, endereco, CPF, RG) values (6, 'Molli Gaunson', '70255 Hanson Terrace', 2996432975, 2226322248);
insert into Alunos (matr_aluno, nome, endereco, CPF, RG) values (79, 'Kelci Malmar', '83072 Red Cloud Park', 9696135130, 1365232107);
insert into Alunos (matr_aluno, nome, endereco, CPF, RG) values (3776, 'Nigel Gamet', '016 Fair Oaks Terrace', 3393244264, 1643184598);
insert into Alunos (matr_aluno, nome, endereco, CPF, RG) values (3, 'Guenna Gain', '66 Morrow Center', 7140585222, 8165856677);
insert into Alunos (matr_aluno, nome, endereco, CPF, RG) values (81786, 'Jae Thripp', '985 Express Road', 5660804780, 9521428449);

insert into Curso (Cod_curso, nome, endereco) values (1, 'Ciencia da Computacao', '01337 Holmberg Junction');
insert into Curso (Cod_curso, nome, endereco) values (2, 'Engenharia de Computacao', '25 Twin Pines Court');
insert into Curso (Cod_curso, nome, endereco) values (3, 'Engenharia de Alimentos', '30 Oriole Pass');
insert into Curso (Cod_curso, nome, endereco) values (4, 'Engenharia de Producao', '43 Fairfield Drive');
insert into Curso (Cod_curso, nome, endereco) values (5, 'Engenharia Eletrica', '3696 Oak Hill');
insert into Curso (Cod_curso, nome, endereco) values (6, 'Engenharia Quimica', '88357 Fisk Avenue');
insert into Curso (Cod_curso, nome, endereco) values (7, 'Engenharia Ambiental', '98670 Hallows Plaza');
insert into Curso (Cod_curso, nome, endereco) values (8, 'Engenharia de Petroleo', '27380 Warrior Terrace');
insert into Curso (Cod_curso, nome, endereco) values (9, 'Engenharia Fisica', '570 Ludington Court');
insert into Curso (Cod_curso, nome, endereco) values (10, 'Engenharia Mecanica', '3975 Northridge Junction');

insert into UnidadeAcademica (Cod_UA, nome, endereco) values (1, 'UFC Campus Pici', '42 Raven Circle');
insert into UnidadeAcademica (Cod_UA, nome, endereco) values (2, 'UFC Sobral', '4923 Brickson Park Plaza');
insert into UnidadeAcademica (Cod_UA, nome, endereco) values (3, 'UFC Benfica', '7091 2nd Court');
/*
insert into UnidadeAcademica (Cod_UA, nome, endereco) values (4, 'UFC Granada', '97279 Sunbrook Avenue');
insert into UnidadeAcademica (Cod_UA, nome, endereco) values (5, 'UFC Centro', '28 Division Street');
insert into UnidadeAcademica (Cod_UA, nome, endereco) values (6, 'UFC Crateus', '2 Jenna Circle');
insert into UnidadeAcademica (Cod_UA, nome, endereco) values (7, 'UFC Caninde', '2775 Quincy Center');
insert into UnidadeAcademica (Cod_UA, nome, endereco) values (8, 'UFC Barbalha', '17 Kim Court');
insert into UnidadeAcademica (Cod_UA, nome, endereco) values (9, 'UFC Parangaba', '7 Granby Pass');
insert into UnidadeAcademica (Cod_UA, nome, endereco) values (10, 'UFC Kennedy', '3129 Anhalt Court');
*/
insert into Disciplina (Cod_disc, nome, qte_creditos) values (1, 'Portugues', 1);
insert into Disciplina (Cod_disc, nome, qte_creditos) values (2, 'Ingles', 2);
insert into Disciplina (Cod_disc, nome, qte_creditos) values (3, 'Matematica',  3);
insert into Disciplina (Cod_disc, nome, qte_creditos) values (4, 'Fisica', 4);
insert into Disciplina (Cod_disc, nome, qte_creditos) values (5, 'Quimica', 5);
insert into Disciplina (Cod_disc, nome, qte_creditos) values (6, 'FBD', 6);
insert into Disciplina (Cod_disc, nome, qte_creditos) values (7, 'Educacao Fisica', 7);
insert into Disciplina (Cod_disc, nome, qte_creditos) values (8, 'Historia', 8);
insert into Disciplina (Cod_disc, nome, qte_creditos) values (9, 'Geografia', 9);
insert into Disciplina (Cod_disc, nome, qte_creditos) values (10, 'Cinema Grafico', 10);

insert into Telefones_UA (Num_tel, tipo_fone, Cod_UA_fk) values (457714703, 'fixo', 1);
insert into Telefones_UA (Num_tel, tipo_fone, Cod_UA_fk) values (738714868, 'fixo', 2);
insert into Telefones_UA (Num_tel, tipo_fone, Cod_UA_fk) values (163457280, 'movel', 3);
insert into Telefones_UA (Num_tel, tipo_fone, Cod_UA_fk) values (137291978, 'movel', 1);
insert into Telefones_UA (Num_tel, tipo_fone, Cod_UA_fk) values (261954951, 'movel', 2);
insert into Telefones_UA (Num_tel, tipo_fone, Cod_UA_fk) values (136478555, 'fixo', 3);
insert into Telefones_UA (Num_tel, tipo_fone, Cod_UA_fk) values (695250398, 'fixo', 1);
insert into Telefones_UA (Num_tel, tipo_fone, Cod_UA_fk) values (203218820, 'fixo', 2);
insert into Telefones_UA (Num_tel, tipo_fone, Cod_UA_fk) values (489223104, 'fixo', 3);
insert into Telefones_UA (Num_tel, tipo_fone, Cod_UA_fk) values (623819084, 'movel', 1);

insert into Aluno_disc (Semestre, AF, PrimeiraAP, SegundaAP, Cod_disc_fk, matr_aluno_fk) values (2018.1, 10, 1, 9, 1, 3873);
insert into Aluno_disc (Semestre, AF, PrimeiraAP, SegundaAP, Cod_disc_fk, matr_aluno_fk) values (2018.1, 2, 5, 7, 2, 860);
insert into Aluno_disc (Semestre, AF, PrimeiraAP, SegundaAP, Cod_disc_fk, matr_aluno_fk) values (2018.1, 8, 6, 5, 3, 17);
insert into Aluno_disc (Semestre, AF, PrimeiraAP, SegundaAP, Cod_disc_fk, matr_aluno_fk) values (2018.2, 7, 4, 7, 4, 328);
insert into Aluno_disc (Semestre, AF, PrimeiraAP, SegundaAP, Cod_disc_fk, matr_aluno_fk) values (2018.2, 2, 1, 2, 5, 248);
insert into Aluno_disc (Semestre, AF, PrimeiraAP, SegundaAP, Cod_disc_fk, matr_aluno_fk) values (2018.1, 3, 5, 2, 6, 79);
insert into Aluno_disc (Semestre, AF, PrimeiraAP, SegundaAP, Cod_disc_fk, matr_aluno_fk) values (2018.1, 3, 5, 4, 7, 3776);
insert into Aluno_disc (Semestre, AF, PrimeiraAP, SegundaAP, Cod_disc_fk, matr_aluno_fk) values (2019.1, 8, 3, 6, 8, 3);
insert into Aluno_disc (Semestre, AF, PrimeiraAP, SegundaAP, Cod_disc_fk, matr_aluno_fk) values (2019.1, 4, 5, 7, 9, 81786);
insert into Aluno_disc (Semestre, AF, PrimeiraAP, SegundaAP, Cod_disc_fk, matr_aluno_fk) values (2018.1, 4, 6, 10, 10, 6);

insert into Departamento (Cod_dep, nome, endereco, Cod_UA_fk) values (1, 'DAUD', '0983 Bobwhite Alley', 1);
insert into Departamento (Cod_dep, nome, endereco, Cod_UA_fk) values (2, 'DETI', '227 Bobwhite Alley', 2);
insert into Departamento (Cod_dep, nome, endereco, Cod_UA_fk) values (3, 'CC', '55510 Cordelia Center', 3);
insert into Departamento (Cod_dep, nome, endereco, Cod_UA_fk) values (4, 'DEP', '8937 Superior Way', 1);
insert into Departamento (Cod_dep, nome, endereco, Cod_UA_fk) values (5, 'DET', '064 Hooker Parkway', 2);
insert into Departamento (Cod_dep, nome, endereco, Cod_UA_fk) values (6, 'DEE', '612 Morning Plaza', 3);
insert into Departamento (Cod_dep, nome, endereco, Cod_UA_fk) values (7, 'DEECC', '8586 Eggendart Crossing', 1);
insert into Departamento (Cod_dep, nome, endereco, Cod_UA_fk) values (8, 'DEC', '57140 Mosinee Hill', 1);
insert into Departamento (Cod_dep, nome, endereco, Cod_UA_fk) values (9, 'DEA', '80 Ramsey Road', 1);
insert into Departamento (Cod_dep, nome, endereco, Cod_UA_fk) values (10, 'DEPT', '1548 Novick Hill', 1);

insert into telefones_dep (Num_tel, tipo_fone, Cod_dep_fk) values (548132267, 'fixo', 1);
insert into telefones_dep (Num_tel, tipo_fone, Cod_dep_fk) values (893762514, 'movel', 2);
insert into telefones_dep (Num_tel, tipo_fone, Cod_dep_fk) values (513917959, 'fixo', 3);
insert into telefones_dep (Num_tel, tipo_fone, Cod_dep_fk) values (836149538, 'fixo', 4);
insert into telefones_dep (Num_tel, tipo_fone, Cod_dep_fk) values (729949947, 'movel', 5);
insert into telefones_dep (Num_tel, tipo_fone, Cod_dep_fk) values (809700101, 'movel', 6);
insert into telefones_dep (Num_tel, tipo_fone, Cod_dep_fk) values (450383956, 'movel', 7);
insert into telefones_dep (Num_tel, tipo_fone, Cod_dep_fk) values (152843077, 'fixo', 8);
insert into telefones_dep (Num_tel, tipo_fone, Cod_dep_fk) values (340594305, 'fixo', 9);
insert into telefones_dep (Num_tel, tipo_fone, Cod_dep_fk) values (792715259, 'movel', 10);

insert into Professor (matr, salario, nome, endereco, CPF, RG, diretor_Cod_UA, chefe_cod_dep, coordenador_cod_curso) values (7234, 8073329, 'Filberte Bosdet', '5583 Glendale Plaza', 2875770632, 7517973428, 1, 1, 1);
insert into Professor (matr, salario, nome, endereco, CPF, RG, diretor_Cod_UA, chefe_cod_dep, coordenador_cod_curso) values (54, 3161638, 'Lynne Lafont', '6916 Muir Point', 4817649380, 7852460755, 2, 2, 2);
insert into Professor (matr, salario, nome, endereco, CPF, RG, diretor_Cod_UA, chefe_cod_dep, coordenador_cod_curso) values (3, 8681352, 'Aubine Bernardini', '44 Mosinee Alley', 9593286489, 7862366336, 3, 3, 3);
insert into Professor (matr, salario, nome, endereco, CPF, RG, diretor_Cod_UA, chefe_cod_dep, coordenador_cod_curso) values (46, 0574339, 'Perry Alcorn', '00073 Crowley Place', 2495659640, 4398097147, 1, 4, 4);
insert into Professor (matr, salario, nome, endereco, CPF, RG, diretor_Cod_UA, chefe_cod_dep, coordenador_cod_curso) values (426, 0777639, 'Jeffrey Skep', '4483 Buhler Plaza', 2659761106, 1519124686, 2, 5, 5);
insert into Professor (matr, salario, nome, endereco, CPF, RG, diretor_Cod_UA, chefe_cod_dep, coordenador_cod_curso) values (62, 3449192, 'Franchot Jovovic', '8 Debra Trail', 8883731220, 6257547636, 3, 6, 6);
insert into Professor (matr, salario, nome, endereco, CPF, RG, diretor_Cod_UA, chefe_cod_dep, coordenador_cod_curso) values (0, 5117530, 'Andrus Alvis', '7 Claremont Trail', 1807832074, 4766949072, 1, 7, 7);
insert into Professor (matr, salario, nome, endereco, CPF, RG, diretor_Cod_UA, chefe_cod_dep, coordenador_cod_curso) values (00723, 6066321, 'Zahara Witson', '061 Washington Plaza', 1428162798, 4449794931, 2, 8, 8);
insert into Professor (matr, salario, nome, endereco, CPF, RG, diretor_Cod_UA, chefe_cod_dep, coordenador_cod_curso) values (19, 2213690, 'Mathilda Kaufman', '322 Eagan Court', 1456511823, 5857641209, 1, 9, 9);
insert into Professor (matr, salario, nome, endereco, CPF, RG, diretor_Cod_UA, chefe_cod_dep, coordenador_cod_curso) values (5454, 1066912, 'Imelda Hardwich', '7671 Fulton Crossing', 7702628499, 2912539439, 3, 10, 10);

insert into Cur_Disc (Cod_disc_fk, Cod_curso_fk) values (1, 1);
insert into Cur_Disc (Cod_disc_fk, Cod_curso_fk) values (6, 1);
insert into Cur_Disc (Cod_disc_fk, Cod_curso_fk) values (3, 1);
insert into Cur_Disc (Cod_disc_fk, Cod_curso_fk) values (5, 1);
insert into Cur_Disc (Cod_disc_fk, Cod_curso_fk) values (4, 1);
insert into Cur_Disc (Cod_disc_fk, Cod_curso_fk) values (2, 2);
insert into Cur_Disc (Cod_disc_fk, Cod_curso_fk) values (3, 3);
insert into Cur_Disc (Cod_disc_fk, Cod_curso_fk) values (4, 4);
insert into Cur_Disc (Cod_disc_fk, Cod_curso_fk) values (5, 5);
insert into Cur_Disc (Cod_disc_fk, Cod_curso_fk) values (6, 6);
insert into Cur_Disc (Cod_disc_fk, Cod_curso_fk) values (7, 7);
insert into Cur_Disc (Cod_disc_fk, Cod_curso_fk) values (8, 8);
insert into Cur_Disc (Cod_disc_fk, Cod_curso_fk) values (9, 9);
insert into Cur_Disc (Cod_disc_fk, Cod_curso_fk) values (10, 10);

insert into Prof_Disc (Semestre, Cod_disc_fk, matr_fk) values (2018.1, 1, 0);
insert into Prof_Disc (Semestre, Cod_disc_fk, matr_fk) values (2018.1, 5, 0);
insert into Prof_Disc (Semestre, Cod_disc_fk, matr_fk) values (2018.1, 6, 0);
insert into Prof_Disc (Semestre, Cod_disc_fk, matr_fk) values (2018.2, 4, 0);
insert into Prof_Disc (Semestre, Cod_disc_fk, matr_fk) values (2018.2, 3, 0);
insert into Prof_Disc (Semestre, Cod_disc_fk, matr_fk) values (2018.2, 2, 0);
insert into Prof_Disc (Semestre, Cod_disc_fk, matr_fk) values (2018.1, 5, 3);
insert into Prof_Disc (Semestre, Cod_disc_fk, matr_fk) values (2018.2, 1, 3);
insert into Prof_Disc (Semestre, Cod_disc_fk, matr_fk) values (2019.1, 7, 3);
insert into Prof_Disc (Semestre, Cod_disc_fk, matr_fk) values (2019.2, 8, 3);
insert into Prof_Disc (Semestre, Cod_disc_fk, matr_fk) values (2019.2, 9, 3);
insert into Prof_Disc (Semestre, Cod_disc_fk, matr_fk) values (2019.1, 3, 19);
insert into Prof_Disc (Semestre, Cod_disc_fk, matr_fk) values (2019.1, 4, 46);
insert into Prof_Disc (Semestre, Cod_disc_fk, matr_fk) values (2019.1, 5, 54);
insert into Prof_Disc (Semestre, Cod_disc_fk, matr_fk) values (2019.2, 6, 62);
insert into Prof_Disc (Semestre, Cod_disc_fk, matr_fk) values (2019.1, 7, 426);
insert into Prof_Disc (Semestre, Cod_disc_fk, matr_fk) values (2019.2, 8, 00723);
insert into Prof_Disc (Semestre, Cod_disc_fk, matr_fk) values (2019.1, 9, 5454);
insert into Prof_Disc (Semestre, Cod_disc_fk, matr_fk) values (2019.1, 10, 7234);

insert into Dep_Curso (Cod_curso_fk, Cod_dep_fk) values (1, 1);
insert into Dep_Curso (Cod_curso_fk, Cod_dep_fk) values (2, 2);
insert into Dep_Curso (Cod_curso_fk, Cod_dep_fk) values (3, 3);
insert into Dep_Curso (Cod_curso_fk, Cod_dep_fk) values (4, 4);
insert into Dep_Curso (Cod_curso_fk, Cod_dep_fk) values (5, 5);
insert into Dep_Curso (Cod_curso_fk, Cod_dep_fk) values (6, 6);
insert into Dep_Curso (Cod_curso_fk, Cod_dep_fk) values (7, 7);
insert into Dep_Curso (Cod_curso_fk, Cod_dep_fk) values (8, 8);
insert into Dep_Curso (Cod_curso_fk, Cod_dep_fk) values (9, 9);
insert into Dep_Curso (Cod_curso_fk, Cod_dep_fk) values (10, 10);



