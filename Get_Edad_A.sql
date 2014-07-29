-- --------------------------------------------------------------------------------
-- Routine DDL
-- Note: comments before and after the routine body will not be stored by the server
-- --------------------------------------------------------------------------------
DELIMITER $$

CREATE FUNCTION `Get_Edad_A`(fecha_nacimiento DATE, fecha_actual DATE) RETURNS int(11)
BEGIN
	DECLARE edad INT DEFAULT 0;
	SET edad =(SELECT (YEAR(fecha_actual)-YEAR(fecha_nacimiento)) - (RIGHT(fecha_actual,5)<RIGHT(fecha_nacimiento,5)));
RETURN edad;
END
