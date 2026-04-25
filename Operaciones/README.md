# Operaciones Aritmeticas en RISC-V

Este módulo contiene implementaciones manuales de algoritmos aritméticos, explorando la diferencia entre métodos iterativos y optimizaciones de bajo nivel.

## Conceptos Implementados
- **Multiplicación y División Iterativa:** Implementación de productos mediante sumas sucesivas y cocientes mediante restas sucesivas.
- **Manejo de Signos:** Lógica de normalización de números negativos mediante la instrucción `neg` para procesar valores absolutos y restaurar el signo posteriormente.
- **Optimización por Bit-Shifting:** Uso de `srai` (Shift Right Arithmetic) para realizar divisiones por potencias de 2 (en este caso $2^3 = 8$), incluyendo lógica de redondeo mediante el ajuste del dividendo.

## Contenido
- `division_por_restas.s`: Algoritmo genérico de división entera.
- `division_eficiente_potencia2.s`: División optimizada para potencias de dos, demostrando comprensión de la representación binaria.
- `multiplicacion_por_sumas.s`: Implementación básica de producto escalar.
