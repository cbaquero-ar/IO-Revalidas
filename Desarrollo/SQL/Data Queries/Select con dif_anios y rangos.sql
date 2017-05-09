--Obtiene el piso de la diferencia en años desde el ingreso hasta la inscripción al plan de reválidas, además 2 atributos más clasificandolo en rangos de 5 y de 2 años.
SELECT  
	date_part('year',fecha_inscripcion)-anio_ingreso as dif_anios_ingreso_total, 	 
	floor((date_part('year',fecha_inscripcion)-anio_ingreso)/2)-4 as dif_anios_ingreso_rangos_de_2,
	floor((date_part('year',fecha_inscripcion)-anio_ingreso)/3)-2 as dif_anios_ingreso_rangos_de_3,
	floor((date_part('year',fecha_inscripcion)-anio_ingreso)/4)-1 as dif_anios_ingreso_rangos_de_4,
	floor((date_part('year',fecha_inscripcion)-anio_ingreso)/5)-1 as dif_anios_ingreso_rangos_de_5,
	plan,
	finales_adeudados,
	cursadas_adeudadas,
	optativas_adeudadas,
	adeuda_trab_final_inicio,
	tutor_r1,
	tutor_r2,
	graduado
	FROM revalidas 
	WHERE usable=TRUE

SELECT  
	date_part('year',fecha_inscripcion)-anio_ingreso as dif_anios_ingreso_total, 	 	
	plan,
	finales_adeudados,
	cursadas_adeudadas,
	optativas_adeudadas,
	adeuda_trab_final_inicio,
	tutor_r1,
	tutor_r2,
	graduado
	FROM revalidas 
	WHERE usable=TRUE