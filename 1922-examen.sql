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

 

