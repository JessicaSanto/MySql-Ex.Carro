USE bd_carro;
-- INNER JOIN
-- Retornar somente as colunas correspondentes entre as tabelas
-- Coluna id_carro na tabela proprietario / id na tabela carro

SELECT * FROM tb_proprietario AS P
INNER JOIN tb_carros AS C
ON P.id_carro = C.id;


-- RIGHT JOIN
-- todos os registros da minha segunda tabela (direita) sejam retornas, 
-- mesmo que não haja similaridade na primeira tabela (esquerda) 
-- NULL
SELECT * FROM tb_proprietario 
RIGHT JOIN tb_carros
ON tb_proprietario.id_carro = tb_carros.id;

-- LEFT JOIN
-- Vai me retornar todos os registros da primeira tabela (esquerda)
-- mais as similaridades da segunda tabela (direita)
SELECT * FROM tb_carros AS C
LEFT JOIN tb_proprietario AS P
ON C.id = P.id_carro;

-- UNION 
-- Combinação dos dois Joins (Right e Left)
SELECT * FROM tb_proprietario AS P
LEFT JOIN tb_carros AS C
ON P.id_carro = C.id
UNION
SELECT * FROM tb_proprietario AS P
RIGHT JOIN tb_carros AS C
ON C.id = P.id_carro
WHERE P.id_carro IS NULL;








SELECT * FROM tb_proprietario;
SELECT * FROM tb_carros;
