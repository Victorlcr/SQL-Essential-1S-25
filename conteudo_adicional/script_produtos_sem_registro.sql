SELECT * FROM Clientes

SELECT * FROM Pedidos

SELECT * FROM Detalhesped
WHERE numped

WITH sumario_pedidos AS (

	SELECT c.pais, 
		COUNT(DISTINCT p.numped) AS qt_pedidos, SUM(d.preco * qtde) AS receita_vendas, 'geral' as registro
	FROM Clientes c
	JOIN Pedidos p ON c.codcli = p.codcli
	LEFT JOIN Detalhesped d ON p.numped = d.numped
	GROUP BY c.pais
	
	UNION
	
	SELECT c.pais, 
		COUNT(DISTINCT p.numped) AS qt_pedidos, SUM(d.preco * qtde) AS receita_vendas, 'sim' AS registro
	FROM Clientes c
	JOIN Pedidos p ON c.codcli = p.codcli
	LEFT JOIN Detalhesped d ON p.numped = d.numped
	WHERE d.numped IS NOT NULL
	GROUP BY c.pais
	
	ORDER BY receita_vendas DESC

)

SELECT DISTINCT pais, 
				qt_pedidos, 
				receita_vendas, 
				registro,
				CASE 
					WHEN COALESCE(qt_pedidos - LEAD(qt_pedidos) OVER (PARTITION BY pais), 0) < 0
					THEN COALESCE(qt_pedidos - LEAD(qt_pedidos) OVER (PARTITION BY pais), 0) * -1
					ELSE COALESCE(qt_pedidos - LEAD(qt_pedidos) OVER (PARTITION BY pais), 0)
				END AS pedidos_sem_registro
FROM sumario_pedidos
ORDER BY receita_vendas DESC;






SELECT c.pais, p.*, COUNT(p.*) FROM Pedidos p
JOIN Clientes c ON p.codcli = c.codcli
WHERE c.pais = 'Noruega'
GROUP BY c.pais, p.*, p.numped

SELECT * FROM Pedidos p
LEFT JOIN Detalhesped d ON p.numped = d.numped
WHERE d.numped IS NULL

SELECT * FROM Pedidos p
JOIN Detalhesped d ON p.numped = d.numped

SELECT p.numped, d.numped
FROM Pedidos p
LEFT JOIN Detalhesped d ON p.numped = d.numped
WHERE d.numped IS null

SELECT * FROM pedidos
WHERE numped = 10868


SELECT DISTINCT numped FROM Detalhesped
WHERE numped IN (10387, 10520, 10639, 10831, 10909, 11015)
