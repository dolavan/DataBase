/*
 Requisitos:
 Sistema NT
Cadastro:

*Cliente, Vendas e Remedio:

*Dados clientes:
-CPF Cliente(codigo)
-Nome(texto)
-nascimento(Data dd/mm/aaaa)
-sexo(numero)
-endereço rua cidade estado
-Telefones

*dados Remedio:
-Codigo Servico(codigo)
-Nome servivo(texto)
-Valor do servico(numero)

*Vendas:
-codigo da venda 
-codigo do remedio
-valor do remedio
*/

-- Criando novo banco de dados
CREATE DATABASE dbsistemaNT;
--Criando Tabela com dados dos Clientes
CREATE TABLE tb_Clientes (
     cpfCliente INT PRIMARY KEY NOT NULL,
     nomeCliente VARCHAR(50) NOT NULL, --Campo Obrigatorio
	 nascCliente DATE, --Não obrigatorio
	 sexoCliente VARCHAR(1),
	 endçCliente VARCHAR(50),
	 cidaCliente VARCHAR(50),
	 estdCliente VARCHAR(50),
	 tellCliente VARCHAR(20)

);
INSERT INTO tb_Clientes (cpfCliente, nomeCliente, sexoCliente, nascCliente, endçCliente, cidaCliente, estdCliente, tellCliente) VALUES ('000.000.000-00', 'Dolavan Gomes Silva', 'M', '02/11/1997', 'santa rita', 'São Paulo', 'SP', '(11)95876-0000');
--Criando tabela Remedios = Produtos
CREATE TABLE tb_Remedio (
     cdRemedio INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	 nmRemedio VARCHAR(50) NOT NULL,
	 vlRemedio DECIMAL(6,2) NOT NULL
);
INSERT INTO [tb_Remedio] VALUES('Dipirona', 6.75);
CREATE TABLE tb_Vendas (--Tabela
     cdVendas INT PRIMARY KEY IDENTITY(1,1) NOT NULL,--Coluna
	 cdRemedio INT NOT NULL,
	 vlRemedio DECIMAL(6,2) NOT NULL
);
--SELECT coluna FROM tabela; Para visualisar as colunas de uma tabela.
--SELECT*FOM tabela_desejada; para visualisar todas as colunas da tabela.
SELECT cdRemedio, cdVendas, vlRemedio FROM tb_Vendas;

--FOREIGN KEY - Chave estrageira
--CONSTRAINT- Ultilizamos para adicionar uma regra 
ALTER TABLE tb_Vendas --coloco a tabela que quero alterar
ADD CONSTRAINT FK_Remedio_Vendas --com isso dou o nome da minha chave estrangeira, o dado sai da tabela Remedio e vai pra  tabela Venda
FOREIGN KEY (cdRemedio)--com isso coloco qual coluna da minha tabela e a chave estrangeira
REFERENCES tb_Remedio (cdRemedio)--com isso coloco a referencia da tabela e a coluna que estou tratando

--INSERT INTO [nome da tabela] VALUES (valor coluna);'TEXTO', NUMERO NAO PRECISA DE ASPAS SIMPLES POIS NAO E UMA STRING
--INSERT INTO [nome da tabela] ([COLUNAS]) VALUES (valor coluna); SELECIONA A ORDEM QUE DESEJA ATRIBUIR OS VALORES AS COLUNAS AS TABELA
--INSERT INTO [nome da tabela] (COLUNAS) VALUES (valor coluna);inserindo valores com os nomes das colunas

--DROP TABLE tb_Desejada = Comando para remover  tabela 

CREATE TABLE tb_Vendas (
     cdVenda INT PRIMARY KEY IDENTITY(1,1) NOT NULL,--chave primaria a indentidade nao pode ser repetida
     cpfCliente VARCHAR(14) NOT NULL FOREIGN KEY REFERENCES tb_Clientes (cpfCliente),-- chave primariria estrangeira com a referencia de onde veio
	 dtVenda DATETIME NOT NULL
);

CREATE TABLE tb_RemedioVenda (
     cdProdutoVenda INT PRIMARY KEY IDENTITY(1,1), 
     cdVenda INT NOT NULL FOREIGN KEY REFERENCES tb_Vendas (cdVenda),
     cdRemedio INT NOT NULL FOREIGN KEY REFERENCES tb_Remedio (cdRemedio),
	 qtRemedio INT NOT NULL
);

SELECT*FROM tb_Clientes;

SELECT*FROM tb_Remedio;

