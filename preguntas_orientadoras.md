## Preguntas orientadoras

- [X]  *Describa brevemente los diferentes perfiles de familias de microprocesadores/microcontroladores de ARM. Explique alguna de sus diferencias características.*

|Familia |Ejemplos |Características |Casos de uso |
---| ---| ---| ---|
Cortex A| A5, A7, A9| Microcontroladores de alto rendimiento, con mayores capacidades de memoria y soporte para sistemas operativos| Teléfonos celulares, dispositivos móviles.|
Cortex R| R4, R5, R7, R8| Microcontroladores de alto rendimiento con capacidades de tiempo real, orientados a sistemas críticos| Equipos médicos, controladores para automóviles y equipamiento de la industria espacial.|
Cortex M| M0, M0+, M3, M4 | Microcontroladores de menor rendimiento y capacidades, pero de bajo costo y bajo consumo de energía.| Dispositivos de bajo consumo, aplciaciones de IoT. |


## Cortex M

- [ ] *Describa brevemente las diferencias entre las familias de procesadores Cortex M0, M3 y M4.*
- [ ] *¿Por qué se dice que el set de instrucciones Thumb permite mayor densidad de código? Explique*
- [ ] *¿Qué entiende por arquitectura load-store? ¿Qué tipo de instrucciones no posee este tipo de arquitectura?*
- [ ] *¿Cómo es el mapa de memoria de la familia?*
- [ ] *¿Qué ventajas presenta el uso de los “shadowed pointers” del PSP y el MSP?*
- [ ] *Describa los diferentes modos de privilegio y operación del Cortex M, sus relaciones y como se conmuta de uno al otro. Describa un ejemplo en el que se pasa del modo privilegiado a no priviligiado y nuevamente a privilegiado.*
- [ ] *¿Qué se entiende por modelo de registros ortogonal? Dé un ejemplo*
- [ ] *¿Qué ventajas presenta el uso de intrucciones de ejecución condicional (IT)? Dé un ejemplo*
- [ ] *Describa brevemente las excepciones más prioritarias (reset, NMI, Hardfault).*
- [ ] *Describa las funciones principales de la pila. ¿Cómo resuelve la arquitectura el llamado a funciones y su retorno?*
- [ ] *Describa la secuencia de reset del microprocesador.*
- [ ] *¿Qué entiende por “core peripherals”? ¿Qué diferencia existe entre estos y el resto de los periféricos?*
- [ ] *¿Cómo se implementan las prioridades de las interrupciones? Dé un ejemplo*
- [ ] *¿Qué es el CMSIS? ¿Qué función cumple? ¿Quién lo provee? ¿Qué ventajas aporta?*
- [ ] *Cuando ocurre una interrupción, asumiendo que está habilitada ¿Cómo opera el microprocesador para atender a la subrutina correspondiente? Explique con un ejemplo*
- [ ] *¿Cómo cambia la operación de stacking al utilizar la unidad de punto flotante?*
- [ ] *Explique las características avanzadas de atención a interrupciones: tail chaining y late arrival.*
- [ ] *¿Qué es el systick? ¿Por qué puede afirmarse que su implementación favorece la portabilidad de los sistemas operativos embebidos?*
- [ ] *¿Qué funciones cumple la unidad de protección de memoria (MPU)?*
- [ ] *¿Cuántas regiones pueden configurarse como máximo? ¿Qué ocurre en caso de haber solapamientos de las regiones? ¿Qué ocurre con las zonas de memoria no cubiertas por las regiones definidas?*
- [ ] *¿Para qué se suele utilizar la excepción PendSV? ¿Cómo se relaciona su uso con el resto de las excepciones? Dé un ejemplo*
- [ ] *¿Para qué se suele utilizar la excepción SVC? Expliquelo dentro de un marco de un sistema operativo embebido.*

## ISA
- [ ] *¿Qué son los sufijos y para qué se los utiliza? Dé un ejemplo*
- [ ] *¿Para qué se utiliza el sufijo ‘s’? Dé un ejemplo*
- [ ] *¿Qué utilidad tiene la implementación de instrucciones de aritmética saturada? Dé un ejemplo con operaciones con datos de 8 bits.*
- [ ] *Describa brevemente la interfaz entre assembler y C ¿Cómo se reciben los argumentos de las funciones? ¿Cómo se devuelve el resultado? ¿Qué registros deben guardarse en la pila antes de ser modificados?*
- [ ] *¿Qué es una instrucción SIMD? ¿En qué se aplican y que ventajas reporta su uso? Dé un
ejemplo.*
