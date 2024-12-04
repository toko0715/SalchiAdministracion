# Trabajo Final: Sistema de Gestión de Tiendas - Base de Datos  

## 📋 Departamento de Tecnología Digital  
**Carrera:** Diseño y Desarrollo de Software  
**Sección:** 2B 24-C  
**Curso:** Base de Datos

**Integrantes:**  
- Diego Alexis Ccaihuari Tintaya  
- Anderson Miguel Ninahuaman Yuto  
- Jheremy Strong Delgado Gomez  
- Joshua Gallarday Salazar  

**Docente:** Elliot Garamendi  

**Lugar y Fecha:** Lima, Perú - 2024-2  

---

## 📖 Introducción  

El sistema desarrollado tiene como propósito facilitar la organización, el monitoreo y la toma de decisiones dentro de una tienda, mediante una plataforma digital integrada que centraliza información clave y ofrece herramientas para la gestión de inventarios, promociones, empleados, sucursales y más. Este enfoque promueve la eficiencia operativa y fomenta la colaboración entre los empleados.

---

## 🛠️ Funcionalidades  

### 🔢 Módulo de Inventario  
- **Objetivo:**  
  Controlar y rastrear productos disponibles en stock.  

- **Beneficios:**  
  - Evita problemas de desabastecimiento o sobrestock.  
  - Gestión optimizada de múltiples sucursales mediante filtros avanzados por ubicación.  

---

### 📦 Detalles de Productos  
- **Descripción:**  
  Proveer información detallada de los productos, como historial de precios, garantías y devoluciones.  
- **Impacto:**  
  Permite una mejor toma de decisiones para los administradores y empleados.  

---

### 👨‍💼 Gestión de Empleados  
- **Objetivo:**  
  Centralizar y organizar información clave de los empleados, como roles y contactos.  

- **Beneficios:**  
  - Facilita la comunicación interna.  
  - Mejora el seguimiento del personal.  

---

### 📢 Notificaciones  
- **Descripción:**  
  Sistema que centraliza la difusión de alertas sobre eventos importantes, como errores técnicos, promociones o mantenimiento.  

---

### 🎉 Módulo de Promociones  
- **Objetivo:**  
  Ofrecer una herramienta para gestionar promociones activas, alineando estrategias de marketing y ventas.  

---

### ⚙️ Menú de Configuración  
- **Descripción:**  
  Permite personalizar la plataforma según las necesidades de la tienda, adaptándose a cambios en la estructura organizativa o en políticas de permisos.  

---

### 📍 Gestión de Sucursales  
- **Funciones:**  
  - Registro de sucursales con detalles como dirección, ciudad y código postal.  
  - Filtrado por zonas para una mejor organización.  

---

## 📊 Diagrama de Entidad-Relación  

El siguiente diagrama representa la estructura general del sistema:  

![Diagrama de Entidad-Relación](ruta/a/imagen_diagrama.png)  

---

## 📑 Descripción de las Entidades  

### **1. Sucursal**  
- **Descripción:**  
  Representa las sucursales donde se almacenan los productos.  
- **Campos:**  
  - `idSucursal` (PK): Identificador único.  
  - `nombre`: Nombre de la sucursal.  
  - `direccion`: Dirección completa.  
  - `ciudad`: Ciudad donde se encuentra.  
  - `estado`: Estado de la sucursal.  
  - `codigo_postal`: Código postal de 5 caracteres.  
  - **Restricciones:**  
    - `chk_codigo_postal`: Longitud fija de 5 caracteres para el código postal.  

---

### **2. Empleado**  
- **Descripción:**  
  Detalla los empleados que laboran en la empresa.  
- **Campos:**  
  - `idEmpleado` (PK): Identificador único.  
  - `nombre`: Nombre del empleado.  
  - `apellido`: Apellido del empleado.  
  - `telefono`: Número de contacto.  
  - `email`: Dirección de correo electrónico.  
  - `cargo`: Puesto o rol en la empresa.  
  - **Restricciones:**  
    - `chk_email_empleado`: Verificación del formato de email.  

