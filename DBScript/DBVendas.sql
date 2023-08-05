CREATE DATABASE IF NOT EXISTS DBVendas;

CREATE TABLE IF NOT EXISTS CLIENTE(
	cdCliente		INT NOT NULL AUTO_INCREMENT,
	dsNome         VARCHAR(50) NOT NULL,
	dsCidade       VARCHAR(30),
	sgUF           CHAR(2),
	CONSTRAINT PK_CLIENTE PRIMARY KEY(cdCliente)
);

CREATE INDEX IDX_CLIENTE_NOME ON CLIENTE(dsNome);

INSERT INTO CLIENTE(dsNome, dsCidade, sgUF)
     VALUES ('Alessandro Avelino','Fortaleza','CE')
           ,('Marta Maria','Fortaleza','CE')
           ,('José da Silva','São Paulo','SP')
           ,('Maurio','São Paulo','SP')
           ,('Pedro','Rio de Janeiro','RJ')
           ,('Maria da Silva','Porto Alegre','RS')           
           ,('Marcos','Fortaleza','CE')
           ,('Elizabete','São Paulo','SP')
           ,('Fernando Silva','São Paulo','SP')
           ,('Carlos Augusto','Rio de Janeiro','RJ')
           ,('Cleomar pereira','Porto Alegre','RS')           
           ,('Francisca','Fortaleza','CE')
           ,('José de Abreu','São Paulo','SP')
           ,('Marcelo','São Paulo','SP')
           ,('Pedro Paulo','Rio de Janeiro','RJ')
           ,('Maria Elisabete','Porto Alegre','RS')           
           ,('Conceição','Fortaleza','CE')
           ,('José Alexandre','São Paulo','SP')
           ,('Emanoel Carlos','São Paulo','SP')
           ,('Pedro Antonio','Rio de Janeiro','RJ')
           ,('Andre da Silva','Porto Alegre','RS')
           ,('Josefa Maria','Fortaleza','CE')
           ,('José Carlos de Augusto','São Paulo','SP')
           ,('Francisco das Chagas','São Paulo','SP')
           ,('Guilherme','Rio de Janeiro','RJ')
           ,('Carlos Albuquerque','Porto Alegre','RS');           
                              
           
CREATE TABLE IF NOT EXISTS PRODUTO(
	cdProduto		INT NOT NULL AUTO_INCREMENT,
	dsNome         VARCHAR(50) NOT NULL,
	vlPreco        NUMERIC(12,2) DEFAULT 0,
	CONSTRAINT PK_PRODUTO PRIMARY KEY(cdProduto)
);

CREATE INDEX IDX_PRODUTO_NOME ON PRODUTO(dsNome);

INSERT INTO PRODUTO(dsNome, vlPreco)
             VALUES('FEIJÃO PRETO', 5.45)
                  ,('ARROZ AGULHINA', 4.15)
                  ,('MACACHEIRA KG', 1.5)
                  ,('ABACATE PEROLA', 1.11)
                  ,('FARINHA DE ROSCA', 3.27)
                  ,('MAMAO PAPAIA', 1.65)                  
                  ,('ARROZ PARBOIRIZADO', 3.27)
                  ,('MANGA COITE KG', 7.5)
                  ,('ROMATE', 5.10)
                  ,('BATATA INGLESA', 4.57)
                  ,('PEPIMO', 1.00)
                  ,('ABOBORA', 3.75)
                  ,('BATATA INGLESA KG', 7.85)
                  ,('OLEO LT', 11.50)
                  ,('VINAGRE', 3.47)
                  ,('TEMPERO ARISCO', 2.25)
                  ,('SAL GROSSO', 1.50)
                  ,('MACARRAO PCT', 6.5)
                  ,('AÇUCAR CRISTAL', 4.50)
                  ,('FARINHA DE TRIGO DONA BENTA', 7.00)
                  ,('FEIJÃO CARIOQUINHA', 8.50);
                                    
CREATE TABLE IF NOT EXISTS VENDA(
	cdVenda		INT NOT NULL AUTO_INCREMENT,
	cdCliente	     INT NOT NULL,
	dtEmissao      DATE,	
	vltotal        DECIMAL(12,2) DEFAULT 0,	
	CONSTRAINT PK_VENDA         PRIMARY KEY(cdVenda),
	CONSTRAINT FK_VENDA_CLIENTE FOREIGN KEY(cdCliente) REFERENCES CLIENTE(cdCliente)
);

CREATE INDEX IDX_VENDA_EMISSAO ON VENDA(dtEmissao);
CREATE INDEX IDX_VENDA_CLIENTE ON VENDA(cdCliente);

CREATE TABLE IF NOT EXISTS VENDA_ITEM(
	cdVendaItem	INT NOT NULL AUTO_INCREMENT,
	cdVenda        INT NOT NULL,
	cdProduto      INT NOT NULL,
	nmQuantidade   DECIMAL(15,3) NOT NULL,
	vlUnitario     DECIMAL(12,2) NOT NULL,
	vltotal        DECIMAL(12,2) DEFAULT 0,	
	CONSTRAINT PK_VENDA_ITEM         PRIMARY KEY(cdVendaItem),
	CONSTRAINT FK_VENDA_ITEM_VENDA   FOREIGN KEY(cdVenda)     REFERENCES VENDA(cdVenda) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT FK_VENDA_ITEM_PRODUTO FOREIGN KEY(cdProduto)   REFERENCES PRODUTO(cdProduto)
);

CREATE INDEX IDX_VENDA_ITEM_PRODUTO ON VENDA_ITEM(cdProduto);
CREATE INDEX IDX_VENDA_ITEM_VENDA ON VENDA_ITEM(cdVenda);
                  
SELECT * FROM CLIENTE;

SELECT * FROM PRODUTO;

SELECT * FROM venda

SELECT * FROM VENDA_ITEM

INSERT INTO venda(cdcliente, dtemissao) VALUES (1, '2023-10-10')
