CREATE VIEW `vista_inscritos_evento` AS
    select 
        `r`.`id` AS `id`,
        `r`.`ide_evento` AS `ide_evento`,
        `r`.`ide_exalumno` AS `ide_exalumno`,
        `r`.`ide_carrera` AS `ide_carrera`,
        `r`.`fecha_registro` AS `fecha_registro`,
        `d`.`apellidos_exalumno` AS `apellidos_exalumno`,
        `d`.`nombres_exalumno` AS `nombres_exalumno`,
        `d`.`email` AS `email`,
        `d`.`telefono_domicilio` AS `telefono_domicilio`,
        `d`.`telefono_celular` AS `telefono_celular`,
        `c`.`siglas_area` AS `siglas_area`,
        `c`.`nombre_carrera` AS `nombre_carrera`
    from
        (((`eventos` `e`
        join `eventos_registro` `r`)
        join `datospersonales` `d`)
        join `carreras` `c`)
    where
        ((`r`.`ide_evento` = `e`.`id`)
            and (`r`.`ide_exalumno` = `d`.`ide_exalumno`)
            and (`r`.`ide_carrera` = `c`.`ide_carrera`))
    order by `c`.`siglas_area` , `c`.`nombre_carrera` , `d`.`apellidos_exalumno` , `d`.`nombres_exalumno`
