-- -----------------------------------------------------------------------------
-- Consulta 1: Rentabilidad por categoría
-- Objetivo de negocio: Analizar el volumen de unidades vendidas y los ingresos 
-- totales por categoría para enfocar el presupuesto en las líneas más rentables.
-- Se define un umbral de $250 para excluir categorías de baja rotación.
-- -----------------------------------------------------------------------------
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
