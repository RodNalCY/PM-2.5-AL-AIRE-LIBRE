SELECT
	tbusuarios.nombres,
	tbusuarios.email,
	tbestacion.estacion,
	tbestacion.latitud,
	tbestacion.longitud,
	tbsensor.sensor,
	tbsensor.modelo,
	tbmedidas_co.monoxido,
	tbmedidas_co.f_registro,
	tbmedidas_humedad.humedad,
	tbmedidas_humedad.f_registro,
	tbmedidas_temperatura.temperatura,
	tbmedidas_temperatura.f_registro 
FROM
	tbsensor
	INNER JOIN tbestacion ON tbsensor.tbestacion_id_estacion = tbestacion.id_estacion
	INNER JOIN tbusuarios ON tbestacion.tbusuarios_id_usuarios = tbusuarios.id_usuarios
	LEFT JOIN tbmedidas_co ON tbmedidas_co.tbsensor_cod_sensor = tbsensor.cod_sensor
	LEFT JOIN tbmedidas_temperatura ON tbmedidas_temperatura.tbsensor_cod_sensor = tbsensor.cod_sensor
	LEFT JOIN tbmedidas_humedad ON tbmedidas_humedad.tbsensor_cod_sensor = tbsensor.cod_sensor 
	WHERE 
		tbmedidas_co.f_registro = (SELECT MAX(p.f_registro) FROM tbmedidas_co AS p)
		or tbmedidas_humedad.f_registro = (SELECT MAX(d.f_registro) FROM tbmedidas_humedad AS d)
		or tbmedidas_temperatura.f_registro = (SELECT MAX(s.f_registro) FROM tbmedidas_temperatura AS s)
