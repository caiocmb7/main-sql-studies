DROP DATABASE IF EXISTS FBD_db;
CREATE DATABASE FBD_db;
USE FBD_db;

-- t6 (ok)
CREATE TABLE Alunos ( 
    matr_aluno INTEGER PRIMARY KEY,
    nome VARCHAR(255),
    endereco VARCHAR(255),
    CPF INTEGER UNIQUE,
    RG INTEGER UNIQUE
);

-- t4 (ok)
CREATE TABLE Curso (
    Cod_curso INTEGER AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    endereco VARCHAR(255)
);

-- t7 (ok)
CREATE TABLE UnidadeAcademica (
    Cod_UA INTEGER AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    endereco VARCHAR(255)
);

-- t8 (ok)
CREATE TABLE Disciplina (
    Cod_disc INTEGER AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    endereco VARCHAR(255),
    qte_creditos INTEGER
);

-- t9 (ok)
CREATE TABLE Telefones_UA (
    Num_tel INTEGER PRIMARY KEY,
    tipo_fone VARCHAR(255),
    Cod_UA_fk INTEGER,
    FOREIGN KEY(Cod_UA_fk) REFERENCES UnidadeAcademica(Cod_UA)
);

-- t10 (ok)
CREATE TABLE Aluno_disc (
    Semestre INTEGER,
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
    Cod_dep INTEGER AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    endereco VARCHAR(255),
    Cod_UA_fk INTEGER,
    FOREIGN KEY(Cod_UA_fk) REFERENCES UnidadeAcademica(Cod_UA)
);

-- t2
CREATE TABLE telefones_dep (
    Num_tel INTEGER PRIMARY KEY,
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
    CPF INTEGER UNIQUE,
    RG INTEGER UNIQUE,
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
    Cod_cur_fk INTEGER,
    FOREIGN KEY(Cod_disc_fk) REFERENCES Disciplina(Cod_disc),
    FOREIGN KEY(Cod_cur_fk) REFERENCES Curso(Cod_curso),
    PRIMARY KEY(Cod_disc_fk, Cod_cur_fk)
);

-- t11
CREATE TABLE Prof_Disc (
    Semestre INTEGER,
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

/*

ETAPA
DE
INGESTÃO 

*/

matr_aluno INTEGER PRIMARY KEY,
    nome VARCHAR(255),
    endereco VARCHAR(255),
    CPF INTEGER UNIQUE,
    RG

INSERT INTO Alunos (matr_aluno, nome, endereco, CPF, RG) VALUES (472713, 'Kenton_Kirlin', 'Rua 1', 53453434, 4506945063453), (472743, 'Joao', 'Rua 2', 645645645, 64563457452), (435222, 'Cleitin', 'Rua 3', 5343512, 34526575), (442743, 'Lin', 'Rua 4', 53452346, 657568568)

