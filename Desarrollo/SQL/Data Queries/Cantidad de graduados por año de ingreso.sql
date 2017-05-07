select anio_ingreso, SUM(CASE WHEN graduado = true THEN 1 ELSE 0 END) AS Graduados, SUM(CASE WHEN graduado = false THEN 1 ELSE 0 END) AS NoGraduados
from revalidas 
group by anio_ingreso
order by anio_ingreso desc

