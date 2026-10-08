-- =========================================
-- TRIGGER 01
-- Insertar fecha de vencimiento automáticamente al crear una nueva membresía.
-- =========================================

delimiter $$

CREATE TRIGGER trg_membresia_fecha_vencimiento
BEFORE INSERT ON membresia
FOR EACH ROW
BEGIN
    SET NEW.fecha_fin = DATE_ADD(NEW.fecha_inicio, INTERVAL 30 DAY);
END$$
 
DELIMITER ;


USE coworking_db;
 

INSERT INTO membresia (id_usuario, id_tipo, estado, fecha_inicio, fecha_fin)
VALUES (1, 2, 'Pendiente', '2026-10-08', '2026-10-09');

SELECT id_membresia, id_usuario, estado, fecha_inicio, fecha_fin,
       DATEDIFF(fecha_fin, fecha_inicio) AS dias_de_diferencia
FROM membresia
WHERE id_membresia = LAST_INSERT_ID();
 
 

