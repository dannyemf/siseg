-- --------------------------------------------------------------------------------
-- Routine DDL
-- Note: comments before and after the routine body will not be stored by the server
-- --------------------------------------------------------------------------------
DELIMITER $$

CREATE FUNCTION `Get_Edad`(fecha_nacimiento DATE) RETURNS int(11)
BEGIN
	DECLARE edad INT DEFAULT 0;
	SET edad =(SELECT (YEAR(CURDATE())-YEAR(fecha_nacimiento)) - (RIGHT(CURDATE(),5)<RIGHT(fecha_nacimiento,5)));
RETURN edad;
END
