-- 🏢 Define o banco de dados a ser utilizado
USE Empresa;

-- 📋 Visualiza todos os registros da tabela Pedidos
SELECT * FROM Pedidos;

-- 📋 Visualiza todos os registros da tabela DetalhesPed (detalhes dos pedidos)
SELECT * FROM DetalhesPed;

-- 🔗 INNER JOIN (junção interna)
-- Traz apenas os registros que têm correspondência nas duas tabelas.
-- Neste exemplo, estamos juntando as tabelas Pedidos e DetalhesPed com base na coluna NumPed (número do pedido).

SELECT *
FROM Pedidos p                -- Tabela da ESQUERDA (a que aparece primeiro)
INNER JOIN DetalhesPed d      -- Tabela da DIREITA (a que vem depois do JOIN)
    ON p.NumPed = d.NumPed    -- Condição de junção (campo comum)
							  -- o p logo após Pedidos é um apelido dado a tabela Pedidos, esta técnica é utilizada para deixar a consulta mais legível, a partir do momento que eu defino um apelido, este passa a ser o nome da coluna.				
							  
-- 🧠 Explicação:
-- Apenas os pedidos que possuem pelo menos um detalhe na tabela DetalhesPed aparecerão no resultado.
-- Se houver um pedido na tabela Pedidos sem correspondência em DetalhesPed, ele será ignorado.

-- 🔎 Exemplo prático:
-- Imagine que o pedido 101 está na tabela Pedidos, mas não tem nenhum detalhe na DetalhesPed.
-- Com INNER JOIN, o pedido 101 **não aparecerá** no resultado.

SELECT p.NumPed, p.CodCli, d.CodProd, d.Preco -- Retorna colunas específicas de cada tabela, perceba que para referenciar a tabela da qual a coluna faz parte, se utiliza a seguinte estrutura: NomeDaTabela.NomeDaColuna, no caso usamos ApelidoDaTabela.NomeDaColuna
FROM Pedidos p
INNER JOIN DetalhesPed d ON p.NumPed = d.NumPed
WHERE d.Preco > 50 

----------------------------------------------------------------------------------------

-- 🔗 LEFT JOIN (junção externa à esquerda)
-- Traz todos os registros da TABELA DA ESQUERDA (Pedidos), com ou sem correspondência na tabela da direita (DetalhesPed).
-- Se não houver correspondência, os campos da tabela da direita virão como NULL.

SELECT * 
FROM Pedidos p                -- Tabela da ESQUERDA
LEFT JOIN DetalhesPed d       -- Tabela da DIREITA
    ON p.NumPed = d.NumPed    -- Condição de junção

-- 🧠 Explicação:
-- Todos os pedidos da tabela Pedidos aparecerão no resultado.
-- Se algum pedido **não tiver detalhes**, os campos correspondentes da tabela DetalhesPed aparecerão como NULL.

-- 🔎 Exemplo prático:
-- Se o pedido 101 está na tabela Pedidos, mas não tem detalhes na DetalhesPed:
-- → O pedido 101 aparecerá com os campos da DetalhesPed em branco (NULL).

-- 💡 Dica importante:
-- "Tabela da esquerda" = a tabela que vem antes do JOIN.
-- "Tabela da direita" = a tabela que vem depois do JOIN.
-- Isso é importante porque no LEFT JOIN a prioridade é para manter **todos os registros da tabela da esquerda**.

-- Exercícios

-- 1 - Retorne o Nome e País do cliente, o NumPed e o DataPed do pedido que ele fez

-- 2 - Quantos pedidos foram feitos para cada país da tabela clientes? (Dica: Utilize a agregação correta (COUNT(), SUM(), AVG(), MIN(), MAX()) e GROUP BY).

-- 3 - Retorne todos os dados dos clientes que não fizeram nenhum pedido (Dica: Utilize WHERE para retornar os clientes onde o CodCli da tabela Pedidos IS NULL)
