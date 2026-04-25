# 📊 Funciones con Arrays en RISC-V

Esta sección del repositorio contiene implementaciones de lógica esencial para la manipulación de arreglos en memoria utilizando el conjunto de instrucciones **RV32I**.

## 🧠 Conceptos Implementados
- **Iteración de punteros:** Recorrido de vectores utilizando direcciones de inicio y fin (`la`, `addi`, `bne`).
- **Pila (Stack):** Gestión del registro de retorno `ra` y preservación de registros `s0` mediante el uso de la pila en funciones anidadas.
- **Intercambio (Swap):** Lógica de intercambio de valores en memoria (Load/Store) como base para algoritmos de ordenamiento.
- **Algoritmos:** Implementación manual del algoritmo de ordenamiento por burbuja (Bubble Sort) mediante subrutinas.

## 📁 Contenido de los Archivos
- `ordenar_array_bubble.s`: Programa completo que organiza un vector de forma ascendente.
- `buscar_max_min.s`: Funciones para encontrar valores extremos en una colección de datos.
- `swap_memory_basic.s`: Operación atómica de intercambio de contenido entre dos direcciones de memoria.

## 🛠 Notas Técnicas
En el ejercicio de `pushMax`, se implementó una corrección en el manejo del puntero de fin (`finVector - 4`) para evitar el acceso a memoria fuera de los límites del vector (Buffer Overflow preventivo).
