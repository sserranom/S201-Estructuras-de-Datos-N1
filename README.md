# S2.01. Estructura de datos - MySQL - N1

## Ejercicio1:

contiene el script de creación y carga de la base de datos `cul_dampolla`, diseñada para gestionar la información de una óptica.

## Descripción General

La base de datos `cul_dampolla` almacena información sobre clientes, vendedores, proveedores, productos (gafas, monturas, cristales), ventas y detalles de ventas. El esquema está normalizado para minimizar la redundancia de datos y asegurar la integridad referencial.

## Estructura de la Base de Datos

La base de datos está compuesta por las siguientes tablas:

*   **`addresses`**: Almacena información sobre las direcciones de clientes, proveedores y la óptica.
*   **`brands`**: Almacena los nombres de las marcas de gafas.
*   **`cities`**: Almacena los nombres de las ciudades.
*   **`colors`**: Almacena los nombres de los colores de monturas y cristales.
*   **`countries`**: Almacena los nombres de los países.
*   **`customers`**: Almacena información sobre los clientes.
*   **`frames`**: Almacena información sobre los tipos de monturas (flotante, pasta, metálico) y su color.
*   **`glasses`**: Almacena información sobre las gafas, incluyendo marca, montura, cristales, proveedor y precio.
*   **`glasses_lenses`**: Almacena información sobre los cristales, incluyendo ojo (derecho, izquierdo) y color.
*   **`sale_details`**: Almacena los detalles de cada venta, incluyendo la gafa vendida y la cantidad.
*   **`sales`**: Almacena información sobre las ventas, incluyendo cliente, vendedor y fecha de venta.
*   **`sellers`**: Almacena información sobre los vendedores.
*   **`suppliers`**: Almacena información sobre los proveedores, incluyendo nombre, NIF, teléfono, fax y dirección.


## Diagrama de la Base de Datos

El diagrama de la base de datos proporciona una representación visual de la estructura de la base de datos, incluyendo las tablas y sus relaciones.
[Diagrama de la base de datos](https://github.com/sserranom/S201-Estructuras-de-Datos-N1/blob/main/Ejercicio1/db_optica_diagram.png)

## Relaciones entre Tablas

Las tablas están relacionadas de la siguiente manera:

*   `addresses` está relacionada con `cities` y `countries` mediante las claves foráneas `id_city` e `id_country`, respectivamente.
*   `custumers` está relacionada con `addresses` mediante la clave foránea `id_address` y con la misma tabla `custumers` mediante la clave foránea `recomended`.
*   `frames` está relacionada con `color` mediante la clave foránea `id_color`.
*   `glasses` está relacionada con `brands`, `frames`, `glasses_lenses` y `suppliers` mediante las claves foráneas `id_brand`, `id_frame`, `id_glasses_lens` e `id_supplier`, respectivamente.
*   `glasses_lenses` está relacionada con `color` mediante la clave foránea `id_color`.
*   `sale_details` está relacionada con `sales` y `glasses` mediante las claves foráneas `id_sale` e `id_glases`, respectivamente.
*   `sales` está relacionada con `custumers` y `sellers` mediante las claves foráneas `id_custumer` e `id_seller`, respectivamente.
*   `suppliers` está relacionada con `addresses` mediante la clave foránea `id_address`.

## Scripts

El script `cul_dampolla.sql` contiene las sentencias SQL para crear las tablas y cargar datos de ejemplo en la base de datos.

## Uso

Para utilizar esta base de datos, debes:

1.  Crear una base de datos llamada `cul_dampolla` en tu servidor MySQL.
2.  Ejecutar el script `cul_dampolla.sql` para crear las tablas y cargar los datos.


   ## Ejercicio 2:

contiene el script de creación y carga de la base de datos `pizzeria`, diseñada para gestionar la información de una pizzería.

## Descripción General

La base de datos `pizzeria` almacena información sobre clientes, empleados, productos (pizzas, bebidas), pedidos, detalles de pedidos y direcciones. El esquema está normalizado para minimizar la redundancia de datos y asegurar la integridad referencial.

## Estructura de la Base de Datos

La base de datos está compuesta por las siguientes tablas:

*   **`addresses`**: Almacena información sobre las direcciones de clientes, empleados y sucursales.
*   **`category_pizzas`**: Almacena las diferentes categorías de pizzas (ej: Clásica, Especialidad, etc.).
*   **`city`**: Almacena los nombres de las ciudades.
*   **`customers`**: Almacena información sobre los clientes.
*   **`delivery_details`**: Almacena información sobre la entrega de los pedidos.
*   **`employees`**: Almacena información sobre los empleados (cocineros, repartidores, etc.).
*   **`locations`**: Almacena información sobre las sucursales de la pizzería.
*   **`orders`**: Almacena información sobre los pedidos, incluyendo cliente, sucursal y fecha/hora.
*   **`order_details`**: Almacena los detalles de cada pedido, incluyendo el producto y la cantidad.
*   **`products`**: Almacena información sobre los productos (pizzas, bebidas).
*   **`province`**: Almacena los nombres de las provincias.

## Diagrama de la Base de Datos

El diagrama de la base de datos proporciona una representación visual de la estructura de la base de datos, incluyendo las tablas y sus relaciones.

[Diagrama de la base de datos](https://github.com/sserranom/S201-Estructuras-de-Datos-N1/blob/main/Ejercicio2/pizzeria_diagram.png)

## Relaciones entre Tablas

Las tablas están relacionadas de la siguiente manera:

*   `addresses` está relacionada con `city` mediante la clave foránea `id_city`.
*   `city` está relacionada con `province` mediante la clave foránea `id_province`.
*   `customers` está relacionada con `addresses` mediante la clave foránea `id_address`.
*   `delivery_details` está relacionada con `orders` y `employees` mediante las claves foráneas `id_order` e `id_employee`, respectivamente.
*   `employees` está relacionada con `locations` mediante la clave foránea `id_location`.
*   `locations` está relacionada con `addresses` mediante la clave foránea `id_address`.
*   `orders` está relacionada con `customers` y `locations` mediante las claves foráneas `id_customer` e `id_location`, respectivamente.
*   `order_details` está relacionada con `orders` y `products` mediante las claves foráneas `id_order` e `id_product`, respectivamente.
*   `products` está relacionada con `category_pizzas` mediante la clave foránea `id_category_pizza`.

## Scripts

El script `pizzeria.sql` (o el nombre del script que utilizaste) contiene las sentencias SQL para crear las tablas y cargar datos de ejemplo en la base de datos.

## Uso

Para utilizar esta base de datos, debes:

1.  Crear una base de datos llamada `pizzeria` en tu servidor MySQL.
2.  Ejecutar el script `pizzeria.sql` para crear las tablas y cargar los datos.
