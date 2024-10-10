-- SUBQUERIES

-- é um recurso dentro do SQL que nos permite criar queries mais otimizadas,
-- reaproveitnado o resultado de uma consulta, dentro de outra consulta

-- PODEM SER UTILIZADAS EM 3 SITUAÇÕES:
-- 1) Dentro de uma cláusula WHERE, com um filtro
-- 2) Dentro de uma cláusula SELECT, como uma nova coluna
-- 3) Dentro da cláusula FROM, como uma nova tabela

SELECT * FROM carros;



USE carrosbd;

-- EXEMPLO 1 : Quais carros tem um preço acima da média de todos os carros?
-- 1º passo) Descobrir a média de preço
-- AVG - calcula a média
 SELECT AVG(valor) from carros;
 
-- 2º passo) Filtrar a tabela Carros baseado no valor acima
SELECT * FROM carros
WHERE valor > 21523.33;

-- RESULTADO
SELECT * FROM carros
WHERE valor > (SELECT AVG(valor) from carros);


-- EXEMPLO 2 : Quais proprietários tem o carro da marca FIAT?
-- 1º passo) Descobrir os proprietarios que tem o carro com o ID X
SELECT * FROM proprietario
WHERE id_carro in (2);

-- 2º passo) Descobrir os carros cadastrados
SELECT * FROM proprietario 
WHERE marca = 'Fiat';

-- RESULTADO
SELECT nome
FROM proprietario
WHERE id_carro in (
SELECT id FROM carros
WHERE marca = 'Fiat' )