---

### **3. Categoría**  
- **Descripción:**  
  Clasifica los productos en diferentes tipos o grupos.  
- **Campos:**  
  - `idCategoria` (PK): Identificador único.  
  - `nombre`: Nombre de la categoría.  
  - `estado`: Estado (Activo/Inactivo).  
  - `tipo`: Tipo de categoría.  
  - `Descripcion`: Descripción de la categoría.  
  - **Restricciones:**  
    - `chk_estado_categoria`: El estado debe ser "Activo" o "Inactivo".  

---

### **4. Producto**  
- **Descripción:**  
  Detalla los productos disponibles.  
- **Campos:**  
  - `idProducto` (PK): Identificador único.  
  - `nombre`: Nombre del producto.  
  - `marca`: Marca del producto.  
  - `modelo`: Modelo del producto.  
  - `categoria`: Categoría del producto.  
  - `precio`: Precio actual.  
  - `fecha_ingreso`: Fecha de ingreso al inventario.  
  - **Restricciones:**  
    - `chk_precio`: El precio debe ser mayor a 0.  

---

### **5. Cliente**  
- **Descripción:**  
  Representa a los clientes que compran productos.  
- **Campos:**  
  - `idCliente` (PK): Identificador único.  
  - `nombres`: Nombres del cliente.  
  - `paterno`: Apellido paterno.  
  - `materno`: Apellido materno.  
  - `direccion`: Dirección del cliente.  
  - `telefono`: Número de contacto.  
  - `email`: Dirección de correo electrónico.  
  - **Restricciones:**  
    - `chk_email_cliente`: Verificación del formato de email.  

---

### **6. Venta**  
- **Descripción:**  
  Registra las ventas realizadas.  
- **Campos:**  
  - `idVenta` (PK): Identificador único.  
  - `fecha_venta`: Fecha en que se realizó la venta.  
  - `total`: Total de la venta.  
  - **Restricciones:**  
    - `chk_total_venta`: El total debe ser mayor o igual a 0.  

---

### **7. Detalle de Venta**  
- **Descripción:**  
  Registra los detalles de cada producto vendido.  
- **Campos:**  
  - `idDetalle_venta` (PK): Identificador único.  
  - `cantidad`: Cantidad de productos vendidos.  
  - `precio_unitario`: Precio por unidad del producto.  
  - `descuento`: Descuento aplicado.  
  - **Restricciones:**  
    - `chk_cantidad`: La cantidad debe ser mayor a 0.  

---

### **8. Inventario**  
- **Descripción:**  
  Representa el inventario de productos en una sucursal.  
- **Campos:**  
  - `idInventario` (PK): Identificador único.  
  - `producto_id`: Relación con el producto.  
  - `fecha_ultima_actualizacion`: Última fecha de modificación.  

---

### **9. Promoción**  
- **Descripción:**  
  Registra las promociones activas.  
- **Campos:**  
  - `idPromocion` (PK): Identificador único.  
  - `descuento_porcentaje`: Porcentaje de descuento.  
  - `fecha_inicio`: Fecha de inicio de la promoción.  
  - `fecha_fin`: Fecha de finalización de la promoción.  
  - **Restricciones:**  
    - `chk_fechas_promocion`: La fecha de inicio debe ser anterior o igual a la de fin.  

---

### **10. Garantía**  
- **Descripción:**  
  Registra las garantías otorgadas en las ventas.  
- **Campos:**  
  - `idGarantia` (PK): Identificador único.  
  - `fecha_inicio`: Fecha de inicio de la garantía.  
  - `fecha_fin`: Fecha de fin de la garantía.  
  - `cobertura`: Detalles de la cobertura.  
  - **Restricciones:**  
    - `chk_fechas_garantia`: La fecha de inicio debe ser anterior o igual a la de fin.  

---

## 📚 Relaciones entre Entidades  

- **Empleado y Venta:**  
  - Un empleado puede realizar varias ventas (`Empleado.idEmpleado -> Venta.idEmpleado`).  

