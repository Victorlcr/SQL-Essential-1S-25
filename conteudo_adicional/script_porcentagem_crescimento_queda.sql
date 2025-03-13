use Empresa

-- 1

WITH total_vendas_mes AS (
    SELECT YEAR(DataPed) AS ano, MONTH(DataPed) AS mes, SUM(1) AS total_mes
    FROM Pedidos p
    JOIN DetalhesPed dp ON p.NumPed = dp.NumPed
    JOIN Produtos pd ON dp.CodProd = pd.CodProd
	WHERE YEAR (DataPed) = 1997
    GROUP BY YEAR(DataPed), MONTH(DataPed)
)
SELECT 
	ano,
    mes, 
    total_mes,
	SUM(total_mes) OVER (PARTITION BY ano) AS total_ano
FROM total_vendas_mes
GROUP BY ano, mes, total_mes
ORDER BY mes

-- 2

WITH total_pedidos_mes AS (
    SELECT 
		YEAR(DataPed) AS ano, 
		MONTH(DataPed) AS mes, 
		SUM(1) AS qt_pedidos_mes
    FROM Pedidos p
    JOIN DetalhesPed dp ON p.NumPed = dp.NumPed
    JOIN Produtos pd ON dp.CodProd = pd.CodProd
	WHERE YEAR(DataPed) = 1997
    GROUP BY YEAR(DataPed), MONTH(DataPed)
)
SELECT 
	ano,
    mes, 
    qt_pedidos_mes,
    COALESCE(LEAD(qt_pedidos_mes) OVER (ORDER BY mes),0) AS qt_pedidos_prox_mes,
    COALESCE(ROUND(((LEAD(qt_pedidos_mes) OVER (ORDER BY mes) - qt_pedidos_mes) * 100.0) / qt_pedidos_mes, 2), 0) AS variacao_percentual,
	CASE 
		WHEN ROUND(((LEAD(qt_pedidos_mes) OVER (ORDER BY mes) - qt_pedidos_mes) * 100.0) / qt_pedidos_mes, 2) < 0 THEN 'queda'
		ELSE 'crescimento'
	END AS resultado
FROM total_pedidos_mes

-- 3

SELECT * FROM Pedidos
SELECT * FROM DetalhesPed

WITH total_vendas_mes AS (
    SELECT 
		YEAR(DataPed) AS ano, 
		MONTH(DataPed) AS mes, 
		SUM(1) AS total_mes,
		ROUND(SUM((dp.preco * dp.qtde) + dp.desconto + p.frete), 2) AS receita_mes
    FROM Pedidos p
    JOIN DetalhesPed dp ON p.NumPed = dp.NumPed
    JOIN Produtos pd ON dp.CodProd = pd.CodProd
	WHERE YEAR(DataPed) = 1996
    GROUP BY YEAR(DataPed), MONTH(DataPed)
	ORDER BY receita_mes DESC
)

SELECT * FROM Pedidos

SELECT * FROM DetalhesPed

SELECT * FROM Produtos

SELECT p.Descr, 
	   p.Preco, 
	   COUNT(pd.NumPed) AS qtd_vendida, 
	   p.Preco * COUNT(pd.NumPed) AS receita, 
	   YEAR(DataPed) AS ano, 
	   SUM(SUM(p.Preco * d.Qtde)) OVER (PARTITION BY YEAR(DataPed)) AS faturamento_total
FROM Produtos p
JOIN DetalhesPed d ON p.CodProd = d.CodProd
JOIN Pedidos pd ON d.NumPed = pd.NumPed
WHERE YEAR(DataPed) = 1996
GROUP BY p.Descr, p.Preco, YEAR(DataPed)
ORDER BY qtd_vendida DESC




