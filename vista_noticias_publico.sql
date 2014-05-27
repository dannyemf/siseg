DROP VIEW IF EXISTS `vista_noticias_publico`;
CREATE VIEW `vista_noticias_publico` AS
SELECT 
	n.*, 
	u.usuario as user, 
	concat(u.nombre,' ', u.apellido) as user_name
FROM 
	noticia n, usuarios u
where
	n.user_id = u.id
	AND n.estado = 'publicada'
order by
	n.fecha_publicacion desc
;
