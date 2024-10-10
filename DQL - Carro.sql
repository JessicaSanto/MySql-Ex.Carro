USE CarrosBD; 

-- Seleciona todos os registros 
SELECT * FROM Proprietario;
SELECT * FROM Carros;
SELECT * FROM historico_preco;

-- Seleciona o maior e menor valor registrado na coluna escolhida
SELECT MIN(valor) FROM Carros;
SELECT MAX(valor) FROM Carros;

-- Seleciona o maior e menor valor registrado na coluna escolhida, informando tambem a marca / modelo
SELECT marca, valor FROM Carros WHERE valor = (SELECT MIN(valor) FROM Carros);
SELECT modelo, valor FROM Carros WHERE valor = (SELECT MAX(valor) FROM Carros);

-- Informa o número de registros encontra
SELECT COUNT(id) FROM Carros;

-- Informa a soma dos valores registrados 
SELECT SUM(valor) FROM Carros;

-- Informa a quantidade de registros por marca e que está entre um periodo de tempo
SELECT COUNT(Carros.id) AS 'Total Serviço', marca
FROM Carros WHERE ano BETWEEN "1985" AND "2021" GROUP BY marca; 

-- Informa a quantidade de registros por marca e que se refere a um ano exato
SELECT COUNT(Carros.id) AS 'Total Serviço', marca
FROM Carros WHERE ano = "1980" GROUP BY marca; 

-- Seleciona e exibe os modelo em ordem alfabetica / crescente 
SELECT * FROM Carros ORDER BY modelo ASC;
SELECT * FROM Carros ORDER BY modelo DESC;

----------------------
-- INNER JOIN retorna todas as colunas de ambas as tabelas (Proprietario e Carros), mas apenas para as linhas onde há uma correspondência entre o id_carro da tabela Proprietario e o id da tabela Carros.
-- Neste caso, a junção é feita quando o valor da coluna id_carro na tabela Proprietario é igual ao valor da coluna id na tabela Carros, trazendo assim, o registro completo do proprietario e do carro
SELECT * FROM 
	Proprietario as P 
INNER JOIN 
	Carros as C 
ON 
	P.id_carro = C.id;
    
---------------------
-- O RIGHT JOIN garante que todas as linhas da tabela Carros serão retornadas, mesmo que não haja correspondências na tabela Proprietario.
-- Retorna todas as linhas da tabela à direita (no caso, Carros), e as correspondências da tabela à esquerda (Proprietario). 
-- Se não houver correspondência, as colunas da tabela Proprietario ficarão com valores NULL.
SELECT * FROM 
	Proprietario as P 
RIGHT JOIN 
	Carros as C 
ON 
	P.id_carro = C.id;
     
--------------------------
-- 1º SELECT
-- Retornar todos os proprietários (P) e os respectivos carros (C) se houver um carro associado ao proprietário.
-- Se um proprietário não tiver um carro (sem correspondência na tabela Carros), as colunas de Carros (marca, modelo, ano, valor, cor) vão aparecer como NULL.
-- O LEFT JOIN garante que todos os proprietários serão retornados, mesmo que não haja um carro correspondente na tabela Carros.

-- 2º SELECT 
-- Este segundo SELECT retorna todos os carros que não têm um proprietário associado.
-- LEFT JOIN com a tabela Proprietario, mas a cláusula WHERE P.id IS NULL filtra apenas as linhas onde não há correspondência na tabela Proprietario.
-- Ou seja, ele encontra os carros que estão sem um proprietário na tabela Proprietario.

-- JUNÇÃO
-- A UNION combina os resultados dos dois SELECTs.
-- Remove duplicatas (se houver) automaticamente.
-- Mostra tanto os proprietários com ou sem carros (do primeiro SELECT), quanto os carros que não têm proprietários (do segundo SELECT).

-- Essa consulta garante que você verá:
-- Todos os proprietários (mesmo os sem carros).
-- Todos os carros (mesmo os sem proprietários).

SELECT 
    P.nome AS Proprietario_nome,
    C.marca,
    C.modelo,
    C.ano,
    C.valor,
    C.cor
FROM 
    Proprietario P
LEFT JOIN 
    Carros C
    ON P.id_carro = C.id

UNION

SELECT 
    P.nome AS Proprietario_nome,
    C.marca,
    C.modelo,
    C.ano,
    C.valor,
    C.cor
FROM 
    Carros C
LEFT JOIN 
    Proprietario P
    ON P.id_carro = C.id
WHERE
    P.id IS NULL;

