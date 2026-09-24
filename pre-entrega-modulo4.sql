/*
Consulta 1: Rentabilidad por categoría

Problema: Analizar el rendimiento de cada categoría de productos, teniendo en cuenta tanto las ventas como los ingresos, 
para decidir en cuáles conviene enfocar las inversiones en inventario y marketing.
Justificación del umbral: Se consideran únicamente las categorías que generan más de $250, 
ya que de esta manera se dejan de lado aquellas con pocas ventas o que tienen una participación poco significativa en los ingresos.
*/
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


/*
Consulta 2: Clientes sin compras -usando LEFT JOIN

Problema: Identificar a los usuarios que están registrados pero todavía no realizaron ninguna compra, 
para poder ofrecerles campañas de bienvenida o cupones para su primera compra.
Método utilizado: Se utiliza un `LEFT JOIN` para incluir a todos los usuarios registrados y, 
mediante `IS NULL`, identificar aquellos que no tienen ninguna venta asociada.
*/
select
cl.idCliente,
cl.nombreCliente
from clientes cl
left join ventas as v on cl.idcliente = v.idcliente
where v.idventa is null;


/*
Consulta 3: Top de compras por cliente

Problema: Identificar cuál es el producto que más compra cada cliente habitual y conocer la fecha de su última compra, 
para poder hacer un mejor seguimiento y desarrollar estrategias de fidelización.
*/
select 
cl.nombreCliente,
p.descripcion,
count(*) as cantidad_compras,
max(v.fechaventa) as maxima_fecha
from ventas as v
inner join clientes cl on v.idcliente = cl.idcliente
inner join productos p on v.idproducto = p.idproducto
group by cl.nombreCliente, p.descripcion
order by cl.nombreCliente, cantidad_compras desc;
