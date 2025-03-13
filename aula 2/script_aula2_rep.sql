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
WHERE Pais = 'm�xico'

SELECT * FROM Clientes
WHERE Pais IN ('canad�', 'brasil')

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

-- EXERC�CIO 1 -- Qual � o Nome e Salario do funcion�rio do Reino Unido com o maior sal�rio

-- EXERC�CIO 2 -- Quais s�o os cargos distintos dos nossos funcionarios?

-- EXERC�CIO 3 -- Qual � a descri��o e preco dos produtos com pre�o de 20,00 at� 50,00 que n�o foram descontinuados ?

-- EXERC�CIO 4 -- Qual � a Empresa da tabela Fornecedores cujo nome come�a com a letra E e termina com a letra S?


