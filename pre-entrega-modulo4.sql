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
select
cl.idCliente,
cl.nombreCliente
from clientes cl
left join ventas as v on cl.idcliente = v.idcliente
where v.idventa is null;

--Consulta 3: Top de compras por cliente
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
