-- CRIAR BASE DE DADOS 
CREATE DATABASE CarrosBD;

-- ACESSAR A BASE DE DADOS QUE SERÁ USADA 
USE CarrosBD;

-- DELETAR A BASE DE DADOS
drop database CarrosBD

-- CRIAR TABELAS 
CREATE TABLE carros(
id int(10) not null,
marca VARCHAR(100),
modelo VARCHAR(100),
ano integer,
valor DECIMAL(10,2),
cor VARCHAR(100),
numero_Vendas int(10),
PRIMARY KEY (id)
)

CREATE TABLE proprietario(
id int(10) not null,
nome VARCHAR(100),
id_carro int(10) not null,
PRIMARY KEY (id),
FOREIGN KEY (id_carro) REFERENCES Teste(id)
)


CREATE TABLE historico_preco(
id int(10) not null auto_increment primary key,
data_modificacao datetime,
id_carro int not null,
valor_anterior float,
valor_novo float
)


ALTER TABLE tb_proprietario ADD idade INT(3) NOT NULL;
ALTER TABLE tb_proprietario DROP COLUMN idade;


SELECT * FROM carros
