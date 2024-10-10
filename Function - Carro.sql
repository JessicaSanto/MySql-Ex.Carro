USE carrosbd;

-- Funções: Quando você precisa calcular um valor e utilizá-lo em uma consulta ou expressão.
-- Uma função sempre deve retornar um valor.
-- O valor retornado pode ser usado diretamente em consultas SQL.

-- Enquanto no procedimento, Não retorna um valor diretamente. Em vez disso, pode usar variáveis de saída (OUT ou INOUT) para fornecer resultados.
-- Não pode ser usada diretamente em uma expressão SQL.

-- CALCULO DE DESCONTO
DELIMITER $$

CREATE FUNCTION calculaDesconto(valor DECIMAL(10,2), desconto DECIMAL(5,2))
-- Criação da função: A palavra-chave CREATE FUNCTION define uma nova função chamada calculaDesconto. Ela recebe dois parâmetros:
-- valor: o preço original, do tipo DECIMAL(10,2), que pode ter até 10 dígitos no total, com 2 casas decimais.
-- desconto: a porcentagem de desconto, do tipo DECIMAL(5,2), que pode ter até 5 dígitos no total, com 2 casas decimais.

RETURNS DECIMAL(10,2)
-- Tipo de retorno: Aqui especificamos que a função retorna um valor do tipo DECIMAL(10,2), ou seja, o preço com o desconto aplicado, com no máximo 10 dígitos e 2 casas decimais.

READS SQL DATA
-- Atributo da função: Indica que a função apenas lê dados, sem fazer alterações no banco de dados.
-- Isso é importante para o MySQL saber que esta função não altera os dados existentes (somente faz cálculos).

BEGIN
-- Início do corpo da função: O BEGIN define o início do corpo da função, onde a lógica da função será implementada.

    RETURN valor - (valor * desconto / 100);
-- Retorno da função: Aqui está a lógica principal da função. A função retorna o valor final após aplicar o desconto:
-- valor * desconto / 100 calcula o valor do desconto com base no percentual fornecido.
-- valor - (valor * desconto / 100) subtrai o valor do desconto do valor original, resultando no preço final com o desconto aplicado.

END$$
-- Fim da função: END finaliza o bloco da função e $$ é o delimitador que indica o fim da instrução SQL completa.

DELIMITER ;
-- Restauração do delimitador padrão: Aqui o delimitador é restaurado para o padrão (;), para que as próximas instruções SQL possam ser finalizadas corretamente.

SELECT marca, valor, calculaDesconto(valor, 20) AS preco_com_desconto
FROM carros;
-- A consulta seleciona os campos marca e valor da tabela carros.
-- Também usa a função calculaDesconto para calcular o preço com desconto de 20% (calculaDesconto(valor, 20)) para cada carro.
-- O resultado desse cálculo é retornado com o alias preco_com_desconto, mostrando o valor final após o desconto.


-- *******************************************************


-- CALCULO DE VENDAS GERAIS POR MARCA
DELIMITER $$

CREATE FUNCTION valorTotalVendasPorMarca(marca_param VARCHAR(10000))
RETURNS DECIMAL(50,2) -- Define que o retorno será do tipo DECIMAL com até 50 dígitos e 2 casas decimais.
-- -- Indica que a função vai apenas ler dados do banco, ou seja, não fará nenhuma alteração.
READS SQL DATA
BEGIN
-- -- Declara uma variável local chamada 'total', que armazenará o valor total calculado.
    DECLARE total DECIMAL(50,2);
-- Faz uma consulta na tabela 'carros', multiplicando o valor do carro pelo número de vendas
-- e somando o resultado para a marca fornecida no parâmetro 'marca_param'.
-- O resultado da soma total é armazenado na variável 'total'.
    SELECT SUM(valor * numero_Vendas) INTO total
    FROM carros
    WHERE marca = marca_param;
-- Retorna o valor armazenado em 'total', que é o total das vendas calculadas.
    RETURN total;
END$$

DELIMITER ;

-- Faz uma consulta chamando a função criada com o parâmetro 'Fiat' 
-- e exibe o total das vendas dessa marca com o alias 'total_vendas'.
SELECT valorTotalVendasPorMarca('Fiat') AS total_vendas;


-- Contar o Número de Carros por Modelo
DELIMITER $$

CREATE FUNCTION contarCarrosPorModelo(modelo_param VARCHAR(100))
RETURNS INT 
READS SQL DATA

BEGIN
    DECLARE contagem INT;  -- Declara uma variável local chamada 'contagem', que armazenará o resultado da contagem dos carros.
 -- Faz uma consulta na tabela 'carros', contando quantos registros existem onde o modelo do carro
    -- corresponde ao valor do parâmetro 'modelo_param'. O resultado é armazenado na variável 'contagem'.   
    SELECT COUNT(*) INTO contagem
    FROM carros
    WHERE modelo = modelo_param;
    
    RETURN contagem;
END$$

DELIMITER ;
-- Faz uma consulta chamando a função 'contarCarrosPorModelo' com o parâmetro 'Mobi' 
-- e exibe o resultado da contagem de carros desse modelo, com o alias 'quantidade'.
SELECT contarCarrosPorModelo('Mobi') AS quantidade;


-- Nome do proprietario 

DELIMITER $$

CREATE FUNCTION nomeProprietario(id_carro_param INT)
RETURNS VARCHAR(100)
READS SQL DATA

BEGIN
    DECLARE nome_proprietario VARCHAR(100);
-- Faz uma consulta na tabela 'proprietario', buscando o nome do proprietário que tenha o 'id'
    -- igual ao valor do parâmetro 'id_carro_param'. O nome encontrado será armazenado na variável 'nome_proprietario'.    
    SELECT nome INTO nome_proprietario
    FROM proprietario
    WHERE id = id_carro_param;
    
    RETURN nome_proprietario;
END$$

DELIMITER ;
-- Faz uma consulta chamando a função 'nomeProprietario' com o parâmetro 3 (id do carro) 
-- e exibe o nome do proprietário com o alias 'nome_proprietario'.
SELECT nomeProprietario(3) AS nome_proprietario;

