-- Seleciona o banco de dados 'Empresa'
USE Empresa

-- Visualiza todos os registros da tabela Clientes
SELECT * FROM Clientes

-- Visualiza todos os registros da tabela Produtos
SELECT * FROM Produtos

-- Visualiza todos os registros da tabela Fornecedores
SELECT * FROM Fornecedores

-- ========================
-- FUNÇÃO COUNT (Contagem)
-- ========================

-- Conta o número total de registros na tabela Clientes
SELECT COUNT(*) AS total_linhas FROM Clientes;

-- Conta quantos clientes são da Alemanha
SELECT COUNT(*) AS qt_clientes_franca FROM Clientes
WHERE Pais = 'Alemanha';

-- ======================
-- FUNÇÃO SUM (Soma)
-- ======================

-- Soma o valor de todos os produtos (somente o preço unitário)
SELECT SUM(Preco) AS total_valor_produtos FROM Produtos;

-- Calcula o faturamento total (preço * unidades disponíveis)
SELECT SUM(Preco * Unidades) AS faturamento_total FROM Produtos;

-- ======================
-- FUNÇÃO AVG (Média)
-- ======================

-- Calcula o preço médio dos produtos
SELECT AVG(Preco) AS preco_medio FROM Produtos;

-- ===========================
-- FUNÇÃO MIN (Valor mínimo)
-- ===========================

-- Encontra o menor preço entre os produtos
SELECT MIN(Preco) AS menor_preco FROM Produtos;

-- Encontra o primeiro nome em ordem alfabética dos clientes
SELECT MIN(Nome) AS primeiro_nome FROM Clientes;

-- ===========================
-- FUNÇÃO MAX (Valor máximo)
-- ===========================

-- Encontra o maior preço entre os produtos
SELECT MAX(Preco) AS maior_preco FROM Produtos;

-- Encontra o último nome em ordem alfabética dos clientes
SELECT MAX(Nome) AS ultimo_nome FROM Clientes;

-- =======================
-- GROUP BY (Agrupamento)
-- =======================

-- Conta a quantidade de clientes por país
SELECT Pais, COUNT(*) AS qt_clientes
FROM Clientes
GROUP BY Pais;

-- Conta a quantidade de clientes por país e cidade
SELECT Pais, Cidade, COUNT(*)
FROM Clientes
GROUP BY Pais, Cidade;

-- Soma o faturamento por descrição do produto
SELECT Descr, SUM(Preco * Unidades) AS faturamento_produto
FROM Produtos
GROUP BY Descr;

-- Soma o faturamento agrupando por descrição e categoria do produto
SELECT Descr, CodCategoria, SUM(Preco * Unidades)
FROM Produtos
GROUP BY Descr, CodCategoria;

-- Conta quantos clientes são da França
SELECT COUNT(*)
FROM Clientes
WHERE Pais = 'França';

-- ========================
-- EXERCÍCIOS PROPOSTOS
-- ========================

-- 1. Quantos fornecedores nós temos em cada país?

SELECT Pais, COUNT(*) AS qtd_funcionarios FROM Fornecedores
GROUP BY Pais

-- 2. Qual foi o frete médio que cada cliente teve que pagar pelos seus pedidos?

SELECT CodCli, AVG(Frete) AS frete_medio FROM Pedidos
GROUP BY CodCli
