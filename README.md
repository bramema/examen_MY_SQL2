# examen_MY_SQL2
Objetivo: Evaluar la comprensión de los triggers y su aplicación en la lógica del sistema.

Enunciado:

Crea un trigger SQL que, al insertar una nueva membresía, calcule y complete automáticamente la fecha de vencimiento sumando 30 días a la fecha de inicio.
El trigger debe ejecutarse después de insertar (AFTER INSERT) una membresía.
La fecha de vencimiento debe guardarse en el mismo registro de la membresía.
Incluye un comentario explicando brevemente cómo funciona el trigger.

¿Qué hace?

Cuando se inserta una membresía nueva, el trigger calcula la fecha de vencimiento (fecha_fin) sumando 30 días a la fecha de inicio (fecha_inicio) y la guarda en el mismo registro.

Nota sobre AFTER INSERT

El enunciado pedía AFTER INSERT, pero MySQL no deja modificar la fila recién insertada desde un trigger AFTER


¿Cómo funciona?
1. Cada vez que se va a insertar una membresía nueva, MySQL ejecuta
   este trigger ANTES de guardar la fila.
2. NEW.fecha_inicio es la fecha de inicio que se está insertando.
3. Le sumamos 30 días con DATE_ADD y guardamos el resultado en
   NEW.fecha_fin, que es la fecha de vencimiento de la membresía.
4. Como la fila todavía no se ha guardado, la fecha_fin queda
    en el mismo registro de la membresía.
