use Empresa

SELECT * FROM Clientes

SELECT * FROM Funcionarios

SELECT * FROM Fornecedores

SELECT * FROM Produtos

SELECT * FROM Categorias

SELECT * FROM Pedidos

SELECT * FROM DetalhesPed

-- WHERE

SELECT * FROM Clientes
WHERE Pais = 'méxico'

SELECT * FROM Clientes
WHERE Pais IN ('canadá', 'brasil')

SELECT * FROM Produtos
WHERE Preco = 18 OR Preco = 22

SELECT * FROM Produtos
WHERE Preco = 18 AND Preco = 22

SELECT * FROM Produtos
WHERE Preco BETWEEN 18 AND 22

-- DISTINCT

SELECT DISTINCT Pais
FROM Clientes

-- LIKE

SELECT * FROM Clientes
WHERE Nome LIKE 'an%'

SELECT * FROM Clientes
WHERE Nome LIKE '%a'

SELECT * FROM Clientes
WHERE Nome LIKE '%fa%'

SELECT * FROM Clientes
WHERE Nome LIKE '_c%'

SELECT * FROM Clientes
WHERE Nome LIKE 'c__t%'

-- ORDER BY

SELECT * FROM Pedidos
ORDER BY DataPed DESC

-- TOP

SELECT TOP 3 * FROM Funcionarios
ORDER BY Salario DESC

-- EXERCÍCIO 1 -- Qual é o Nome e Salario do funcionário do Reino Unido com o maior salário

-- EXERCÍCIO 2 -- Quais são os cargos distintos dos nossos funcionarios?

-- EXERCÍCIO 3 -- Qual é a descrição e preco dos produtos com preço de 20,00 até 50,00 que não foram descontinuados ?

-- EXERCÍCIO 4 -- Qual é a Empresa da tabela Fornecedores cujo nome começa com a letra E e termina com a letra S?
