
use comparticionvehiculos;

-- EJERCICIO 1

drop table if exists aseguradoras;

create table if not exists aseguradoras(
id SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50),
num_poliza VARCHAR(10)  UNIQUE,
tipo ENUM('TERCEROS', 'TODO RIESGO', 'LUNAS', 'TERCEROS AMPLIADO'),
fecha_inicio date NOT NULL, 
prima FLOAT UNSIGNED,
matricula VARCHAR(10) not null,
tomador VARCHAR(9) NOT NULL, 
FOREIGN KEY (matricula) REFERENCES vehiculos(matricula),
FOREIGN KEY (tomador) REFERENCES conductores(dni) 
);

-- EJERCICIO 2

INSERT INTO clientes VALUES 
('30123456','Pedro','López','Sánchez','Córdoba','2025-07-10');


-- EJERCICIO 3

SELECT t.* 
FROM trayectos t 
INNER JOIN conductores c ON t.dni_conductor = c.dni
 WHERE c.dni='58798845B' 
 AND (t.origen='Sevilla' OR t.precio BETWEEN 10 AND 15);


-- EJERCICIO 4

SELECT c.nombre, CONCAT(apellido1," ", apellido2) as Apellidos,  v.matricula, v.marca, v.modelo FROM conductores c 
INNER JOIN vehiculos v ON c.dni=v.dni_conductor;

-- EJERCICIO 5
DELETE r.* 
FROM reservas r INNER join clientes c on r.dni_cliente = c.dni 
WHERE (r.dni_cliente = "01005859G" AND r.dni_cliente = "01919119M") || r.fecha_reserva="2024-07-07";

select *
from clientes;
