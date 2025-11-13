# Store Data en Flutter

Un proyecto de Flutter que muestra las diferentes formas de almacenar datos.

| Método                | Uso ideal                     | Ventajas                             |
|-----------------------|-------------------------------|--------------------------------------|
| `shared_preferences`  | Datos simples (configuración) | Fácil, rápido, ligero                |
| `sqflite`             | Datos estructurados           | Completo, soporta consultas SQL      |
| `Hive`                | Datos simples y rápidos       | Rápido, fácil de usar                |
| `File System`         | Archivos grandes o binarios   | Control total sobre archivos         |


## SharedPreferences 

* `SharedPreferences` es ideal para configuraciones pequeñas (no para grandes cantidades de datos).
* Los datos se guardan localmente en el dispositivo y persisten entre reinicios. 
* No es seguro para información sensible (como contraseñas).

## SQLite

SQLite es un motor de base de datos relacional ligero y autocontenida que se ejecuta localmente en el dispositivo. 
Es un software que permite crear, leer, actualizar y eliminar datos en una base de datos. 

`sqflite` es un paquete de Flutter que proporciona una interfaz de acceso a SQLite en aplicaciones Flutter. Es una 
capa de abstracción que permite usar SQLite desde el código Dart.


* SQLite es el motor de base de datos real
* `sqflite` es el paquete que permite usar SQLite en Flutter
* `sqflite` no es una base de datos, sino una interfaz
* Ambos trabajan juntos para proporcionar almacenamiento local eficiente
* `sqflite` es la solución recomendada para aplicaciones Flutter

| Característica | SQLite | sqflite |
|:--:|:--:|:--:|
| Tipo | Motor de base de datos | Paquete Flutter (wrapper) |
| Lenguaje | SQL (Structured Query Language) | Dart | 
| Nivel de abstracción | Bajo nivel | Medio nivel |
| Uso | Base de datos real | Acceso a base de datos real | 
| Plataforma | Multiplataforma | Flutter (iOS/Android) |


## Hive

Hive es una base de datos NoSQL ligera y de alto rendimiento para Flutter que se utiliza para almacenar datos localmente 
en dispositivos móviles.

Características principales:

1. Rendimiento extremo
* Escritura y lectura muy rápidas
* No requiere conversión de tipos
* Base de datos en memoria (cache) para mejor rendimiento

2. Facilidad de uso
* API simple y directa
* No necesitas SQL
* Tipos de datos nativos de Dart

3. Ligereza
* Pequeño tamaño (menos de 100KB)
* No requiere SQLite o bases de datos complejas
* Ideal para aplicaciones móviles

## File System

`FileSystem` en Flutter se refiere al sistema de archivos del dispositivo donde se almacenan los datos de tu aplicación. 
Es la forma en que Flutter accede y gestiona archivos en el dispositivo móvil.

Ventajas: 

* Almacenamiento persistente 
* Acceso directo al sistema de archivos 
* No hay límites de tamaño 
* Puede manejar cualquier tipo de archivo 
* Alto rendimiento para archivos grandes

Limitantes:

* Espacio limitado en el dispositivo
* No es ideal para datos estructurados
* Requiere manejo de errores
* No es seguro para datos sensibles


## Configuración de dependencias

Para cada ejemplo, es necesario agregar las dependencias correspondientes al archivo `pubspec.yaml`:

### Para Shared Preferences:
```yaml
dependencies:
  flutter:
    sdk: flutter
  shared_preferences: ^2.2.2
```

### Para SQLite:
```yaml
dependencies:
  flutter:
    sdk: flutter
  sqflite: ^2.3.0
  path: ^1.8.3
```

### Para Hive:
```yaml
dependencies:
  flutter:
    sdk: flutter
  hive: ^2.2.3
  hive_flutter: ^1.1.0
```

### Para File System:
```yaml
dependencies:
  flutter:
    sdk: flutter
  path_provider: ^2.1.1
```

