DROP VIEW IF EXISTS `vista_estadistica_postulantes`;
CREATE VIEW `vista_estadistica_postulantes` AS
SELECT
    o.id ide_oferta,
    count(p.id) as postulantes_total,
    count(CASE WHEN (p.estado in ('postulante','entrevista','no_presento','no_contratado','contratado')) THEN 1 ELSE NULL END) AS postulantes_postulaciones,
    count(CASE WHEN (p.estado in ('entrevista','no_presento','no_contratado','contratado')) THEN 1 ELSE NULL END) AS postulantes_preselecionados,
    count(CASE WHEN (p.estado = 'entrevista') THEN 1 ELSE NULL END) AS postulantes_pendientes,
    count(CASE WHEN (p.estado = 'no_presento') THEN 1 ELSE NULL END) AS postulantes_no_presentaron,
    count(CASE WHEN (p.estado = 'no_contratado') THEN 1 ELSE NULL END) AS postulantes_no_contratados,
    count(CASE WHEN (p.estado = 'contratado') THEN 1 ELSE NULL END) AS postulantes_contratados,
    count(CASE WHEN (p.email_estado = 'OK') THEN 1 ELSE NULL END) AS emails_validos,
    count(CASE WHEN (p.email_estado = 'ERROR') THEN 1 ELSE NULL END) AS emails_no_validos,
    count(CASE WHEN (p.email_enviado <> 'N') THEN 1 ELSE NULL END) AS emails_enviados,
    count(CASE WHEN (p.email_enviado = 'N' and p.email_estado = 'OK') THEN 1 ELSE NULL END) AS emails_no_enviados
FROM oferta_laboral o LEFT JOIN oferta_laboral_postulante p on p.ide_oferta = o.id
GROUP BY o.id;
