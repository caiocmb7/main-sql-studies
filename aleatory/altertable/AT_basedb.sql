USE trash_stuff;

CREATE TABLE estudo (
    id INTEGER AUTO_INCREMENT PRIMARY KEY ,
    string VARCHAR(200) UNIQUE NOT NULL ,
    descricao VARCHAR(150) NOT NULL,
    contador INTEGER NOT NULL DEFAULT 1,
    num_float FLOAT NOT NULL,
    criado_em TIMESTAMP DEFAULT NOW()
);

