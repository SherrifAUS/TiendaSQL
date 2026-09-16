# Entrega SQL: Esquema de Retail (`retail_project`)

Repositorio monofile con la definición relacional, restricciones de integridad y poblamiento transaccional para la base de datos del proyecto.

## Inventario del script (`Ejercicio_Tienda.sql`)
- **Esquema relacional (DDL)**: Generación secuencial de `clientes`, `productos` y post-creación de `ventas` para asegurar la resolución de las FKs.
- **Blindaje de datos**: Primary keys autoincrementales (`SERIAL`), unicidad de contacto (`UNIQUE`) y acotamiento de dominios (`CHECK` en rangos, valores monetarios positivos y control de inventario).
- **Inyección inicial (DML)**: Lote atómico (`BEGIN` / `COMMIT`) con lote de 5 entidades mínimas por tabla.
- **Evolución y mantenimiento**: Modificación focalizada de valoración de catálogo (`UPDATE` con filtro de categoría) y depuración de datos (`DELETE` acotado por ID).
  
## Cómo ejecutarlo
1. Crear la base: `create database retail_project;`
2. Conectarse a esa base y ejecutar todo el contenido de `Ejercicio_Tienda.sql`.
