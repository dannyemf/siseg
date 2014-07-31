-- --------------------------------------------------------------------------------
-- Routine DDL
-- Note: comments before and after the routine body will not be stored by the server
-- --------------------------------------------------------------------------------
DELIMITER $$

CREATE FUNCTION `NumericOnly`(val VARCHAR(255)) RETURNS varchar(255) CHARSET latin1
BEGIN

DECLARE idx INT DEFAULT 0;
IF ISNULL(val) THEN RETURN NULL; END IF;

IF LENGTH(val) = 0 THEN RETURN ""; END IF;

SET idx = LENGTH(val);
WHILE idx > 0 DO
IF IsNumeric(SUBSTRING(val,idx,1)) = 0 THEN
 SET val = REPLACE(val,SUBSTRING(val,idx,1),"");
 SET idx = LENGTH(val)+1;
END IF;
SET idx = idx - 1;
END WHILE;
RETURN val;

RETURN 1;
END
