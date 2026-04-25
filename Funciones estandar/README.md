# Reimplementación de Funciones Estándar

Este módulo contiene versiones personalizadas de funciones clásicas de programación, recreadas íntegramente en Assembler para entender su funcionamiento interno y eficiencia.

## Conceptos Implementados
- **Conversión de Tipos (ATOI):** Transformación de cadenas ASCII a valores numéricos enteros utilizando tablas de búsqueda para unidades, decenas, centenas y miles.
- **Normalización de Caracteres:** Implementación de `toLower` mediante manipulación directa del mapa ASCII (ajuste por offset de 32).
- **Comparación Case-Insensitive:** Lógica de comparación de cadenas ignorando diferencias entre mayúsculas y minúsculas mediante pre-procesamiento de caracteres.

## Contenido
- `atoi_custom_implementation.s`: Conversión de "string" a "int" soportando hasta 4 dígitos.
- `string_case_insensitive_cmp.s`: Comparación de textos con normalización integrada.
- `print_vector_formatted.s`: Utilidad para visualización de datos en consola.
