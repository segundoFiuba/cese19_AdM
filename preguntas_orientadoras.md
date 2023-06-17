## Preguntas orientadoras

- [X]  **Describa brevemente los diferentes perfiles de familias de microprocesadores/microcontroladores de ARM. Explique alguna de sus diferencias características.**

|Familia |Ejemplos |Características |Casos de uso |
---| ---| ---| ---|
Cortex A| A5, A7, A9| Microcontroladores de alto rendimiento, con mayores capacidades de memoria y soporte para sistemas operativos| Teléfonos celulares, dispositivos móviles.|
Cortex R| R4, R5, R7, R8| Microcontroladores de alto rendimiento con capacidades de tiempo real, orientados a sistemas críticos| Equipos médicos, controladores para automóviles y equipamiento de la industria espacial.|
Cortex M| M0, M0+, M3, M4 | Microcontroladores de menor rendimiento y capacidades, pero de bajo costo y bajo consumo de energía.| Dispositivos de bajo consumo, aplciaciones de IoT. |


## Cortex M

- [X] **Describa brevemente las diferencias entre las familias de procesadores Cortex M0, M3 y M4.**
      
Mientras que los Cortex M3 y M4 están basados sobre la arquitectura ARMv7, el M0 está basado sobre ARMv6-M. Si bien estas arquitecturas son similares, el set de instrucciones de la última versión es mayor. Por otro lado, el Cortex M4 tiene soporte para más instrucciones, como son las Single Instruction Multiple Data (SIMD), y operaciones de punto flotante en algunos procesadores.
- [X] **¿Por qué se dice que el set de instrucciones Thumb permite mayor densidad de código? Explique**
      
El set de instrucciones Thumb permite mayor densidad de código dado que contiene instrucciones de 16 bits, a diferencia del set de intstrucciones ARM que solo soporta instrucciones de 32 bits. Esto permite generar código que ocupe menos lugar, o bien que sea más denso.
- [X] **¿Qué entiende por arquitectura load-store? ¿Qué tipo de instrucciones no posee este tipo de arquitectura?**
      
La arquitectura load-store se llama así porque para poder producir un cambio en la memoria primero debe cargar el valor en un registro (load), luego modificar el valor del registro, y luego guardar este valor en la memoria (store). Este tipo de arquitecturas no posee instrucciones que escriban directamente valores en la memoria.
- [X] **¿Cómo es el mapa de memoria de la familia?**
      
El mapa de memoria es lineal y unificado, lo cual significa que aunque haya más de un bus, solo hay 4GB de espacio de memoria. Además, el mapa de memoria es consistente en la familia, lo que permite optimizar el código y reusarlo.
El mapa de memoria está particionado en las siguientes áreas: código del programa, acceso de datos, periféricos y control y debug. No obstante, la arquitectura otorga flexibilidad para poder utilizar otras áreas para un objetivo distinto al del original. 
- [X] **¿Qué ventajas presenta el uso de los “shadowed pointers” del PSP y el MSP?**
      
La diferenciación entre Program Stack Pointer y Main Stack Pointer ayuda a que el procesador sea más apto para correr un sistema operativo. De este modo, al tener dos punteros de stack, uno puede ser usado por el sistema operativo, mientras que el otro se usa por la tarea que está corriendo. De este modo, en caso de que una tarea comprometa al PSP y rompa el stack, el MSP no se ve afectado,  por lo que el sistema operativo puede seguir trabajando y no se ven afectadas las demás tareas. 
- [X] **Describa los diferentes modos de privilegio y operación del Cortex M, sus relaciones y como se conmuta de uno al otro. Describa un ejemplo en el que se pasa del modo privilegiado a no priviligiado y nuevamente a privilegiado.**
      
El Cortex M3/M4 tiene dos modos de privilegio, un modo privilegiado y un modo no priviliegiado. En el modo no privilegiado se puede, a través del MPU, evitar que una tarea no privilegiada acceda a partes de la memoria que no debe, como pueden ser los registros de las iterrupciones. Además, esto ayuda a permitir la ejecución de sistemas operativos, en que las tareas corren con acceso limitado a la memoria, y el SO puede acceder a toda la memoria.
- [X] **¿Qué se entiende por modelo de registros ortogonal? Dé un ejemplo**
      
El modelo otrogonal se refiere a que las instrucciones y los modos de address son independientes, lo que significa que las instrucciones pueden llamar de distintos modos.
- [X] **¿Qué ventajas presenta el uso de intrucciones de ejecución condicional (IT)? Dé un ejemplo**
      
La ejecución condicional permite ejecutar instrucciones (hasta 4), condicional a la instrucción IT (IF-THEN) y al valor de los flags de estatus. Esto permite generar código condicional sin la necesidad de crear una rama. 
- [X] **Describa brevemente las excepciones más prioritarias (reset, NMI, Hardfault).**
      
