-- CTE 1: Agrupación y suma de ventas por mes y categoría
with ventas_mensuales as (
select 
date_trunc('month', v.fechaventa) as mes,
c.descripcion as categoria,
sum(v.total) as venta_Total
from ventas v
inner join productos p on v.idproducto = p.idproducto
inner join categorias c on p.idcategoria = c.idcategoria
group by 
date_trunc('month', v.fechaventa), 
c.descripcion
),
-- CTE 2: Métricas avanzadas con Window Functions (Ranking, Running Total y Promedio)
metricas_ventana as (
select
mes,
categoria,
venta_Total,

--Ranking por  mes entre categoria
dense_rank() over (partition by mes order by venta_Total desc) as ranking,

--Running Total o Acumulado Historico por categoria
sum(venta_Total) over (partition by categoria order by mes asc) as running_Total,

--Promedio histórico mensual de la categoría
avg(venta_Total) over (partition by categoria) as promedio_Categoria

from ventas_mensuales
)

-- Query: Formato de fecha, evaluación condicional y ordenamiento
select 
date(mes) as mes, --Alternativa con to_char(mes, 'YYYY-MM') as mes
categoria,
venta_Total,
ranking,
running_Total,
case
	when venta_Total >= promedio_Categoria then 'Exitoso'
	else 'Bajo el promedio'
end as resultado
from metricas_ventana
order by mes asc, ranking asc;