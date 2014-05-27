DROP VIEW IF EXISTS `vista_noticias`;
CREATE VIEW `vista_noticias` AS
SELECT 
	n.*, 
	u.usuario as user, 
	concat(u.nombre,' ', u.apellido) as user_name
FROM 
	noticia n, usuarios u
where
	n.user_id = u.id
;