Las excepciones Reset, NMI y Hardfault son las más prioritarias, por lo que se encuentran en el comienzo del NVIC. El reset es un tipo especial de excepción, ya que cuando el procesador sale de éste, ejecuta el Handler en modo Thread. Pueden haber tres tipos de resets, Power On Reset, System Reset y Processor Reset.
El Non Maskable Interrupt o NMI es una excepción que puede ser llamada por un watchdog timer o un burnout detector. En escencia, es una excepción de la mayor prioridad después del Reset, y se usa para proteger al dispositivo. Se dice que no es enmascarable porque no puede ser deshabilitado por software.
El Hardfault es una excepción de alta prioridad que se ejecuta cuando no otras excepciones se encuentran deshabilitadas, como puede ser una excepción de Bus o de memoria.
- [X] **Describa las funciones principales de la pila. ¿Cómo resuelve la arquitectura el llamado a funciones y su retorno?**
      
El stack es una región de memoria de tipo LIFO que se utiliza como un buffer de datos de ejecución. De acuerdo a una Application Binary Interface (ABI), se define el llamado a funciones como una manera de guardar y recuperar los datos de la pila. Cuando se llama a una función, la ABI define qué valores se deben guardar en el tope de la pila (SP, argumentos, variables) y en qué orden, de este modo si todas las funciones siguen estas reglas, pueden pasarse datos de manera ordenada y predecible en el stack.
- [X] **Describa la secuencia de reset del microprocesador.**
      
Cuando ocurre un evento de reset, el procesador espera a recibir una señal de clock, la cual puede tardar en estabilizarse si proviene de un cristal oscilador que acaba de recibir tensión. Una vez que lo recibe, el procesador lee las primeras dos palabras de la memoria, que contienen al valor inicial del MSP y el vector de reset, que contiene la dirección del Reset Handler. Luego de leer esos dos valores, el procesador setea el MSP y el PC con éstos y comienza a ejecutar las instrucciones del programa.
- [X] **¿Qué entiende por “core peripherals”? ¿Qué diferencia existe entre estos y el resto de los periféricos?**
      
Los Cortex M3 y M4 son microprocesadores, y no microcontroladores, lo cual significa que distintos vendors que los utilicen en sus distintos diseños de microcontroladores pueden agregarles distintos periféricos, como puede ser una memoria distinta, reguladores de tensión, I/Os, circuitos de soporte, etc. Dada estas posibles diferencias entre los microcontroladores, se entiende por Core Peripherals a aquellos que se encuentran dentro del microprocesador y que no dependen del vendor. Entre estos se incluye el NVIC.
- [X] **¿Cómo se implementan las prioridades de las interrupciones? Dé un ejemplo**
      
Las interrupciones pueden configurarse con un nivel de prioridad, lo cual puede provocar que el procesador salte del handler de una interrupción para atender a otra interrupción de mayor prioridad. Por ejemplo, si durante la ejecución del handler de una interrupción con prioridad X ocurre otra interrupción con prioridad Y: Y>X, entonces se pasa a ejecutar el handler de la interrupción Y, y cuando éste termine se continua ejecutando handler de X.
- [X] **¿Qué es el CMSIS? ¿Qué función cumple? ¿Quién lo provee? ¿Qué ventajas aporta?**
      
El Cortex Microcontroler Software Interface Standar es un estándar distribuido como header files que provee ARM que apunta a estandarizar el desarrollo sobre dispositivos ARM de distintos fabricantes. Mediante una serie de reglas y recomendaciones, se tiene como resultado que el código desarrollado en para un microcontrolador puede ser fácilmente portado a otro de otro fabricante.
- [X] **Cuando ocurre una interrupción, asumiendo que está habilitada ¿Cómo opera el microprocesador para atender a la subrutina correspondiente? Explique con un ejemplo**
      
Se realizan los siguientes pasos:
1- Se termina de ejecutar la instrucción que está siendo ejecutada.

2- Se apilan varios registros, incluyendo la dirección de retorno.

3- Se busca el vector de la interrupción que apunta al handler.

4- Se actualizan varios registros, incluyendo los del NVIC, el PC, el SP y el LR con la dirección de retorno.

5- Cuando se recupera la dirección del handler se comienzan a ejecutar las instrucciones de este

6- Se retorna con la dirección de retorno apuntada por LR.

- [ ] **¿Cómo cambia la operación de stacking al utilizar la unidad de punto flotante?**
      
- [ ] **Explique las características avanzadas de atención a interrupciones: tail chaining y late arrival.**
      
- [X] **¿Qué es el systick? ¿Por qué puede afirmarse que su implementación favorece la portabilidad de los sistemas operativos embebidos?**
      
