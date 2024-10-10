-- Ações a partir da própria aplicação, executando várias instruções SQL em sequência para obter o resultado esperado 

-- Tabela teste -> botão direito -> Alter Table -> Trigger -> After Update

-- *************************  Trigger para manter o histórico de preços de carros *********************************

-- CREATE DEFINER=`root`@`localhost` TRIGGER `tb_carros_AFTER_UPDATE` AFTER UPDATE ON `tb_carros` FOR EACH ROW BEGIN
-- IF NEW.valor <> OLD.valor THEN
-- INSERT INTO historico_preco values (null, NOW(), OLD.valor, NEW.valor, NEW.id);
-- END IF;
-- END

-- ************************* Trigger para impedir que um valor de carro seja menor que 1000 *********************************

-- CREATE DEFINER=`root`@`localhost` TRIGGER `tb_carros_BEFORE_UPDATE` BEFORE UPDATE ON `tb_carros` FOR EACH ROW BEGIN
 -- IF NEW.valor < 1000 THEN
   --     SIGNAL SQLSTATE '45000'
     --   SET MESSAGE_TEXT = 'O valor do carro não pode ser menor que 1000.';
       --     END IF;
-- END

-- *************************  Trigger para calcular a idade do proprietário no momento da inserção *********************************
-- ADICIONAR CAMPO IDADE NA TABELA PROPRIETARIO 

-- CREATE DEFINER=`root`@`localhost` TRIGGER `tb_proprietario_BEFORE_INSERT` BEFORE INSERT ON `tb_proprietario` FOR EACH ROW BEGIN
   -- SET NEW.idade = TIMESTAMPDIFF(YEAR, NEW.data_nascimento, CURDATE());
-- END

-- *************************  Trigger para bloquear a exclusão de um carro se houver proprietário  *********************************
-- CREATE DEFINER=`root`@`localhost` TRIGGER `tb_carros_BEFORE_DELETE` BEFORE DELETE ON `tb_carros` FOR EACH ROW BEGIN
-- IF (SELECT COUNT(*) FROM proprietario WHERE id_carro = OLD.id) > 0 THEN
  --      SIGNAL SQLSTATE '45000'
    --    SET MESSAGE_TEXT = 'Não é possível excluir um carro com proprietários associados.';
  --  END IF;
-- END



