# Anotações

- o primeiro desafio é compreender os dados e saber como consumi-los para dentro do MySQL
- built_used_area não possui uma chave primaria pois contém valores repetidos em todas as colunas, o que parece ser um problema, pois o listing_id deve estar relacionado aos outros listing_id que tem em outras tabelas...tem que checar esse fato depois
- vou consertar o built_used_area, usar drop duplicates para tirar as rows duplicadas, criei um metodo pra isso chamado check_duplicates.sql mas no fim das contas entendi o pq que quando eu crio uma tabela ela já faz isso automaticamente quando eu ponho o primary key, ele remove automaticamente as linhas duplicadas quando consome os dados do csv
