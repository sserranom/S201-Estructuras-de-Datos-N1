
-- Lista cuántos productos de categoría 'Bebidas' se han vendido en una determinada localidad.
use pizzeria;
SELECT
    c.name AS ciudad,
    l.name AS location,
    a.address AS direccion_sucursal,  -- Nueva columna para la dirección
    p.type AS tipo_producto,
    p.name AS nombre_producto,
    COUNT(od.id_product) AS cantidad_vendida
FROM
    order_details AS od
JOIN
    products AS p ON od.id_product = p.id_product
JOIN
    orders AS o ON od.id_order = o.id_order
JOIN
    locations AS l ON o.id_location = l.id_location
JOIN
    addresses AS a ON l.id_address = a.id_address  -- Unimos con la tabla addresses
JOIN
    cities AS c ON a.id_city = c.id_city
WHERE
    p.type = 'BEBIDAS'
    AND c.name = 'Hospitalet de Llobregat' 
    -- 	AND a.address = 'Dirección de la sucursal' -- Filtra por la dirección
GROUP BY
    c.name, l.name, a.address, p.type, p.name;  
    
      -- Lista cuántos pedidos ha efectuado un determinado empleado/a.
    
   SELECT
    e.name AS nombre_empleado,
    e.last_name AS apellido_empleado,
    COUNT(DISTINCT dd.id_order) AS cantidad_pedidos
FROM
    employees AS e
LEFT JOIN  -- Usamos LEFT JOIN para incluir empleados sin pedidos
    delivery_details AS dd ON e.id_employee = dd.id_employee
WHERE
    e.name = 'Daniel' AND e.last_name = 'Torres'  -- Filtra por nombre y apellido
GROUP BY
    e.name, e.last_name;  -- Agrupa por nombre y apellido
    
    