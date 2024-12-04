# 🛠️ Trabajo Final de Base de Datos 🛠️

## 📄 Documentación 📄

### 🚀 Equipo Digital 🚀
#### 📑 Resumen Ejecutivo 📑

- **Docente:** Elliot Garamendi  
- **Carrera:** Diseño y Desarrollo de Software  
- **Sección:** 2B 24-C  
- **Integrantes:**
  - Diego Alexis Ccaihuari Tintaya
  - Anderson Miguel Ninahuaman Yuto
  - Jheremy Strong Delgado Gomez
  - Joshua Gallarday Salazar

**📅 2024-2 📅**

---

## 📑 Índice 📑
1. [📄 Introducción 📄](#📄-introducción-📄)
2. [🚀 Prototipo 🚀](#🚀-prototipo-🚀)
3. [⚙️ Funcionalidades ⚙️](#⚙️-funcionalidades-⚙️)
4. [📊 Modelo de Datos 📊](#📊-modelo-de-datos-📊)
   1. [Entidades Principales](#entidades-principales)
   2. [Relaciones Entre Entidades](#relaciones-entre-entidades)
5. [🎨 Diseño de la Interfaz (Canva) 🎨](#🎨-diseño-de-la-interfaz-canva-🎨)
6. [🛠️ Consultas SQL (Querys) 🛠️](#🛠️-consultas-sql-querys-🛠️)

---

## 📄 Introducción 📄

El proyecto tiene como objetivo principal diseñar e implementar un sistema de gestión basado en bases de datos para una tienda de electrodomésticos. Este sistema digitaliza procesos clave como la administración de inventario, empleados, ventas y promociones, facilitando la toma de decisiones a través de una interfaz intuitiva y centralizada.

---

## 🚀 Prototipo 🚀

La plataforma está diseñada para:
- Mejorar la organización y monitoreo de la tienda.
- Ofrecer herramientas para la toma de decisiones estratégicas.
- Incrementar la eficiencia operativa y la colaboración entre empleados.

---

## ⚙️ Funcionalidades ⚙️

### 🛒 Módulo de Inventario:
- Control y monitoreo de productos disponibles.
- Filtros por sucursal para la gestión de múltiples ubicaciones.

### 🛠️ Gestión de Empleados:
- Registro centralizado con datos básicos y roles.
- Comunicación interna y seguimiento de recursos humanos.

### 🔔 Notificaciones:
- Sistema centralizado para eventos como errores técnicos o mantenimientos.

### 💸 Módulo de Promociones:
- Registro y visualización de ofertas activas para alinear estrategias de ventas.

### ⚙️ Menú de Configuración:
- Personalización según las necesidades del negocio.

---

## 📊 Modelo de Datos 📊

### Entidades Principales
1. **Inventario**: Representa los productos disponibles en una sucursal.  
2. **Producto**: Detalla la información de cada artículo.  
3. **Sucursal**: Registra las ubicaciones físicas de la tienda.  
4. **Promoción**: Maneja descuentos y ofertas.  
5. **Cliente**: Incluye información personal de los compradores.  
6. **Venta**: Registra las transacciones realizadas.  
7. **Empleado**: Gestiona el personal de la tienda.  
8. **Método de Pago**: Define las opciones de pago disponibles.  

### Relaciones Entre Entidades
- **Producto → Inventario**: Asociación de productos a su inventario.
- **Sucursal → Inventario**: Relación entre sucursales e inventarios.
- **Cliente → Venta**: Asociación de clientes con sus compras.
- **Promoción → Producto**: Aplicación de descuentos a productos específicos.

---

## 🎨 Diseño de la Interfaz (Canva) 🎨

El diseño de la interfaz para este sistema fue realizado en Canva. Puedes acceder al prototipo interactivo haciendo clic en el enlace a continuación:  

[🎨 Ver Prototipo en Canva 🎨](https://www.canva.com/design/DAGYUHnDdzg/n1P7AFnxRfNyjsuhlsybag/edit)  

---

## 🛠️ Consultas SQL (Querys) 🛠️

### 1. Consultar Inventario por Sucursal
```sql
SELECT * 
FROM Inventario 
WHERE Sucursal_idSucursal = 1;
```
### 2. Obtener Ventas Totales por Empleado
```sql
SELECT Empleado.nombre, SUM(Venta.total) AS Ventas_Totales
FROM Venta
INNER JOIN Empleado ON Venta.Empleado_idEmpleado = Empleado.idEmpleado
GROUP BY Empleado.nombre;
```
### 3. Obtener Ventas Totales por Empleado
```sql
SELECT * 
FROM Promocion 
WHERE fecha_fin > CURRENT_DATE;
```
### 4. Obtener Ventas Totales por Empleado
```sql
SELECT Producto.nombre, Detalle_Venta.cantidad, Detalle_Venta.precio_unitario
FROM Detalle_Venta
INNER JOIN Producto ON Detalle_Venta.Producto_idProducto = Producto.idProducto
WHERE Detalle_Venta.Venta_idVenta = 123;

```
