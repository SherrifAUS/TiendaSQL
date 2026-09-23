
-- Consulta 1: Rentabilidad por categoría
select 
cat.descripcion,
sum(v.cantidad) as Unidades_Vendidas,
sum(v.cantidad * p.precio) as Ingreso_Total
from ventas as v
inner join productos as p on v.idProducto = p.idProducto
inner join categorias as cat on p.idCategoria = cat.idCategoria
group by cat.descripcion
having sum(v.cantidad * p.precio) > 250.00
order by Ingreso_Total desc;

--Consulta 2: Clientes sin compras -usando LEFT JOIN

--Consulta 3: Top de compras por cliente
