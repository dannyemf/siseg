DROP VIEW IF EXISTS `vista_posibles_postulantes`;
CREATE VIEW `vista_posibles_postulantes` AS
SELECT 
o.id ide_oferta, o.puesto, o.salario, o.descripcion, o.postulacion_desde, o.postulacion_hasta, o.fecha_entrevista, o.ubicacion, o.estado,
t.ide_titulo, t.ide_carrera, t.fecha_ingreso, t.fecha_egreso, t.fecha_graduacion,
d.ide_exalumno, d.apellidos_exalumno, d.nombres_exalumno, d.email, d.sexo,
e.ide_empleador, e.nombre_empresa
FROM 
titulados t, datospersonales d, oferta_laboral o, oferta_laboral_carrera oc, empleadores e
WHERE
t.ide_exalumno = d.ide_exalumno
AND oc.ide_oferta = o.id
AND t.ide_carrera = oc.ide_carrera
AND o.ide_empleador = e.ide_empleador
AND t.estado = 'validado'
AND (o.sexo = 2 OR o.sexo = d.sexo)
AND ((o.edad = 0) or (o.edad = 1 AND(Get_Edad_A(d.fecha_nacimiento, DATE(o.fecha_creacion)) BETWEEN o.edad_desde and o.edad_hasta)))
GROUP BY o.id, t.ide_exalumno
ORDER BY
t.ide_carrera, d.apellidos_exalumno, d.nombres_exalumno;