- **Cliente y Venta:**  
  - Un cliente puede estar asociado a varias ventas (`Cliente.idCliente -> Venta.idCliente`).  

- **Venta y Detalle de Venta:**  
  - Cada venta puede tener múltiples detalles de productos (`Venta.idVenta -> Detalle_venta.idVenta`).  

- **Producto y Detalle de Venta:**  
  - Un producto puede estar asociado a múltiples detalles de venta (`Producto.idProducto -> Detalle_venta.idProducto`).  

- **Producto y Inventario:**  
  - Un producto puede estar en múltiples inventarios de distintas sucursales (`Producto.idProducto -> Inventario.producto_id`).  

- **Sucursal y Inventario:**  
  - Una sucursal puede tener múltiples inventarios (`Sucursal.idSucursal -> Inventario.Sucursal_idSucursal`).  

- **Producto y Categoría:**  
  - Un producto puede pertenecer a varias categorías y viceversa (relación N:M, mediante `Producto_has_Categoria`).  

- **Detalle de Venta y Garantía:**  
  - Un detalle de venta puede estar relacionado con una garantía (`Detalle_venta.idDetalle_venta -> Garantia.Detalle_venta_idDetalle`).  

- **Promoción:**  
  - Asociada a productos mediante lógica del sistema o reglas adicionales (no FK explícita).  

---

## 🔍 Consultas SQL  

### Creacion de tablas

#### **1. Sucursal**  
```sql
CREATE TABLE Sucursal (
    idSucursal NUMBER PRIMARY KEY,
    nombre VARCHAR2(45) NOT NULL,
    direccion VARCHAR2(255) NOT NULL,
    ciudad VARCHAR2(45) NOT NULL,
    estado VARCHAR2(45) NOT NULL,
    codigo_postal CHAR(10) NOT NULL,
    CONSTRAINT chk_codigo_postal CHECK (LENGTH(codigo_postal) = 5)
);
```
#### **2. Empleado**  
```sql
CREATE TABLE Empleado (
    idEmpleado NUMBER PRIMARY KEY,
    nombre VARCHAR2(45) NOT NULL,
    apellido VARCHAR2(45) NOT NULL,
    telefono VARCHAR2(15) NOT NULL,
    email VARCHAR2(45) NOT NULL,
    cargo VARCHAR2(45) NOT NULL,
    CONSTRAINT chk_email_empleado CHECK (REGEXP_LIKE(email, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'))
);
```
#### **3. Categoria**  
```sql
CREATE TABLE Categoria (
    idCategoria NUMBER PRIMARY KEY,
    nombre VARCHAR2(45) NOT NULL,
    estado VARCHAR2(45) DEFAULT 'Activo',
    tipo VARCHAR2(45) NOT NULL,
    Descripcion VARCHAR2(255),
    CONSTRAINT chk_estado_categoria CHECK (estado IN ('Activo', 'Inactivo'))
);
```
#### **4. Producto**  
```sql
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
```
#### **5. Cliente**  
```sql
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
```
#### **6. Venta**  
```sql
    idVenta NUMBER PRIMARY KEY,
    fecha_venta DATE NOT NULL,
    total NUMBER(10,2) NOT NULL,
    idEmpleado NUMBER,
    idCliente NUMBER,
    CONSTRAINT fk_venta_empleado FOREIGN KEY (idEmpleado) REFERENCES Empleado(idEmpleado),
    CONSTRAINT fk_venta_cliente FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
    CONSTRAINT chk_total_venta CHECK (total >= 0)
);
```
#### **7. DetalleVenta**  
```sql
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
```
#### **7. Metodo_De_pago**  
```sql
CREATE TABLE Metodo_de_Pago (
    idMetodo_de_Pago NUMBER PRIMARY KEY,
    Tipo VARCHAR2(45) NOT NULL,
    Descripcion VARCHAR2(45),
    Codigo VARCHAR2(45),
    idVenta NUMBER,
    CONSTRAINT fk_metodo_pago_venta FOREIGN KEY (idVenta) REFERENCES Venta(idVenta)
);
```
