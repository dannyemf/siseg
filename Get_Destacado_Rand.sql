-- --------------------------------------------------------------------------------
-- Routine DDL
-- Descripcion: Función para obtener el id de un destacado de forma randómica (Entre los 100 últimos destacados)
-- --------------------------------------------------------------------------------
DELIMITER $$

CREATE FUNCTION `Get_Destacado_Rand`() RETURNS int(10)
BEGIN
	DECLARE id INT(10) DEFAULT 0;

	SET ID =
	(SELECT l.id
	FROM (SELECT d.id FROM sseg.destacados d ORDER BY d.fecha_publicacion DESC LIMIT 100) AS l /*1. Selecciona los 100 últimos publicados*/
	ORDER BY RAND() LIMIT 1 /*2. De los 100 últimos, selecciona uno al azar*/
	);
	
	RETURN id;
END
