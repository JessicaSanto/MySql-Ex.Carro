-- TCL -> TRASACT CONTROL LANGUAGE

-- ACID 
-- Atomicidade -> deve ser executada de forma completa. Ou acontece por inteiro ou não acontece nada.
-- Consistência -> qualidade e integridade das informações armazenadas
-- Isolamento -> garante que as transações sejam executadas de forma a não interferir umas nas outras.
-- Durabilidade -> garante que uma vez que uma transação é confirmada, suas alterações são permanentemente gravadas, mesmo em caso de falhas ou quedas do sistema.

-- COMMIT 
-- Salvar as alterações no banco de dados. CONSOLIDAR A TRANSAÇÃO

-- ROLLBACK
-- Quando houver uma falha no processo, ele não salva nada. TRANSAÇÃO TOTALMENTE DESFEITA

SELECT @@autocommit;

SET @@autocommit = OFF; -- desativa o 'salvar automaticamente'

select * from tb_proprietario;

-- ROLLBACK SIMPLES
-- INSERT 
INSERT INTO tb_proprietario VALUES (
'2',
'Juscelino',
'4',
'35'
);

ROLLBACK;

-- DELETE
DELETE FROM tb_proprietario
WHERE id = 2;

ROLLBACK; 

SELECT * FROM tb_proprietario;

-- UPDATE
UPDATE tb_proprietario 
SET nome = "Caique"
WHERE id = '1';

ROLLBACK;

SELECT * FROM tb_proprietario;


START TRANSACTION;
	INSERT INTO tb_proprietario VALUES (
    '3',
    'Carol',
    '3',
    '30'
    );
    
COMMIT; 

SELECT * FROM tb_proprietario;

rollback;








