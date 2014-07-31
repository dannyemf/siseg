-- --------------------------------------------------------------------------------
-- Routine DDL
-- Note: comments before and after the routine body will not be stored by the server
-- --------------------------------------------------------------------------------
DELIMITER $$

CREATE FUNCTION `IsNumeric`(sIn varchar(1024)) RETURNS tinyint(4)
RETURN sIn REGEXP '^(-|\\+){0,1}([0-9]+\\.[0-9]*|[0-9]*\\.[0-9]+|[0-9]+)$'
