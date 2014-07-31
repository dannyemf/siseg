DROP VIEW IF EXISTS `vista_ofertas_publico`;
CREATE VIEW `vista_ofertas_publico` AS
SELECT
o.id ide_oferta, o.puesto, o.salario, o.descripcion, o.postulacion_desde, o.postulacion_hasta, o.fecha_entrevista, o.ubicacion, o.estado, o.sexo, o.edad,
e.ide_empleador, e.nombre_empresa, e.logo,
(case when date(now()) >= o.postulacion_desde and date(now()) <= o.postulacion_hasta then 1 else 0 end) as fecha_aplicable
FROM
oferta_laboral o, empleadores e
WHERE
o.ide_empleador = e.ide_empleador
ORDER BY
o.fecha_publicacion desc;
