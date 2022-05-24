/*
SELECT
    price_changes_table.old_price,
    price_changes_table.new_price,
    ((price_changes_table.new_price / price_changes_table.old_price) - 1)*100 as percentage,
    price_changes_table.change_date
FROM price_changes_table
INNER JOIN built_used_area_table
    ON price_changes_table.listing_id = built_used_area_table.listing_id
WHERE 
    price_changes_table.new_price > price_changes_table.old_price AND     # clause 1
    year(change_date) = 2016     # clause 2
*/

# acaba que não precisa calcular usando o metro quadrado por ele é igual e ele sai da conta na divisão

/*

2. Escreva uma consulta MySQL para:

- Contar o número de imóveis que tiveram aumento de preço em 2016 e o aumento médio do percentual de preço/m² desses imóveis;

- Contar o número de imóveis que tiveram um decréscimo de preço em 2016 e a diminuição média da percentagem de preço/m2 desses imóveis;

*/
SELECT
    COUNT(*) as number_proprieties,
    ROUND(((price_changes_table.new_price / price_changes_table.old_price) - 1)*100, 2) as increased_percentage_average # increased percentage per square meter
FROM price_changes_table
INNER JOIN built_used_area_table
    ON price_changes_table.listing_id = built_used_area_table.listing_id
WHERE 
    price_changes_table.new_price > price_changes_table.old_price AND     # clause 1
    year(change_date) = 2016;    # clause 2

SELECT
    COUNT(*) as number_proprieties,
    ROUND((1 - (price_changes_table.new_price / price_changes_table.old_price))*100, 2) as decreased_percentage_average # increased percentage per square meter
FROM price_changes_table
INNER JOIN built_used_area_table
    ON price_changes_table.listing_id = built_used_area_table.listing_id
WHERE 
    price_changes_table.new_price < price_changes_table.old_price AND     # clause 1
    year(change_date) = 2016     # clause 2