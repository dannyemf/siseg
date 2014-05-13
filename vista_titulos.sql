CREATE VIEW `vista_titulos` AS
    select 
        `t`.`ide_titulo` AS `ide_titulo`,
        `t`.`ide_exalumno` AS `ide_exalumno`,
        `t`.`ide_carrera` AS `ide_carrera`,
        `t`.`nombre_titulo` AS `nombre_titulo`,
        `t`.`nivel_estudio` AS `nivel_estudio`,
        `t`.`fecha_ingreso` AS `fecha_ingreso`,
        `t`.`fecha_egreso` AS `fecha_egreso`,
        `t`.`fecha_graduacion` AS `fecha_graduacion`,
        `t`.`tema_tesis` AS `tema_tesis`,
        `t`.`titulado` AS `titulado`,
        `p`.`nombres_exalumno` AS `nombres_exalumno`,
        `p`.`apellidos_exalumno` AS `apellidos_exalumno`
    from
        (`titulados` `t`
        join `datospersonales` `p` ON ((`t`.`ide_exalumno` = `p`.`ide_exalumno`)))
