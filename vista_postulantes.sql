DROP VIEW IF EXISTS `vista_postulantes`;
CREATE VIEW `vista_postulantes` AS
SELECT 
o.id ide_oferta, o.puesto, o.salario, o.descripcion, o.postulacion_desde, o.postulacion_hasta, o.fecha_entrevista fecha_entrevista_oferta, o.ubicacion, o.estado estado_oferta, o.sexo, o.edad, o.edad_desde, o.edad_hasta,
p.id, p.ide_titulo, p.ide_carrera, p.estado, p.fecha_postulacion, p.email, p.email_estado, p.email_enviado, p.fecha_entrevista fecha_entrevista_postulante,
d.ide_exalumno, d.nombres_exalumno, d.apellidos_exalumno,
e.ide_empleador, e.nombre_empresa, e.email email_empleador, e.nombre nombres_empleador, e.apellido apellidos_empleador, e.logo
FROM
oferta_laboral_postulante p join oferta_laboral o on p.ide_oferta = o.id join empleadores e on o.ide_empleador = e.ide_empleador join datospersonales d on p.ide_exalumno = d.ide_exalumno;
