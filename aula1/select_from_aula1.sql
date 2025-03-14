/* Nas consultas em Banco de Dados usamos letras maíusculas para palavras
reservadas da linguaguem (SELECT, FROM, WHERE, ETC...), assim, a declaração pode ser visualizada mais facilmente */


SELECT * FROM Clientes  -- Seleciona todas as colunas e linhas da tabela Clientes
SELECT * FROM Pedidos -- Seleciona todas as colunas e linhas da tabela Pedidos

SELECT Nome, Cargo, Endereco FROM Clientes -- Seleciona as colunas Nome, Cargo e Endereco da tabela Clientes

SELECT NumPed, Frete FROM Pedidos -- Seleciona as colunas NumPed e Frete da tabela Pedidos

SELECT Nome, Pais FROM Clientes
WHERE Pais = 'Brasil' -- Seleciona as colunas Nome, Pais da tabela Clientes onde a coluna Pais for igual a Brasil

-- Exercício 1: Selecione Nome, Endereco, Cidade e Pais dos clientes do Canadá.

-- Exercício 2: Selecione todos os dados do pedido de NumPed igual a 10520.

-- Exercício 3: Crie uma consulta da sua escolha utilizando uma das duas tabelas apresentadas.
