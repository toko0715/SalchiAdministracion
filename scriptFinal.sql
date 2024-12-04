-- Tabla Sucursal
CREATE TABLE Sucursal (
    idSucursal NUMBER PRIMARY KEY,
    nombre VARCHAR2(45) NOT NULL,
    direccion VARCHAR2(255) NOT NULL,
    ciudad VARCHAR2(45) NOT NULL,
    estado VARCHAR2(45) NOT NULL,
    codigo_postal CHAR(10) NOT NULL,
    CONSTRAINT chk_codigo_postal CHECK (LENGTH(codigo_postal) = 5)
);

-- Tabla Empleado
CREATE TABLE Empleado (
    idEmpleado NUMBER PRIMARY KEY,
    nombre VARCHAR2(45) NOT NULL,
    apellido VARCHAR2(45) NOT NULL,
    telefono VARCHAR2(15) NOT NULL,
    email VARCHAR2(45) NOT NULL,
    cargo VARCHAR2(45) NOT NULL,
    CONSTRAINT chk_email_empleado CHECK (REGEXP_LIKE(email, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'))
);

-- Tabla Categoria
CREATE TABLE Categoria (
    idCategoria NUMBER PRIMARY KEY,
    nombre VARCHAR2(45) NOT NULL,
    estado VARCHAR2(45) DEFAULT 'Activo',
    tipo VARCHAR2(45) NOT NULL,
    Descripcion VARCHAR2(255),
    CONSTRAINT chk_estado_categoria CHECK (estado IN ('Activo', 'Inactivo'))
);

-- Tabla Producto
CREATE TABLE Producto (
    idProducto NUMBER PRIMARY KEY,
    nombre VARCHAR2(45) NOT NULL,
    marca VARCHAR2(45) NOT NULL,
    modelo VARCHAR2(45),
    categoria VARCHAR2(45) NOT NULL,
    precio NUMBER NOT NULL,
    fecha_ingreso DATE NOT NULL,
    CONSTRAINT chk_precio CHECK (precio > 0)
);

-- Tabla Cliente
CREATE TABLE Cliente (
    idCliente NUMBER PRIMARY KEY,
    nombres VARCHAR2(45) NOT NULL,
    paterno VARCHAR2(45) NOT NULL,
    materno VARCHAR2(45),
    direccion VARCHAR2(45) NOT NULL,
    telefono VARCHAR2(15),
    email VARCHAR2(100),
    CONSTRAINT chk_email_cliente CHECK (REGEXP_LIKE(email, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'))
);

-- Tabla Venta
CREATE TABLE Venta (
    idVenta NUMBER PRIMARY KEY,
    fecha_venta DATE NOT NULL,
    total NUMBER(10,2) NOT NULL,
    idEmpleado NUMBER,
    idCliente NUMBER,
    CONSTRAINT fk_venta_empleado FOREIGN KEY (idEmpleado) REFERENCES Empleado(idEmpleado),
    CONSTRAINT fk_venta_cliente FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
    CONSTRAINT chk_total_venta CHECK (total >= 0)
);

-- Tabla Detalle_venta
CREATE TABLE Detalle_venta (
    idDetalle_venta NUMBER PRIMARY KEY,
    cantidad NUMBER NOT NULL,
    precio_unitario NUMBER(10,2) NOT NULL,
    descuento NUMBER DEFAULT 0,
    idVenta NUMBER,
    idProducto NUMBER,
    CONSTRAINT fk_detalle_venta FOREIGN KEY (idVenta) REFERENCES Venta(idVenta),
    CONSTRAINT fk_detalle_producto FOREIGN KEY (idProducto) REFERENCES Producto(idProducto),
    CONSTRAINT chk_cantidad CHECK (cantidad > 0)
);

-- Tabla Metodo_de_Pago
CREATE TABLE Metodo_de_Pago (
    idMetodo_de_Pago NUMBER PRIMARY KEY,
    Tipo VARCHAR2(45) NOT NULL,
    Descripcion VARCHAR2(45),
    Codigo VARCHAR2(45),
    idVenta NUMBER,
    CONSTRAINT fk_metodo_pago_venta FOREIGN KEY (idVenta) REFERENCES Venta(idVenta)
);

-- Tabla Inventario
CREATE TABLE Inventario (
    idInventario NUMBER PRIMARY KEY,
    producto_id VARCHAR2(45) NOT NULL,
    fecha_ultima_actualizacion DATE NOT NULL,
    Sucursal_idSucursal NUMBER,
    CONSTRAINT fk_inventario_sucursal FOREIGN KEY (Sucursal_idSucursal) REFERENCES Sucursal(idSucursal)
);

-- Tabla Historical_de_Precios
CREATE TABLE Historical_de_Precios (
    idHistorial_de_Precios NUMBER PRIMARY KEY,
    Precio_Anterior NUMBER NOT NULL,
    Precio_Actual NUMBER NOT NULL,
    Fecha_de_Cambio DATE NOT NULL,
    idProducto NUMBER,
    CONSTRAINT fk_historial_producto FOREIGN KEY (idProducto) REFERENCES Producto(idProducto),
    CONSTRAINT chk_precios CHECK (Precio_Actual > 0 AND Precio_Anterior > 0)
);

-- Tabla Promocion
CREATE TABLE Promocion (
    idPromocion NUMBER PRIMARY KEY,
    descuento_porcentaje NUMBER,
    fecha_inicio DATE,
    fecha_fin DATE,
    descripcion VARCHAR2(255)
);

-- Tabla Proveedor
CREATE TABLE Proveedor (
    idProveedor NUMBER PRIMARY KEY,
    nombre VARCHAR2(45) NOT NULL,
    direccion VARCHAR2(255),
    telefono VARCHAR2(15),
    email VARCHAR2(100),
    Representante VARCHAR2(45),
    Estado VARCHAR2(45)
);

-- Tabla Producto_has_Categoria
CREATE TABLE Producto_has_Categoria (
    Producto_idProducto NUMBER,
    Categoria_idCategoria NUMBER,
    CONSTRAINT pk_producto_categoria PRIMARY KEY (Producto_idProducto, Categoria_idCategoria),
    CONSTRAINT fk_phc_producto FOREIGN KEY (Producto_idProducto) REFERENCES Producto(idProducto),
    CONSTRAINT fk_phc_categoria FOREIGN KEY (Categoria_idCategoria) REFERENCES Categoria(idCategoria)
);

-- Tabla Cliente_has_Notificacion
CREATE TABLE Cliente_has_Notificacion (
    Cliente_idCliente NUMBER,
    Notificacion_idNotificacion NUMBER,
    CONSTRAINT pk_cliente_notificacion PRIMARY KEY (Cliente_idCliente, Notificacion_idNotificacion),
    CONSTRAINT fk_chn_cliente FOREIGN KEY (Cliente_idCliente) REFERENCES Cliente(idCliente),
    CONSTRAINT fk_chn_notificacion FOREIGN KEY (Notificacion_idNotificacion) REFERENCES Notificacion(idNotificacion)
);

-- Tabla Notificacion
CREATE TABLE Notificacion (
    idNotificacion NUMBER PRIMARY KEY,
    mensaje VARCHAR2(255),
    fecha_notificacion DATE,
    tipo VARCHAR2(45),
    estado VARCHAR2(45)
);

-- Tabla Garantia
CREATE TABLE Garantia (
    idGarantia NUMBER PRIMARY KEY,
    fecha_inicio DATE,
    fecha_fin DATE,
    cobertura VARCHAR2(255),
    Detalle_venta_idDetalle NUMBER,
    CONSTRAINT fk_garantia_detalle FOREIGN KEY (Detalle_venta_idDetalle) REFERENCES Detalle_venta(idDetalle_venta)
);

-- Tabla Devolucion
CREATE TABLE Devolucion (
    idDevolucion NUMBER PRIMARY KEY,
    producto_id VARCHAR2(45),
    fecha_devolucion DATE,
    motivo VARCHAR2(45),
    cantidad NUMBER,
    estado_producto VARCHAR2(45),
    Detalle_venta_idDetalle NUMBER,
    CONSTRAINT fk_devolucion_detalle FOREIGN KEY (Detalle_venta_idDetalle) REFERENCES Detalle_venta(idDetalle_venta),
    CONSTRAINT chk_cantidad_devolucion CHECK (cantidad > 0)
);

-- Agregando las restricciones adicionales necesarias para completar los 8 CONSTRAINTS requeridos:

-- En tabla Promocion
ALTER TABLE Promocion ADD CONSTRAINT chk_fechas_promocion 
    CHECK (fecha_inicio <= fecha_fin);

-- En tabla Garantia
ALTER TABLE Garantia ADD CONSTRAINT chk_fechas_garantia 
    CHECK (fecha_inicio <= fecha_fin);




SELECT 
    v.idEmpleado,
    TO_CHAR(AVG(v.total), '999,999.99') as promedio_venta,
    TO_CHAR(SUM(v.total), '999,999.99') as total_ventas,
    TO_CHAR(MAX(v.total), '999,999.99') as venta_maxima,
    TO_CHAR(MIN(v.total), '999,999.99') as venta_minima
FROM Venta v
GROUP BY v.idEmpleado;

SELECT 
    p.nombre,
    p.marca,
    TO_CHAR(p.precio, '999,999.99') as precio
FROM Producto p
WHERE UPPER(p.marca) LIKE 'SAMSUNG%'
AND UPPER(p.categoria) IN ('ELECTRÓNICOS', 'MÓVILES')
AND p.precio BETWEEN 1000 AND 5000;

SELECT 
    c.nombres,
    c.paterno,
    NVL(ROUND(AVG(v.total), 2), 0) as promedio_compras,
    COUNT(v.idVenta) as numero_compras
FROM Cliente c
LEFT JOIN Venta v ON c.idCliente = v.idCliente
GROUP BY c.nombres, c.paterno;

SELECT 
    p.nombre,
    TO_CHAR(p.precio, '999,999.99') as precio,
    UPPER(p.categoria) as categoria,
    TO_CHAR(p.fecha_ingreso, 'DD/MM/YYYY') as fecha,
    CASE 
        WHEN p.precio > 5000 THEN 'Premium'
        WHEN p.precio > 1000 THEN 'Standard'
        ELSE 'Básico'
    END as categoria_precio,
    CASE
        WHEN TRUNC(p.fecha_ingreso) = TRUNC(SYSDATE) THEN 'Hoy'
        WHEN TRUNC(p.fecha_ingreso) = TRUNC(SYSDATE-1) THEN 'Ayer'
        ELSE 'Anterior'
    END as estado_ingreso
FROM Producto p;

SELECT 
    c.nombres,
    c.paterno,
    DECODE(
        (SELECT COUNT(*) FROM Venta v WHERE v.idCliente = c.idCliente),
        0, 'Sin compras',
        1, 'Cliente nuevo',
        'Cliente frecuente'
    ) as tipo_cliente,
    (SELECT MAX(v.fecha_venta) 
     FROM Venta v 
     WHERE v.idCliente = c.idCliente) as ultima_compra
FROM Cliente c;

SELECT 
    TO_CHAR(fecha_venta, 'YYYY') as año,
    TO_CHAR(fecha_venta, 'MM') as mes,
    SUM(total) as total_ventas
FROM Venta
GROUP BY ROLLUP(
    TO_CHAR(fecha_venta, 'YYYY'),
    TO_CHAR(fecha_venta, 'MM')
);

WITH ventas_mensuales AS (
    SELECT 
        TO_CHAR(fecha_venta, 'YYYY-MM') as mes,
        SUM(total) as total_ventas
    FROM Venta
    GROUP BY TO_CHAR(fecha_venta, 'YYYY-MM')
)
SELECT 
    mes,
    total_ventas,
    LAG(total_ventas) OVER (ORDER BY mes) as ventas_mes_anterior,
    ROUND((total_ventas - LAG(total_ventas) OVER (ORDER BY mes)) / 
          LAG(total_ventas) OVER (ORDER BY mes) * 100, 2) as variacion_porcentual
FROM ventas_mensuales;

SELECT 
    v.idVenta,
    TO_CHAR(v.fecha_venta, 'DD/MM/YYYY') as fecha,
    LISTAGG(p.nombre, ', ') WITHIN GROUP (ORDER BY p.nombre) as productos_vendidos
FROM Venta v
JOIN Detalle_venta dv ON v.idVenta = dv.idVenta
JOIN Producto p ON dv.idProducto = p.idProducto
GROUP BY v.idVenta, v.fecha_venta;


SELECT 
    e.nombre,
    e.cargo,
    COUNT(v.idVenta) as total_ventas,
    RANK() OVER (ORDER BY COUNT(v.idVenta) DESC) as ranking_ventas
FROM Empleado e
LEFT JOIN Venta v ON e.idEmpleado = v.idEmpleado
GROUP BY e.nombre, e.cargo;


