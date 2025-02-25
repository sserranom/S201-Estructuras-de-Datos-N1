USE cul_dampolla;

-- Lista el total de facturas de un cliente/a en un período determinado.

SELECT
    c.name AS nombre_cliente,
    SUM(sd.amount * g.price) AS total_facturado
FROM
    customers AS c
JOIN
    sales AS s ON c.id_customer = s.id_customer
JOIN
    sale_details AS sd ON s.id_sale = sd.id_sale
JOIN
    glasses AS g ON sd.id_glass = g.id_glass
WHERE
    c.name = 'Juan Perez'  
    AND s.date_sale BETWEEN '2025-02-17' AND '2025-02-21'
GROUP BY
    c.name;
    
    -- Lista los diferentes modelos de gafas que ha vendido un empleado durante un año

SET @fecha_inicio = '2025-01-01';
SET @fecha_fin = '2025-12-31';
SELECT
    b.name AS marca_gafas,
    COUNT(sd.id_glass) AS cantidad_vendida,
    @fecha_inicio AS fecha_inicio, 
    @fecha_fin AS fecha_fin   
FROM
    sellers AS s
JOIN
    sales AS sa ON s.id_seller = sa.id_seller
JOIN
    sale_details AS sd ON sa.id_sale = sd.id_sale
JOIN
    glasses AS g ON sd.id_glass = g.id_glass
JOIN
    brands AS b ON g.id_brand = b.id_brands
WHERE
    s.name = 'Vendedor 3' 
    AND sa.date_sale BETWEEN @fecha_inicio AND @fecha_fin 
GROUP BY
    b.name;
    
    
    -- Lista a los diferentes proveedores que han suministrado gafas vendidas con éxito por la óptica.    

SELECT
    s.name AS nombre_proveedor,
    COUNT(sd.id_glass) AS cantidad_gafas_vendidas
FROM
    suppliers AS s
JOIN
    glasses AS g ON s.id_supplier = g.id_supplier
JOIN
    sale_details AS sd ON g.id_glass = sd.id_glass
WHERE
    sd.id_sale IN (
        SELECT
            sa.id_sale
        FROM
            sales AS sa
    )
GROUP BY
    s.name;