# Realizado usando o SGBD MySQL 
# Projetos e estudos em SQL disponíveis em meu portfólio: github.com/lucasarauj0h/data-science

# CASE 1 - Grandes Países

CREATE TABLE case_safra.World (
  nome VARCHAR(15) NULL,
  continente VARCHAR(15) NULL,
  area INT NULL,
  populacao INT NULL,
  PIB BIGINT NULL);


INSERT INTO case_safra.World (nome, continente, area, populacao, PIB)
VALUES 
    ("Afghanistan", "Asia", 652230, 25500100, 20343000000),
    ("Albania", "Europe", 28748, 2831741, 12960000000),
    ("Algeria", "Africa", 2381741, 37100000, 188681000000),
    ("Andorra", "Europe", 468, 78115, 3712000000),
    ("Angola", "Africa", 1246700, 20609294, 100990000000);

SELECT * 
FROM case_safra.World;

SELECT nome, populacao, area
FROM case_safra.World
WHERE populacao > 25000000 AND (area * area) > 3000000;

# Case 2 - Preço do produto em uma determinada data

CREATE TABLE case_safra.products (
  product_id INT,
  new_price INT,
  change_date DATE,
  PRIMARY KEY (product_id, change_date));
  
  
INSERT INTO case_safra.products (product_id, new_price, change_date)
VALUES 
    (1, 20, '2019-08-14'),
    (2, 50, '2019-08-14'),
    (1, 30, '2019-08-15'),
    (1, 35, '2019-08-16'),
    (2, 65, '2019-08-17'),
    (3, 20, '2019-08-18'),
    (3, 20, '2019-08-21'),
    (2, 75, '2019-08-23');
    

SELECT * 
FROM case_safra.products;

# Usando CTE's para realizar as querys e fazer o filtro que queremos.
# O grande desafio aqui foi incluir os valores que não tiveram modificação até a data especificada
# visto quando aplicado a clausula 'WHERE', não há sinal da existencia do product_id = 3, bem como poderiam existir infitos produtos
# a solução pensada foi criar duas tabelas temporaria usando CTE's para que possamos verificar os produtos que tiveram o preço modificado
# e também acesso aqueles que não tiveram o preço modificado.


WITH
# CTE para obter os preços mais recentes de cada produto antes da data especificada
ultimos_precos AS (
    SELECT product_id,new_price,
        ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY change_date DESC) AS recentes
    FROM products
    WHERE change_date <= '2019-08-16'
),
# CTE para obter todos os produtos distintos da tabela
produtos_nao_atualizados AS (
    SELECT DISTINCT product_id
    FROM products
)
# Consulta principal que une os produtos não atualizados com os preços mais recentes
SELECT p1.product_id, COALESCE(p2.new_price, 10) AS price
FROM produtos_nao_atualizados AS p1
LEFT JOIN ultimos_precos AS p2 ON p1.product_id = p2.product_id AND p2.recentes = 1;


