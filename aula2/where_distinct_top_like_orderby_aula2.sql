-- SELECIONANDO O BANCO DE DADOS
USE Empresa; -- Define o banco de dados "Empresa" para ser utilizado nas consultas.

-- Hierarquia de comandos (Em uma consulta,  apresentados neste arquivo precisam ser escritos seguindo a ordem abaixo, quando necessário. Essa hierarquia é padrão do SQL, não é definida pelo usuário.)

-- 1- SELECT FROM
-- 2- WHERE
-- 3- ORDER BY

-- Exemplo:

-- SELECT Coluna1 FROM Tabela
-- WHERE Coluna2 = Valor
-- ORDER BY Coluna2

-- VISUALIZANDO AS TABELAS
SELECT * FROM Clientes;      -- Exibe todos os registros da tabela Clientes.
SELECT * FROM Funcionarios;  -- Exibe todos os registros da tabela Funcionarios.
SELECT * FROM Fornecedores;  -- Exibe todos os registros da tabela Fornecedores.
SELECT * FROM Produtos;      -- Exibe todos os registros da tabela Produtos.

-- FILTRANDO DADOS COM WHERE

-- O operador = (igual) verifica se um valor é exatamente igual ao especificado.
-- Neste caso, seleciona todos os clientes cujo país é "México".
SELECT * FROM Clientes
WHERE Pais = 'México';

-- O operador != (diferente) ou <> retorna todos os registros cujo valor da coluna não seja o especificado.
-- Neste caso, seleciona todos os clientes que NÃO são da Alemanha.
SELECT * FROM Clientes
WHERE Pais != 'Alemanha';

-- O operador IN verifica se um valor está dentro de uma lista de valores.
-- Neste caso, seleciona clientes do Canadá OU do Brasil.
SELECT * FROM Clientes
WHERE Pais IN ('Canadá', 'Brasil');

-- O operador OR significa "OU".
-- Neste caso, seleciona produtos cujo preço seja 18 OU 22.
SELECT * FROM Produtos
WHERE Preco = 18 OR Preco = 22;

-- O operador > (maior que) retorna registros cujo valor da coluna seja maior que o especificado.
-- Neste caso, seleciona produtos com preço maior que 30.
SELECT * FROM Produtos
WHERE Preco > 30;

-- O operador < (menor que) retorna registros cujo valor da coluna seja menor que o especificado.
-- Neste caso, seleciona produtos com preço menor que 30.
SELECT * FROM Produtos
WHERE Preco < 30;

-- O operador AND significa "E".
-- Neste caso, seleciona produtos que tenham preço menor que 20 E mais de 30 unidades no estoque.
SELECT * FROM Produtos
WHERE Preco < 20 AND Unidades > 30;

-- O operador BETWEEN verifica se um valor está dentro de um intervalo.
-- Neste caso, seleciona produtos cujo preço está entre 18 e 22 (inclusive).
SELECT * FROM Produtos
WHERE Preco BETWEEN 18 AND 22;

-- ELIMINANDO DUPLICATAS COM DISTINCT

-- O operador DISTINCT retorna apenas valores únicos, eliminando repetições.
-- Neste caso, retorna a lista de cargos distintos dos clientes.
SELECT DISTINCT Cargo FROM Funcionarios

-- Neste caso, retorna os registros de agrupamento distinto de cargos e países.
SELECT DISTINCT Cargo, Pais FROM Funcionarios

-- Neste caso, retorna as quantidades de unidades destintas.
SELECT DISTINCT Unidades
FROM Produtos -- IRÁ RETORNAR UM VALOR NULL TAMBÉM

-- BUSCAS FLEXÍVEIS COM LIKE

-- O operador LIKE permite realizar buscas com padrões específicos dentro de uma coluna de texto.
-- O caractere curinga % representa qualquer sequência de caracteres.
-- No SQL Server, 'b' é igual a 'B' e vice e versa.

-- Seleciona clientes cujo nome começa com "An".
SELECT * FROM Clientes
WHERE Nome LIKE 'A%';

-- Seleciona clientes cujo nome termina com "a".
SELECT * FROM Clientes
WHERE Nome LIKE '%a';

-- Seleciona clientes de um cep que começa com 054.
SELECT * FROM Clientes
WHERE Cep LIKE '054%';

-- Seleciona clientes cujo nome começa com "G" e termina com "a".
SELECT * FROM Clientes
WHERE Nome LIKE 'G%a';

-- Seleciona clientes cujo nome contém "fa" em qualquer posição.
SELECT * FROM Clientes
WHERE Nome LIKE '%fa%';

-- O caractere _ (underline) representa um único caractere qualquer.

-- Seleciona clientes cujo nome tem "a" como segundo caractere.
SELECT * FROM Clientes
WHERE Nome LIKE '_a%';

-- Seleciona clientes cujo nome começa com "C", tem "t" como quarto caractere, 
-- e pode ter qualquer outro caractere nos espaços restantes.
SELECT * FROM Clientes
WHERE Nome LIKE 'C__t%';

-- ORDENANDO RESULTADOS COM ORDER BY

-- O operador ORDER BY permite ordenar os resultados da consulta com base em uma coluna específica.

-- Ordena os produtos pela descrição em ordem crescente, neste caso, de A-Z
-- O SQL assume ASC (crescente) como padrão caso não seja especificado.
SELECT * FROM Produtos
ORDER BY Descr;

-- Ordena os produtos pelo preço em ordem decrescente (do maior para o menor).
SELECT * FROM Produtos
ORDER BY Preco DESC; -- DESC significa descrescente.

-- Ordena os pedidos pela data em ordem decrescente (do mais recente para o mais antigo).
SELECT * FROM Pedidos
ORDER BY DataPed DESC;

-- LIMITANDO RESULTADOS COM TOP

-- O operador TOP limita o número de registros retornados pela consulta.
-- Neste caso, retorna as 5 primeiras linhas da tabela Clientes
SELECT TOP 5 * FROM Clientes

-- Neste caso, retorna os 3 funcionários com os maiores salários.
SELECT TOP 3 * FROM Funcionarios
ORDER BY Salario DESC;

-- EXERCÍCIOS PARA PRÁTICA

-- 1. Qual é o Nome e o Salário do funcionário do Reino Unido com o maior salário?

-- 2. Quais são os cargos distintos dos nossos funcionários?

-- 3. Qual é a descrição e o preço dos produtos com preço entre 20,00 e 50,00 que NÃO foram descontinuados?
-- Dica: Na coluna Descontinuado da tabela Produtos, 0 (Falso) signifca não descontinuado e 1 (Verdadeiro) significa descontinuado. No SQL, as ,(vírgulas) dos valores monetários são substituidas por .(ponto)
