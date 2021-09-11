USE trash_stuff;

ALTER TABLE desafio
CHANGE tabela tabela_decimal DECIMAL(10,2) NOT NULL DEFAULT 1.00;

DESC desafio;