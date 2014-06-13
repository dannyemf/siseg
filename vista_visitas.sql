DROP VIEW IF EXISTS `vista_visitas`;
CREATE VIEW `vista_visitas` AS
    select 
		count(v.id) as total, 
		count(case when v.fecha = date(now()) then 0 else null end) as hoy,
		(select count(p.id) from contador_visitas_pagina p) as paginas
	from contador_visitas v
