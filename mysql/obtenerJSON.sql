set global sql_mode='STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
set session sql_mode='STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
SELECT * FROM ((SELECT * FROM(SELECT
 tbestacion.estacion,
 tbestacion.latitud,
 tbestacion.longitud,
 tbestacion.ciudad,
 tbsensor.sensor,
 tbsensor.modelo,
 tbsensor.marca,
 co.tbsensor_cod_sensor, 
 co.medida,
 co.f_registro,
 co.estado
FROM
tbmedidas_co AS co
INNER JOIN tbsensor ON co.tbsensor_cod_sensor = tbsensor.cod_sensor
INNER JOIN tbestacion ON tbsensor.tbestacion_id_estacion = tbestacion.id_estacion
ORDER BY
co.f_registro DESC) as c GROUP BY c.tbsensor_cod_sensor)
UNION
(SELECT * FROM(SELECT
 tbestacion.estacion,
 tbestacion.latitud,
 tbestacion.longitud,
 tbestacion.ciudad,
 tbsensor.sensor,
 tbsensor.modelo,
 tbsensor.marca,
 t.tbsensor_cod_sensor, 
 t.medida,
 t.f_registro,
 t.estado
FROM
tbmedidas_temperatura AS t
INNER JOIN tbsensor ON t.tbsensor_cod_sensor = tbsensor.cod_sensor
INNER JOIN tbestacion ON tbsensor.tbestacion_id_estacion = tbestacion.id_estacion
ORDER BY
t.f_registro DESC) as c GROUP BY c.tbsensor_cod_sensor)
UNION
(SELECT * FROM(SELECT
 tbestacion.estacion,
 tbestacion.latitud,
 tbestacion.longitud,
 tbestacion.ciudad,
 tbsensor.sensor,
 tbsensor.modelo,
 tbsensor.marca,
 h.tbsensor_cod_sensor, 
 h.medida,
 h.f_registro,
 h.estado
FROM
tbmedidas_humedad AS h
INNER JOIN tbsensor ON h.tbsensor_cod_sensor = tbsensor.cod_sensor
INNER JOIN tbestacion ON tbsensor.tbestacion_id_estacion = tbestacion.id_estacion
ORDER BY
h.f_registro DESC) as c GROUP BY c.tbsensor_cod_sensor)
UNION
(SELECT * FROM(SELECT
 tbestacion.estacion,
 tbestacion.latitud,
 tbestacion.longitud,
 tbestacion.ciudad,
 tbsensor.sensor,
 tbsensor.modelo,
 tbsensor.marca,
 pm.tbsensor_cod_sensor, 
 pm.medida,
 pm.f_registro,
 pm.estado
FROM
tbmedidas_pm25 AS pm
INNER JOIN tbsensor ON pm.tbsensor_cod_sensor = tbsensor.cod_sensor
INNER JOIN tbestacion ON tbsensor.tbestacion_id_estacion = tbestacion.id_estacion
ORDER BY
pm.f_registro DESC) as c GROUP BY c.tbsensor_cod_sensor)

) as cy ORDER BY cy.ciudad ASC;
-- ----------------------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------------------
-- PROCEDIMIENTO ALMACENADO
-- ----------------------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS megaconsulta;
DELIMITER &&
CREATE PROCEDURE megaconsulta()
BEGIN
set global sql_mode='STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
set session sql_mode='STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
SELECT * FROM ((SELECT * FROM(SELECT
 tbestacion.estacion,
 tbestacion.latitud,
 tbestacion.longitud,
 tbestacion.ciudad,
 tbsensor.sensor,
 tbsensor.modelo,
 tbsensor.marca,
 co.tbsensor_cod_sensor, 
 co.medida,
 co.f_registro,
 co.estado
FROM
tbmedidas_co AS co
INNER JOIN tbsensor ON co.tbsensor_cod_sensor = tbsensor.cod_sensor
INNER JOIN tbestacion ON tbsensor.tbestacion_id_estacion = tbestacion.id_estacion
ORDER BY
co.f_registro DESC) as c GROUP BY c.tbsensor_cod_sensor)
UNION
(SELECT * FROM(SELECT
 tbestacion.estacion,
 tbestacion.latitud,
 tbestacion.longitud,
 tbestacion.ciudad,
 tbsensor.sensor,
 tbsensor.modelo,
 tbsensor.marca,
 t.tbsensor_cod_sensor, 
 t.medida,
 t.f_registro,
 t.estado
FROM
tbmedidas_temperatura AS t
INNER JOIN tbsensor ON t.tbsensor_cod_sensor = tbsensor.cod_sensor
INNER JOIN tbestacion ON tbsensor.tbestacion_id_estacion = tbestacion.id_estacion
ORDER BY
t.f_registro DESC) as c GROUP BY c.tbsensor_cod_sensor)
UNION
(SELECT * FROM(SELECT
 tbestacion.estacion,
 tbestacion.latitud,
 tbestacion.longitud,
 tbestacion.ciudad,
 tbsensor.sensor,
 tbsensor.modelo,
 tbsensor.marca,
 h.tbsensor_cod_sensor, 
 h.medida,
 h.f_registro,
 h.estado
FROM
tbmedidas_humedad AS h
INNER JOIN tbsensor ON h.tbsensor_cod_sensor = tbsensor.cod_sensor
INNER JOIN tbestacion ON tbsensor.tbestacion_id_estacion = tbestacion.id_estacion
ORDER BY
h.f_registro DESC) as c GROUP BY c.tbsensor_cod_sensor)
UNION
(SELECT * FROM(SELECT
 tbestacion.estacion,
 tbestacion.latitud,
 tbestacion.longitud,
 tbestacion.ciudad,
 tbsensor.sensor,
 tbsensor.modelo,
 tbsensor.marca,
 pm.tbsensor_cod_sensor, 
 pm.medida,
 pm.f_registro,
 pm.estado
FROM
tbmedidas_pm25 AS pm
INNER JOIN tbsensor ON pm.tbsensor_cod_sensor = tbsensor.cod_sensor
INNER JOIN tbestacion ON tbsensor.tbestacion_id_estacion = tbestacion.id_estacion
ORDER BY
pm.f_registro DESC) as c GROUP BY c.tbsensor_cod_sensor)

) as cy ORDER BY cy.ciudad ASC;
END &&
DELIMITER ;

CALL megaconsulta();