El systick o System Tick es un tipo de excepción integrada en el NVIC, que utiliza la señal de clock del procesador o una señal externa para generar interrupciones de manera periódica. Esto favorece a la portabilidad de los sistemas operativos ya que permite particionar el tiempo en períodos, y a partir de estos otorgar distintos momentos de procesamiento a distintas tareas. Dado que los sistemas operativos son programas que a su vez corren otros programas o tareas, tener un método de  distribuir el poder de cómputo es vital para su funcionamiento.
- [X] **¿Qué funciones cumple la unidad de protección de memoria (MPU)?**
      
La unidad de protección de memoria es una característica opcional en los Cortex M3 y M4 que se puede usar para definir espacios de memoria que solo pueden ser accedidos en modo privilegiado, y espacios de memoria que pueden ser cacheados. 
- [X] **¿Cuántas regiones pueden configurarse como máximo? ¿Qué ocurre en caso de haber solapamientos de las regiones? ¿Qué ocurre con las zonas de memoria no cubiertas por las regiones definidas?**
      
El MPU puede soportar hasta 8 regiones, donde cada una se puede configurar con su propia dirección de acceso, tamaño y configuración. Si una dirección está solapada por dos regiones, entonces el acceso a memoria estará dictado por aquella dirección con el número más alto. Si por el contrario una tarea quisiera acceder a una memoria que no está en ninguna región y con el MPU configurado entonces se generaría una excepción por acceso inapropiado (fault exception).
- [X] **¿Para qué se suele utilizar la excepción PendSV? ¿Cómo se relaciona su uso con el resto de las excepciones? Dé un ejemplo**
      
La excepción PendSV se suele utilizar para realizar cambios de contexto, usualmente dentro de un sistema operativo para llamar cambiar de una tarea a otra. Se define como la excepción de menor prioridad, lo cual permite que un cambio de contexto no afecte la ejecución de una interrupción. Al realizar el cambio de contexto en la excepción de menor prioridad, se puede atender a una interrupción sin esperar a que se ejecute una tarea durante un período.
- [X] **¿Para qué se suele utilizar la excepción SVC? Expliquelo dentro de un marco de un sistema operativo embebido.**
      
La Supervisor Call Exception, o SVC, es una excepción que se genera con la instrucción homónima y que se utiliza para realizar llamados a funciones del sistema operativo.  Por ejemplo, para evitar que un usuario haga uso directo de un periférico, el sistema operativo lo puede hacer accesible a través de una SVC, y el SO puede decidir qué hacer con el recurso.

## ISA
- [X] **¿Qué son los sufijos y para qué se los utiliza? Dé un ejemplo**
      
Los sufijos se agregan a algunas instrucciones de manera opcional. Éstos tienen como objetivo cambiar el resultado de la instrucción, como puede ser el sufijo ‘s’, que cambia los flags de APSR, o los sufijos para ejecución condicional.
- [X] **¿Para qué se utiliza el sufijo ‘s’? Dé un ejemplo**
      
El sufijo ‘s’ se utiliza para indicarle al procesador que debe actualizar los valores de la ASPR (Application Program Status Register) con el resultado de la instrucción.
- [X] **¿Qué utilidad tiene la implementación de instrucciones de aritmética saturada? Dé un ejemplo con operaciones con datos de 8 bits.**
      
La aritmética saturada es particularmente util en el procesamiento de señales, en donde una señal puede ser amplificada a más del rango permisible por el tipo de dato. En lugar de realizar un overflow se limita al máximo, y se evita que se distorsione más la señal. Por ejemplo, para un tipo de datos de 8 bits sin signo, el numero máximo es 255, por lo que si se intenta superar este número con una suma o una multiplicación, este saturará en 255.
- [X] **Describa brevemente la interfaz entre assembler y C ¿Cómo se reciben los argumentos de las funciones? ¿Cómo se devuelve el resultado? ¿Qué registros deben guardarse en la pila antes de ser modificados?**
      
Los parámetros de una función se pasan en los registros r0 a r3, y estos pueden ser modificados por la función llamada. Los registros mayores a estos deben ser devueltos a la función llamadora, por lo que deben apilarse antes de usarlos y desapilarlos antes de retornar. El valor retornado se devuelve en r0.
- [ ] **¿Qué es una instrucción SIMD? ¿En qué se aplican y que ventajas reporta su uso? Dé un
ejemplo.**

Las instrucciones Single Instruction Multiple Data o SIMD son instrucciones que reciben operandos de una palabra (32 bits) y permiten tratarlos como si fueran compuestos por varios tipos de datos más chicos, como 2 de 16 bits o 4 de 8 bits. Por ejemplo, se pueden sumar dos operandos A y B de 32 bits pero sumando el primer byte de A con el primero de B, el segundo de A con el segundo de B, etc., pero todo con una sola instrucción y en un ciclo de reloj.
