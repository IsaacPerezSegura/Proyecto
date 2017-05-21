Create database Escuela;
Use Escuela;

create table Materia(
IdMateria int Not Null auto_increment,
Nombre char(100) Not Null,
Semestre int Not Null,
Creditos int,
primary key(IdMateria)
);

create table Profesor(
IdProfesor int Not Null auto_increment,
Nombre char(30) Not Null,
ApellidoPaterno char(30) Not Null,
ApellidoMaterno char(30),
primary key(IdProfesor)
);

create table Horario(
IdHorario int Not Null Auto_increment,
Dias char(25) Not Null,
Hora char(20) Not Null,
primary key(IdHorario)
);

create table Curso(
Clave char(20),
Materia int Not Null,
NoIntegrantes int,
Profesor int,
Primary Key(Clave),
FOREIGN KEY (Materia) REFERENCES Materia(IdMateria),
FOREIGN KEY (Profesor) REFERENCES Profesor(IdProfesor)
);
Create Table Salon(
NoSalon char(10) Not Null,
Espacio int,
Primary Key(NoSalon)
);
Create Table Alumno(
Matricula char(8) Not Null,
Nombre char(30),
ApellidoPaterno char(30),
ApellidoMaterno char(30),
Semestre int,
primary key(Matricula)
);

/*Tablas N-N*/

Create table CursoAlumno(
Alumno char(8),
Curso char(20),
FOREIGN KEY (Alumno) REFERENCES Alumno(Matricula),
FOREIGN KEY (Curso) REFERENCES Curso(Clave)
);
Create Table CursoHorario(
Horario int,
Curso char(20),
FOREIGN KEY (Curso) REFERENCES Curso(Clave),
FOREIGN KEY (Horario) REFERENCES Horario(IdHorario)
);
Create Table CursoSalon(
Salon char(10),
Curso char(20),
FOREIGN KEY (Curso) REFERENCES Curso(Clave),
FOREIGN KEY (Salon) REFERENCES Salon(NoSalon)
);
/**************  Horarios  **************/
/*Lunes*/
/*Dos horas*/
Insert Into Horario (Dias,Hora) Values('Lunes','7:00 - 8:40');
Insert Into Horario (Dias,Hora) Values('Lunes','8:40 - 10:20');
Insert Into Horario (Dias,Hora) Values('Lunes','10:20 - 12:00');
Insert Into Horario (Dias,Hora) Values('Lunes','12:00 - 1:40');
/*Martes*/
/*Dos horas*/
Insert Into Horario (Dias,Hora) Values('Martes','7:00 - 8:40');
Insert Into Horario (Dias,Hora) Values('Martes','8:40 - 10:20');
Insert Into Horario (Dias,Hora) Values('Martes','10:20 - 12:00');
Insert Into Horario (Dias,Hora) Values('Martes','12:00 - 1:40');
/*Miercoles*/
/*Dos horas*/
Insert Into Horario (Dias,Hora) Values('Miercoles','7:00 - 8:40');
Insert Into Horario (Dias,Hora) Values('Miercoles','8:40 - 10:20');
Insert Into Horario (Dias,Hora) Values('Miercoles','10:20 - 12:00');
Insert Into Horario (Dias,Hora) Values('Miercoles','12:00 - 1:40');
/*Jueves*/
/*Dos horas*/
Insert Into Horario (Dias,Hora) Values('Jueves','7:00 - 8:40');
Insert Into Horario (Dias,Hora) Values('Jueves','8:40 - 10:20');
Insert Into Horario (Dias,Hora) Values('Jueves','10:20 - 12:00');
Insert Into Horario (Dias,Hora) Values('Jueves','12:00 - 1:40');
/*Viernes*/
/*Una hora*/
Insert Into Horario (Dias,Hora) Values('Viernes','7:00 - 7:50');
Insert Into Horario (Dias,Hora) Values('Viernes','7:50 - 8:40');
Insert Into Horario (Dias,Hora) Values('Viernes','8:40 - 9:30');
Insert Into Horario (Dias,Hora) Values('Viernes','9:30 - 10:20');
Insert Into Horario (Dias,Hora) Values('Viernes','10:20 - 11:10');
Insert Into Horario (Dias,Hora) Values('Viernes','11:10 - 12:00');
Insert Into Horario (Dias,Hora) Values('Viernes','12:00 - 12:50');
Insert Into Horario (Dias,Hora) Values('Viernes','12:50 - 1:40');
/**************  Materias  **************/
Insert Into Materia(Nombre,Semestre,Creditos) Values('Calculo diferencial',1,5);
Insert Into Materia(Nombre,Semestre,Creditos) Values('Fundamentos de programacion',1,5);
Insert Into Materia(Nombre,Semestre,Creditos) Values('Matematicas discretas',1,5);
Insert Into Materia(Nombre,Semestre,Creditos) Values('Taller de administracion',1,4);
Insert Into Materia(Nombre,Semestre,Creditos) Values('Fundamentos de investigacion',1,4);
Insert Into Materia(Nombre,Semestre,Creditos) Values('Taller de etica',1,4);
Insert Into Materia(Nombre,Semestre,Creditos) Values('Calculo integral',2,5);
Insert Into Materia(Nombre,Semestre,Creditos) Values('Algebra lineal',2,5);
Insert Into Materia(Nombre,Semestre,Creditos) Values('Programacion orientada a objetos',2,5);
Insert Into Materia(Nombre,Semestre,Creditos) Values('Contabilidad financiera',2,4);
Insert Into Materia(Nombre,Semestre,Creditos) Values('Quimica',2,4);
Insert Into Materia(Nombre,Semestre,Creditos) Values('Probabilidad y estadistica',2,5);
Insert Into Materia(Nombre,Semestre,Creditos) Values('Calculo vectorial',3,5);
Insert Into Materia(Nombre,Semestre,Creditos) Values('Estructura de datos',3,5);
Insert Into Materia(Nombre,Semestre,Creditos) Values('Fisica general',3,5);
Insert Into Materia(Nombre,Semestre,Creditos) Values('Investigacion de operaciones',3,4);
Insert Into Materia(Nombre,Semestre,Creditos) Values('Cultura empresarial',3,4);
Insert Into Materia(Nombre,Semestre,Creditos) Values('Desarrollo sustentable',3,5);/**/
Insert Into Materia(Nombre,Semestre,Creditos) Values('Ecuaciones diferenciales',4,5);
Insert Into Materia(Nombre,Semestre,Creditos) Values('Topicos avanzados de programacion',4,5);
Insert Into Materia(Nombre,Semestre,Creditos) Values('Principios electricos y aplicaciones digitales',4,5);
Insert Into Materia(Nombre,Semestre,Creditos) Values('Fundamentos de base de datos',4,5);
Insert Into Materia(Nombre,Semestre,Creditos) Values('Simulacion',4,5);
Insert Into Materia(Nombre,Semestre,Creditos) Values('Metodos numericos',4,4);
Insert Into Materia(Nombre,Semestre,Creditos) Values('Arquitectura de computadoras',5,5);
Insert Into Materia(Nombre,Semestre,Creditos) Values('Taller de base de datos',5,4);
Insert Into Materia(Nombre,Semestre,Creditos) Values('Graficacion',5,4);
Insert Into Materia(Nombre,Semestre,Creditos) Values('Fundamentos de telecomunicaciones',5,4);
Insert Into Materia(Nombre,Semestre,Creditos) Values('Fundamentos de ingenieria de software',5,4);
Insert Into Materia(Nombre,Semestre,Creditos) Values('Sistemas operativos',5,4);/*30*/
Insert Into Materia(Nombre,Semestre,Creditos) Values('Lenguajes de interfaz',6,4);
Insert Into Materia(Nombre,Semestre,Creditos) Values('Administracion de base de datos',6,5);
Insert Into Materia(Nombre,Semestre,Creditos) Values('Redes de computadoras',6,5);
Insert Into Materia(Nombre,Semestre,Creditos) Values('Taller de sistemas operativos',6,4);
Insert Into Materia(Nombre,Semestre,Creditos) Values('Ingenieria de software',6,5);
Insert Into Materia(Nombre,Semestre,Creditos) Values('Lenguajes y automatas 1',6,5);
Insert Into Materia(Nombre,Semestre,Creditos) Values('Sistemas programables',7,4);/*37*/
Insert Into Materia(Nombre,Semestre,Creditos) Values('Base de datos avanzadas',7,5);
Insert Into Materia(Nombre,Semestre,Creditos) Values('Conmutacion e inrutamiento en redes de datos',7,5);
Insert Into Materia(Nombre,Semestre,Creditos) Values('Gestion de proyectos de software',7,6);
Insert Into Materia(Nombre,Semestre,Creditos) Values('Lenguajes y automatas 2',7,5);
Insert Into Materia(Nombre,Semestre,Creditos) Values('Taller de investigacion 1',7,4);/*42*/
Insert Into Materia(Nombre,Semestre,Creditos) Values('Administracion de redes',8,4);/*43*/
Insert Into Materia(Nombre,Semestre,Creditos) Values('Taller de investigacion 2',8,4);
Insert Into Materia(Nombre,Semestre,Creditos) Values('Programacion logica y funcional',8,4);
Insert Into Materia(Nombre,Semestre,Creditos) Values('Programacion web',8,5);
Insert Into Materia(Nombre,Semestre,Creditos) Values('Desarrollo de aplicaciones empresariales',8,5);
Insert Into Materia(Nombre,Semestre,Creditos) Values('Servicio social',8,10);/*48*/
Insert Into Materia(Nombre,Semestre,Creditos) Values('Inteligencia artificial',9,4);
Insert Into Materia(Nombre,Semestre,Creditos) Values('Programacion web avanzada',9,5);
Insert Into Materia(Nombre,Semestre,Creditos) Values('Arquitectura de aplicaciones empresariales',9,5);
Insert Into Materia(Nombre,Semestre,Creditos) Values('Desarrollo de aplicaciones para dispositivos moviles',9,5);
Insert Into Materia(Nombre,Semestre,Creditos) Values('Residencia profesional',9,10);

/**************  Profesores  **************/
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Antonio','Lopez','Barrera');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Jose','Gaytan','Navarro');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Mauricio','Mendoza','Sanchez');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Marta Leticia','Gaytan','Noriega');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Wendoly','Castellano','Ortega');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Victoria','Duran','Hernadez');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Marta Leticia','Borja','Herrera');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Adrian','Ruiz','Gonzales');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Antonio','Gaytan','Mozqueda');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Julio','Castellano','Navarro');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Victoria','Castellano','Torres');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Julio','Garcia','Calderon');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Carlos','Ortega','Castañeda');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Gerardo','Lopez','Fuentes');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Marta Leticia','Gonzales','Mendez');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Victoria','Perez','Aguirre');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Wendoly','Duran','Ponce');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Julio','Gonzales','Santos');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Antonio','Perez','Aguirre');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Julio','Mendoza','Barrera');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Sergio','Garcia','Aguirre');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Carlos','Solache','Muñoz');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Gerardo','Sanchez','Herrera');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Gerardo','Solache','Herrera');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Mario Fabian','Rojas','Sanchez');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Antonio','Perez','Torres');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Gerardo','Gonzales','Navarro');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Sergio','Perez','Lara');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Mauricio','Alvarez','Calderon');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Marta','Aguilera','Ortega');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Mario Fabian','Sanchez','Ponce');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Olivia Luz','Gonzales','Navarro');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Mariana','Garcia','Castañeda');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Laura','Gomez','Santos');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Alfonso','Sanchez','Mozqueda');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Wendoly','Solache','Navarro');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Olivia Luz','Perez','Navarro');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Mario Fabian','Gomez','Baron');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Martin','Ortiz','Herrera');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Mariana','Castellano','Torres');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Mauricio','Lopez','Santos');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Mariana','Arribas','Navarro');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Victoria','Seferino','Santos');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Wendoly','Gonzales','Calderon');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Wendoly','Sanchez','Garcia');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Sergio','Perez','Ponce');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Laura','Duran','Calderon');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Carlos','Aguilera','Calderon');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Tomas','Duran','Lara');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Alondra','Duran','Mendez');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Wendoly','Gaytan','Mozqueda');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Victoria','Ortega','Arribas');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Reyba','Seferino','Castañeda');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Adrian','Ruiz','Arribas');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Sergio','Seferino','Gonzales');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Marta Leticia','Aguilera','Mendez');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Alfonso','Gaytan','Calderon');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Julio','Perez','Herrera');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Martin','Barrera','Hernadez');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Alfonso','Garcia','Ponce');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Alfonso','Borja','Noriega');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Laura','Solache','Aguirre');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Laura','Lopez','Gonzales');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Sergio','Duran','Navarro');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Marta Leticia','Mendoza','Ortega');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Marta','Perez','Mozqueda');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Ulises','Ruiz','Baron');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Gerardo','Perez','Santos');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Jose','Aguilera','Fuentes');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Martin','Ortiz','Ortega');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Ulises','Barrera','Castañeda');
Insert Into Profesor(Nombre,ApellidoPaterno,ApellidoMaterno) Values('Tomas','Alvarez','Gonzales');


/**************  Alumno  **************/
INSERT INTO alumno(Matricula, Nombre, ApellidoPaterno, ApellidoMaterno,Semestre)VALUES('11080413', 'Jorge', 'Romero', 'Santos',6);
INSERT INTO alumno(Matricula, Nombre, ApellidoPaterno, ApellidoMaterno,Semestre)VALUES('15240485', 'Carlos', 'Perez', 'Hernandez',3);
INSERT INTO alumno(Matricula, Nombre, ApellidoPaterno, ApellidoMaterno,Semestre)VALUES('17150789', 'Lucia', 'Padilla', 'Guerrero',0);

/**************  Salones  **************/
Insert INTO Salon(NoSalon,Espacio) Values('S-01',25);
Insert INTO Salon(NoSalon,Espacio) Values('S-02',25);
Insert INTO Salon(NoSalon,Espacio) Values('S-03',25);
Insert INTO Salon(NoSalon,Espacio) Values('S-04',25);
Insert INTO Salon(NoSalon,Espacio) Values('S-05',25);
Insert INTO Salon(NoSalon,Espacio) Values('S-06',25);
Insert INTO Salon(NoSalon,Espacio) Values('S-07',25);
Insert INTO Salon(NoSalon,Espacio) Values('S-08',25);
Insert INTO Salon(NoSalon,Espacio) Values('S-09',25);
Insert INTO Salon(NoSalon,Espacio) Values('S-10',25);
INSERT INTO salon(NoSalon, Espacio)VALUES('S-11', 25);
INSERT INTO salon(NoSalon, Espacio)VALUES('S-12', 25);
INSERT INTO salon(NoSalon, Espacio)VALUES('S-13', 25);
INSERT INTO salon(NoSalon, Espacio)VALUES('S-14', 25);
INSERT INTO salon(NoSalon, Espacio)VALUES('S-15', 25);
INSERT INTO salon(NoSalon, Espacio)VALUES('S-16', 25);
INSERT INTO salon(NoSalon, Espacio)VALUES('S-17', 25);
INSERT INTO salon(NoSalon, Espacio)VALUES('S-18', 25);
INSERT INTO salon(NoSalon, Espacio)VALUES('S-19', 25);
INSERT INTO salon(NoSalon, Espacio)VALUES('S-20', 25);
INSERT INTO salon(NoSalon, Espacio)VALUES('S-21', 25);
INSERT INTO salon(NoSalon, Espacio)VALUES('S-22', 25);
INSERT INTO salon(NoSalon, Espacio)VALUES('S-23', 25);
INSERT INTO salon(NoSalon, Espacio)VALUES('S-24', 25);
Insert INTO Salon(NoSalon,Espacio) Values('S-25',25);
Insert INTO Salon(NoSalon,Espacio) Values('S-26',25);
Insert INTO Salon(NoSalon,Espacio) Values('S-27',25);
Insert INTO Salon(NoSalon,Espacio) Values('S-28',25);
Insert INTO Salon(NoSalon,Espacio) Values('S-29',25);
Insert INTO Salon(NoSalon,Espacio) Values('S-30',25);
Insert INTO Salon(NoSalon,Espacio) Values('S-31',25);
Insert INTO Salon(NoSalon,Espacio) Values('S-32',25);
Insert INTO Salon(NoSalon,Espacio) Values('S-33',25);
Insert INTO Salon(NoSalon,Espacio) Values('S-34',25);
INSERT INTO salon(NoSalon, Espacio)VALUES('S-35', 25);
INSERT INTO salon(NoSalon, Espacio)VALUES('S-36', 25);
INSERT INTO salon(NoSalon, Espacio)VALUES('S-37', 25);
INSERT INTO salon(NoSalon, Espacio)VALUES('S-38', 25);
INSERT INTO salon(NoSalon, Espacio)VALUES('S-39', 25);
INSERT INTO salon(NoSalon, Espacio)VALUES('S-40', 25);
INSERT INTO salon(NoSalon, Espacio)VALUES('S-41', 25);
INSERT INTO salon(NoSalon, Espacio)VALUES('S-42', 25);
INSERT INTO salon(NoSalon, Espacio)VALUES('S-43', 25);
INSERT INTO salon(NoSalon, Espacio)VALUES('S-44', 25);
INSERT INTO salon(NoSalon, Espacio)VALUES('S-45', 25);
INSERT INTO salon(NoSalon, Espacio)VALUES('S-46', 25);
INSERT INTO salon(NoSalon, Espacio)VALUES('S-47', 25);
INSERT INTO salon(NoSalon, Espacio)VALUES('S-48', 25);
Insert INTO Salon(NoSalon,Espacio) Values('S-49',25);
Insert INTO Salon(NoSalon,Espacio) Values('S-50',25);
Insert INTO Salon(NoSalon,Espacio) Values('S-51',25);
Insert INTO Salon(NoSalon,Espacio) Values('S-52',25);
Insert INTO Salon(NoSalon,Espacio) Values('S-53',25);
Insert INTO Salon(NoSalon,Espacio) Values('S-54',25);
Insert INTO Salon(NoSalon,Espacio) Values('S-55',25);
Insert INTO Salon(NoSalon,Espacio) Values('S-56',25);
Insert INTO Salon(NoSalon,Espacio) Values('S-57',25);
Insert INTO Salon(NoSalon,Espacio) Values('S-58',25);
INSERT INTO salon(NoSalon, Espacio)VALUES('S-59', 25);
INSERT INTO salon(NoSalon, Espacio)VALUES('S-60', 25);
INSERT INTO salon(NoSalon, Espacio)VALUES('S-61', 25);
INSERT INTO salon(NoSalon, Espacio)VALUES('S-62', 25);
INSERT INTO salon(NoSalon, Espacio)VALUES('S-63', 25);
INSERT INTO salon(NoSalon, Espacio)VALUES('S-64', 25);
INSERT INTO salon(NoSalon, Espacio)VALUES('S-65', 25);
INSERT INTO salon(NoSalon, Espacio)VALUES('S-66', 25);
INSERT INTO salon(NoSalon, Espacio)VALUES('S-67', 25);
INSERT INTO salon(NoSalon, Espacio)VALUES('S-68', 25);
INSERT INTO salon(NoSalon, Espacio)VALUES('S-69', 25);
INSERT INTO salon(NoSalon, Espacio)VALUES('S-70', 25);
INSERT INTO salon(NoSalon, Espacio)VALUES('S-71', 25);
INSERT INTO salon(NoSalon, Espacio)VALUES('S-72', 25);
/**************  Cursos (Para ejemplificar, se crearon cursos para semestre: 1,4,7) **************/
/*Primer Semestre*/
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS1-001', 1, 0,1);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS1-001.1', 1, 0,1);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS1-001.2', 1, 0,2);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS1-001.3', 1, 0,2);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS1-002', 2, 0,3);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS1-002.1', 2, 0,3);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS1-002.2', 2, 0,4);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS1-002.3', 2, 0,4);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS1-003', 3, 0,5);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS1-003.1', 3, 0,6);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS1-004', 4, 0,7);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS1-004.1', 4, 0,8);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS1-005', 5, 0,9);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS1-005.1', 5, 0,10);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS1-006', 6, 0,11);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS1-006.1', 6, 0,12);
/*Segundo Semestre*/
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS2-001', 7, 0,13);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS2-001.1', 7, 0,13);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS2-001.2', 7, 0,14);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS2-001.3', 7, 0,14);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS2-002', 8, 0,15);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS2-002.1', 8, 0,15);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS2-002.2', 8, 0,16);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS2-002.3', 8, 0,16);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS2-003', 9, 0,17);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS2-003.1',9, 0,18);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS2-004',10, 0,19);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS2-004.1',10, 0,20);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS2-005', 11, 0,21);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS2-005.1',11, 0,22);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS2-006', 12, 0,23);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS2-006.1', 12, 0,24);
/*Cuarto Semestre*/
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS4-001', 19, 0,25);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS4-001.1', 19, 0,25);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS4-001.2', 19, 0,26);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS4-001.3', 19, 0,26);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS4-002', 20, 0,27);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS4-002.1', 20, 0,27);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS4-002.2', 20, 0,28);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS4-002.3', 20, 0,28);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS4-003', 21, 0,29);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS4-003.1',21, 0,29);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS4-004',22, 0,30);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS4-004.1',22, 0,31);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS4-005', 23, 0,32);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS4-005.1',23, 0,33);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS4-006', 24, 0,34);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS4-006.1', 24, 0,35);
/*Quinto Semestre*/
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS5-001', 25, 0,36);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS5-001.1', 25, 0,36);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS5-001.2', 25, 0,37);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS5-001.3', 25, 0,37);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS5-002', 26, 0,38);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS5-002.1', 26, 0,38);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS5-002.2', 26, 0,39);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS5-002.3', 26, 0,39);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS5-003', 27, 0,40);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS5-003.1',27, 0,41);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS5-004',28, 0,42);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS5-004.1',28, 0,43);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS5-005', 29, 0,44);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS5-005.1',29, 0,45);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS5-006', 30, 0,46);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS5-006.1', 30, 0,47);
/*Septimo Semestre*/
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS7-001', 37, 0,48);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS7-001.1', 37, 0,48);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS7-001.2', 37, 0,49);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS7-001.3', 37, 0,49);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS7-002', 38, 0,50);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS7-002.1', 38, 0,50);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS7-002.2', 38, 0,51);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS7-002.3', 38, 0,51);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS7-003', 39, 0,52);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS7-003.1',39, 0,53);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS7-004',40, 0,54);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS7-004.1',40, 0,55);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS7-005', 41, 0,56);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS7-005.1',41, 0,57);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS7-006', 42, 0,58);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS7-006.1', 42, 0,59);
/*Octavo Semestre*/
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS8-001', 43, 0,60);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS8-001.1', 43, 0,60);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS8-001.2', 43, 0,61);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS8-001.3', 43, 0,61);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS8-002', 44, 0,62);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS8-002.1', 44, 0,62);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS8-002.2', 44, 0,64);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS8-002.3', 44, 0,64);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS8-003', 45, 0,65);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS8-003.1',45, 0,66);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS8-004',46, 0,67);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS8-004.1',46, 0,68);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS8-005', 47, 0,69);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS8-005.1',47, 0,70);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS8-006', 48, 0,71);
INSERT INTO curso(Clave, Materia, NoIntegrantes,Profesor)VALUES('CS8-006.1', 48, 0,72);
/* Insert de relaciones N:N */

/**************  Cursos - Horario  **************/
/*Primer Semestre*/
INSERT INTO cursohorario(Horario, Curso)VALUES(1, 'CS1-001');
INSERT INTO cursohorario(Horario, Curso)VALUES(9, 'CS1-001');


INSERT INTO cursohorario(Horario, Curso)VALUES(2, 'CS1-001.1');
INSERT INTO cursohorario(Horario, Curso)VALUES(10, 'CS1-001.1');
INSERT INTO cursohorario(Horario, Curso)VALUES(19, 'CS1-001.1');

INSERT INTO cursohorario(Horario, Curso)VALUES(5, 'CS1-001.2');
INSERT INTO cursohorario(Horario, Curso)VALUES(13, 'CS1-001.2');
INSERT INTO cursohorario(Horario, Curso)VALUES(17, 'CS1-001.2');

INSERT INTO cursohorario(Horario, Curso)VALUES(6, 'CS1-001.3');
INSERT INTO cursohorario(Horario, Curso)VALUES(14, 'CS1-001.3');



INSERT INTO cursohorario(Horario, Curso)VALUES(1, 'CS1-002');
INSERT INTO cursohorario(Horario, Curso)VALUES(9, 'CS1-002');
INSERT INTO cursohorario(Horario, Curso)VALUES(17, 'CS1-002');

INSERT INTO cursohorario(Horario, Curso)VALUES(5, 'CS1-002.1');
INSERT INTO cursohorario(Horario, Curso)VALUES(13, 'CS1-002.1');


INSERT INTO cursohorario(Horario, Curso)VALUES(5, 'CS1-002.2');
INSERT INTO cursohorario(Horario, Curso)VALUES(13, 'CS1-002.2');
INSERT INTO cursohorario(Horario, Curso)VALUES(17, 'CS1-002.2');

INSERT INTO cursohorario(Horario, Curso)VALUES(6, 'CS1-002.3');
INSERT INTO cursohorario(Horario, Curso)VALUES(14, 'CS1-002.3');



INSERT INTO cursohorario(Horario, Curso)VALUES(3, 'CS1-003');
INSERT INTO cursohorario(Horario, Curso)VALUES(11, 'CS1-003');
INSERT INTO cursohorario(Horario, Curso)VALUES(21, 'CS1-003');

INSERT INTO cursohorario(Horario, Curso)VALUES(7, 'CS1-003.1');
INSERT INTO cursohorario(Horario, Curso)VALUES(15, 'CS1-003.1');


INSERT INTO cursohorario(Horario, Curso)VALUES(4, 'CS1-004');
INSERT INTO cursohorario(Horario, Curso)VALUES(12, 'CS1-004');


INSERT INTO cursohorario(Horario, Curso)VALUES(8, 'CS1-004.1');
INSERT INTO cursohorario(Horario, Curso)VALUES(16, 'CS1-004.1');
INSERT INTO cursohorario(Horario, Curso)VALUES(23, 'CS1-004.1');


INSERT INTO cursohorario(Horario, Curso)VALUES(3, 'CS1-005');
INSERT INTO cursohorario(Horario, Curso)VALUES(11, 'CS1-005');
INSERT INTO cursohorario(Horario, Curso)VALUES(21, 'CS1-005');

INSERT INTO cursohorario(Horario, Curso)VALUES(7, 'CS1-005.1');
INSERT INTO cursohorario(Horario, Curso)VALUES(15, 'CS1-005.1');


INSERT INTO cursohorario(Horario, Curso)VALUES(4, 'CS1-006');
INSERT INTO cursohorario(Horario, Curso)VALUES(12, 'CS1-006');


INSERT INTO cursohorario(Horario, Curso)VALUES(8, 'CS1-006.1');
INSERT INTO cursohorario(Horario, Curso)VALUES(16, 'CS1-006.1');
INSERT INTO cursohorario(Horario, Curso)VALUES(23, 'CS1-006.1');

/*Segundo Semestre*/
INSERT INTO cursohorario(Horario, Curso)VALUES(1, 'CS2-001');
INSERT INTO cursohorario(Horario, Curso)VALUES(9, 'CS2-001');
INSERT INTO cursohorario(Horario, Curso)VALUES(17, 'CS2-001');

INSERT INTO cursohorario(Horario, Curso)VALUES(2, 'CS2-001.1');
INSERT INTO cursohorario(Horario, Curso)VALUES(10, 'CS2-001.1');

INSERT INTO cursohorario(Horario, Curso)VALUES(5, 'CS2-001.2');
INSERT INTO cursohorario(Horario, Curso)VALUES(13, 'CS2-001.2');
INSERT INTO cursohorario(Horario, Curso)VALUES(17, 'CS2-001.2');

INSERT INTO cursohorario(Horario, Curso)VALUES(6, 'CS2-001.3');
INSERT INTO cursohorario(Horario, Curso)VALUES(14, 'CS2-001.3');



INSERT INTO cursohorario(Horario, Curso)VALUES(1, 'CS2-002');
INSERT INTO cursohorario(Horario, Curso)VALUES(9, 'CS2-002');

INSERT INTO cursohorario(Horario, Curso)VALUES(5, 'CS2-002.1');
INSERT INTO cursohorario(Horario, Curso)VALUES(13, 'CS2-002.1');
INSERT INTO cursohorario(Horario, Curso)VALUES(17, 'CS2-002.1');

INSERT INTO cursohorario(Horario, Curso)VALUES(5, 'CS2-002.2');
INSERT INTO cursohorario(Horario, Curso)VALUES(13, 'CS2-002.2');

INSERT INTO cursohorario(Horario, Curso)VALUES(6, 'CS2-002.3');
INSERT INTO cursohorario(Horario, Curso)VALUES(14, 'CS2-002.3');
INSERT INTO cursohorario(Horario, Curso)VALUES(19, 'CS2-002.3');


INSERT INTO cursohorario(Horario, Curso)VALUES(3, 'CS2-003');
INSERT INTO cursohorario(Horario, Curso)VALUES(11, 'CS2-003');

INSERT INTO cursohorario(Horario, Curso)VALUES(7, 'CS2-003.1');
INSERT INTO cursohorario(Horario, Curso)VALUES(15, 'CS2-003.1');
INSERT INTO cursohorario(Horario, Curso)VALUES(21, 'CS2-003.1');


INSERT INTO cursohorario(Horario, Curso)VALUES(4, 'CS2-004');
INSERT INTO cursohorario(Horario, Curso)VALUES(12, 'CS2-004');
INSERT INTO cursohorario(Horario, Curso)VALUES(23, 'CS2-004');

INSERT INTO cursohorario(Horario, Curso)VALUES(8, 'CS2-004.1');
INSERT INTO cursohorario(Horario, Curso)VALUES(16, 'CS2-004.1');


INSERT INTO cursohorario(Horario, Curso)VALUES(3, 'CS2-005');
INSERT INTO cursohorario(Horario, Curso)VALUES(11, 'CS2-005');

INSERT INTO cursohorario(Horario, Curso)VALUES(7, 'CS2-005.1');
INSERT INTO cursohorario(Horario, Curso)VALUES(15, 'CS2-005.1');
INSERT INTO cursohorario(Horario, Curso)VALUES(21, 'CS2-005.1');


INSERT INTO cursohorario(Horario, Curso)VALUES(4, 'CS2-006');
INSERT INTO cursohorario(Horario, Curso)VALUES(12, 'CS2-006');
INSERT INTO cursohorario(Horario, Curso)VALUES(23, 'CS2-006');

INSERT INTO cursohorario(Horario, Curso)VALUES(8, 'CS2-006.1');
INSERT INTO cursohorario(Horario, Curso)VALUES(16, 'CS2-006.1');

/*Cuarto Semestre*/
INSERT INTO cursohorario(Horario, Curso)VALUES(1, 'CS4-001');
INSERT INTO cursohorario(Horario, Curso)VALUES(9, 'CS4-001');

INSERT INTO cursohorario(Horario, Curso)VALUES(2, 'CS4-001.1');
INSERT INTO cursohorario(Horario, Curso)VALUES(10, 'CS4-001.1');
INSERT INTO cursohorario(Horario, Curso)VALUES(19, 'CS4-001.1');

INSERT INTO cursohorario(Horario, Curso)VALUES(5, 'CS4-001.2');
INSERT INTO cursohorario(Horario, Curso)VALUES(13, 'CS4-001.2');

INSERT INTO cursohorario(Horario, Curso)VALUES(6, 'CS4-001.3');
INSERT INTO cursohorario(Horario, Curso)VALUES(14, 'CS4-001.3');
INSERT INTO cursohorario(Horario, Curso)VALUES(19, 'CS4-001.3');


INSERT INTO cursohorario(Horario, Curso)VALUES(1, 'CS4-002');
INSERT INTO cursohorario(Horario, Curso)VALUES(9, 'CS4-002');
INSERT INTO cursohorario(Horario, Curso)VALUES(17, 'CS4-002');

INSERT INTO cursohorario(Horario, Curso)VALUES(5, 'CS4-002.1');
INSERT INTO cursohorario(Horario, Curso)VALUES(13, 'CS4-002.1');

INSERT INTO cursohorario(Horario, Curso)VALUES(5, 'CS4-002.2');
INSERT INTO cursohorario(Horario, Curso)VALUES(13, 'CS4-002.2');
INSERT INTO cursohorario(Horario, Curso)VALUES(17, 'CS4-002.2');

INSERT INTO cursohorario(Horario, Curso)VALUES(6, 'CS4-002.3');
INSERT INTO cursohorario(Horario, Curso)VALUES(14, 'CS4-002.3');


INSERT INTO cursohorario(Horario, Curso)VALUES(3, 'CS4-003');
INSERT INTO cursohorario(Horario, Curso)VALUES(11, 'CS4-003');

INSERT INTO cursohorario(Horario, Curso)VALUES(7, 'CS4-003.1');
INSERT INTO cursohorario(Horario, Curso)VALUES(15, 'CS4-003.1');
INSERT INTO cursohorario(Horario, Curso)VALUES(21, 'CS4-003.1');


INSERT INTO cursohorario(Horario, Curso)VALUES(4, 'CS4-004');
INSERT INTO cursohorario(Horario, Curso)VALUES(12, 'CS4-004');
INSERT INTO cursohorario(Horario, Curso)VALUES(23, 'CS4-004');

INSERT INTO cursohorario(Horario, Curso)VALUES(8, 'CS4-004.1');
INSERT INTO cursohorario(Horario, Curso)VALUES(16, 'CS4-004.1');


INSERT INTO cursohorario(Horario, Curso)VALUES(3, 'CS4-005');
INSERT INTO cursohorario(Horario, Curso)VALUES(11, 'CS4-005');

INSERT INTO cursohorario(Horario, Curso)VALUES(7, 'CS4-005.1');
INSERT INTO cursohorario(Horario, Curso)VALUES(15, 'CS4-005.1');
INSERT INTO cursohorario(Horario, Curso)VALUES(21, 'CS4-005.1');


INSERT INTO cursohorario(Horario, Curso)VALUES(4, 'CS4-006');
INSERT INTO cursohorario(Horario, Curso)VALUES(12, 'CS4-006');
INSERT INTO cursohorario(Horario, Curso)VALUES(23, 'CS4-006');

INSERT INTO cursohorario(Horario, Curso)VALUES(8, 'CS4-006.1');
INSERT INTO cursohorario(Horario, Curso)VALUES(16, 'CS4-006.1');

/*Quinto Semestre*/
INSERT INTO cursohorario(Horario, Curso)VALUES(1, 'CS5-001');
INSERT INTO cursohorario(Horario, Curso)VALUES(9, 'CS5-001');

INSERT INTO cursohorario(Horario, Curso)VALUES(2, 'CS5-001.1');
INSERT INTO cursohorario(Horario, Curso)VALUES(10, 'CS5-001.1');
INSERT INTO cursohorario(Horario, Curso)VALUES(19, 'CS5-001.1');

INSERT INTO cursohorario(Horario, Curso)VALUES(5, 'CS5-001.2');
INSERT INTO cursohorario(Horario, Curso)VALUES(13, 'CS5-001.2');

INSERT INTO cursohorario(Horario, Curso)VALUES(6, 'CS5-001.3');
INSERT INTO cursohorario(Horario, Curso)VALUES(14, 'CS5-001.3');
INSERT INTO cursohorario(Horario, Curso)VALUES(19, 'CS5-001.3');


INSERT INTO cursohorario(Horario, Curso)VALUES(1, 'CS5-002');
INSERT INTO cursohorario(Horario, Curso)VALUES(9, 'CS5-002');
INSERT INTO cursohorario(Horario, Curso)VALUES(17, 'CS5-002');

INSERT INTO cursohorario(Horario, Curso)VALUES(5, 'CS5-002.1');
INSERT INTO cursohorario(Horario, Curso)VALUES(13, 'CS5-002.1');

INSERT INTO cursohorario(Horario, Curso)VALUES(5, 'CS5-002.2');
INSERT INTO cursohorario(Horario, Curso)VALUES(13, 'CS5-002.2');
INSERT INTO cursohorario(Horario, Curso)VALUES(17, 'CS5-002.2');

INSERT INTO cursohorario(Horario, Curso)VALUES(6, 'CS5-002.3');
INSERT INTO cursohorario(Horario, Curso)VALUES(14, 'CS5-002.3');


INSERT INTO cursohorario(Horario, Curso)VALUES(3, 'CS5-003');
INSERT INTO cursohorario(Horario, Curso)VALUES(11, 'CS5-003');

INSERT INTO cursohorario(Horario, Curso)VALUES(7, 'CS5-003.1');
INSERT INTO cursohorario(Horario, Curso)VALUES(15, 'CS5-003.1');
INSERT INTO cursohorario(Horario, Curso)VALUES(21, 'CS5-003.1');


INSERT INTO cursohorario(Horario, Curso)VALUES(4, 'CS5-004');
INSERT INTO cursohorario(Horario, Curso)VALUES(12, 'CS5-004');
INSERT INTO cursohorario(Horario, Curso)VALUES(23, 'CS5-004');

INSERT INTO cursohorario(Horario, Curso)VALUES(8, 'CS5-004.1');
INSERT INTO cursohorario(Horario, Curso)VALUES(16, 'CS5-004.1');


INSERT INTO cursohorario(Horario, Curso)VALUES(3, 'CS5-005');
INSERT INTO cursohorario(Horario, Curso)VALUES(11, 'CS5-005');

INSERT INTO cursohorario(Horario, Curso)VALUES(7, 'CS5-005.1');
INSERT INTO cursohorario(Horario, Curso)VALUES(15, 'CS5-005.1');
INSERT INTO cursohorario(Horario, Curso)VALUES(21, 'CS5-005.1');


INSERT INTO cursohorario(Horario, Curso)VALUES(4, 'CS5-006');
INSERT INTO cursohorario(Horario, Curso)VALUES(12, 'CS5-006');
INSERT INTO cursohorario(Horario, Curso)VALUES(23, 'CS5-006');

INSERT INTO cursohorario(Horario, Curso)VALUES(8, 'CS5-006.1');
INSERT INTO cursohorario(Horario, Curso)VALUES(16, 'CS5-006.1');
/**************** Aqui voy ********************/
/*Septimo Semestre*/
INSERT INTO cursohorario(Horario, Curso)VALUES(1, 'CS7-001');
INSERT INTO cursohorario(Horario, Curso)VALUES(9, 'CS7-001');

INSERT INTO cursohorario(Horario, Curso)VALUES(2, 'CS7-001.1');
INSERT INTO cursohorario(Horario, Curso)VALUES(10, 'CS7-001.1');
INSERT INTO cursohorario(Horario, Curso)VALUES(19, 'CS7-001.1');

INSERT INTO cursohorario(Horario, Curso)VALUES(5, 'CS7-001.2');
INSERT INTO cursohorario(Horario, Curso)VALUES(13, 'CS7-001.2');

INSERT INTO cursohorario(Horario, Curso)VALUES(6, 'CS7-001.3');
INSERT INTO cursohorario(Horario, Curso)VALUES(14, 'CS7-001.3');
INSERT INTO cursohorario(Horario, Curso)VALUES(19, 'CS7-001.3');


INSERT INTO cursohorario(Horario, Curso)VALUES(1, 'CS7-002');
INSERT INTO cursohorario(Horario, Curso)VALUES(9, 'CS7-002');
INSERT INTO cursohorario(Horario, Curso)VALUES(17, 'CS7-002');

INSERT INTO cursohorario(Horario, Curso)VALUES(5, 'CS7-002.1');
INSERT INTO cursohorario(Horario, Curso)VALUES(13, 'CS7-002.1');

INSERT INTO cursohorario(Horario, Curso)VALUES(5, 'CS7-002.2');
INSERT INTO cursohorario(Horario, Curso)VALUES(13, 'CS7-002.2');
INSERT INTO cursohorario(Horario, Curso)VALUES(17, 'CS7-002.2');

INSERT INTO cursohorario(Horario, Curso)VALUES(6, 'CS7-002.3');
INSERT INTO cursohorario(Horario, Curso)VALUES(14, 'CS7-002.3');


INSERT INTO cursohorario(Horario, Curso)VALUES(3, 'CS7-003');
INSERT INTO cursohorario(Horario, Curso)VALUES(11, 'CS7-003');

INSERT INTO cursohorario(Horario, Curso)VALUES(7, 'CS7-003.1');
INSERT INTO cursohorario(Horario, Curso)VALUES(15, 'CS7-003.1');
INSERT INTO cursohorario(Horario, Curso)VALUES(21, 'CS7-003.1');


INSERT INTO cursohorario(Horario, Curso)VALUES(4, 'CS7-004');
INSERT INTO cursohorario(Horario, Curso)VALUES(12, 'CS7-004');
INSERT INTO cursohorario(Horario, Curso)VALUES(23, 'CS7-004');

INSERT INTO cursohorario(Horario, Curso)VALUES(8, 'CS7-004.1');
INSERT INTO cursohorario(Horario, Curso)VALUES(16, 'CS7-004.1');


INSERT INTO cursohorario(Horario, Curso)VALUES(3, 'CS7-005');
INSERT INTO cursohorario(Horario, Curso)VALUES(11, 'CS7-005');

INSERT INTO cursohorario(Horario, Curso)VALUES(7, 'CS7-005.1');
INSERT INTO cursohorario(Horario, Curso)VALUES(15, 'CS7-005.1');
INSERT INTO cursohorario(Horario, Curso)VALUES(21, 'CS7-005.1');


INSERT INTO cursohorario(Horario, Curso)VALUES(4, 'CS7-006');
INSERT INTO cursohorario(Horario, Curso)VALUES(12, 'CS7-006');

INSERT INTO cursohorario(Horario, Curso)VALUES(8, 'CS7-006.1');
INSERT INTO cursohorario(Horario, Curso)VALUES(16, 'CS7-006.1');
INSERT INTO cursohorario(Horario, Curso)VALUES(23, 'CS7-006.1');


/*Octavo Semestre*/
INSERT INTO cursohorario(Horario, Curso)VALUES(1, 'CS8-001');
INSERT INTO cursohorario(Horario, Curso)VALUES(9, 'CS8-001');

INSERT INTO cursohorario(Horario, Curso)VALUES(2, 'CS8-001.1');
INSERT INTO cursohorario(Horario, Curso)VALUES(10, 'CS8-001.1');
INSERT INTO cursohorario(Horario, Curso)VALUES(19, 'CS8-001.1');

INSERT INTO cursohorario(Horario, Curso)VALUES(5, 'CS8-001.2');
INSERT INTO cursohorario(Horario, Curso)VALUES(13, 'CS8-001.2');

INSERT INTO cursohorario(Horario, Curso)VALUES(6, 'CS8-001.3');
INSERT INTO cursohorario(Horario, Curso)VALUES(14, 'CS8-001.3');
INSERT INTO cursohorario(Horario, Curso)VALUES(19, 'CS8-001.3');


INSERT INTO cursohorario(Horario, Curso)VALUES(1, 'CS8-002');
INSERT INTO cursohorario(Horario, Curso)VALUES(9, 'CS8-002');
INSERT INTO cursohorario(Horario, Curso)VALUES(17, 'CS8-002');

INSERT INTO cursohorario(Horario, Curso)VALUES(5, 'CS8-002.1');
INSERT INTO cursohorario(Horario, Curso)VALUES(13, 'CS8-002.1');

INSERT INTO cursohorario(Horario, Curso)VALUES(5, 'CS8-002.2');
INSERT INTO cursohorario(Horario, Curso)VALUES(13, 'CS8-002.2');
INSERT INTO cursohorario(Horario, Curso)VALUES(17, 'CS8-002.2');

INSERT INTO cursohorario(Horario, Curso)VALUES(6, 'CS8-002.3');
INSERT INTO cursohorario(Horario, Curso)VALUES(14, 'CS8-002.3');


INSERT INTO cursohorario(Horario, Curso)VALUES(3, 'CS8-003');
INSERT INTO cursohorario(Horario, Curso)VALUES(11, 'CS8-003');

INSERT INTO cursohorario(Horario, Curso)VALUES(7, 'CS8-003.1');
INSERT INTO cursohorario(Horario, Curso)VALUES(15, 'CS8-003.1');
INSERT INTO cursohorario(Horario, Curso)VALUES(21, 'CS8-003.1');


INSERT INTO cursohorario(Horario, Curso)VALUES(4, 'CS8-004');
INSERT INTO cursohorario(Horario, Curso)VALUES(12, 'CS8-004');
INSERT INTO cursohorario(Horario, Curso)VALUES(23, 'CS8-004');

INSERT INTO cursohorario(Horario, Curso)VALUES(8, 'CS8-004.1');
INSERT INTO cursohorario(Horario, Curso)VALUES(16, 'CS8-004.1');


INSERT INTO cursohorario(Horario, Curso)VALUES(3, 'CS8-005');
INSERT INTO cursohorario(Horario, Curso)VALUES(11, 'CS8-005');

INSERT INTO cursohorario(Horario, Curso)VALUES(7, 'CS8-005.1');
INSERT INTO cursohorario(Horario, Curso)VALUES(15, 'CS8-005.1');
INSERT INTO cursohorario(Horario, Curso)VALUES(21, 'CS8-005.1');


INSERT INTO cursohorario(Horario, Curso)VALUES(4, 'CS8-006');
INSERT INTO cursohorario(Horario, Curso)VALUES(12, 'CS8-006');
INSERT INTO cursohorario(Horario, Curso)VALUES(23, 'CS8-006');

INSERT INTO cursohorario(Horario, Curso)VALUES(8, 'CS8-006.1');
INSERT INTO cursohorario(Horario, Curso)VALUES(16, 'CS8-006.1');


/**************  Cursos - Salon  **************/
/*Primer Semestre*/
INSERT INTO cursosalon(Salon, Curso)VALUES('S-01', 'CS1-001');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-01', 'CS1-001.1');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-02', 'CS1-001.2');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-02', 'CS1-001.3');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-03', 'CS1-002');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-03', 'CS1-002.1');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-04', 'CS1-002.2');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-04', 'CS1-002.3');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-05', 'CS1-003');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-06', 'CS1-003.1');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-07', 'CS1-004');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-08', 'CS1-004.1');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-09', 'CS1-005');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-10', 'CS1-005.1');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-11', 'CS1-006');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-12', 'CS1-006.1');
/*Segundo Semestre*/
INSERT INTO cursosalon(Salon, Curso)VALUES('S-13', 'CS2-001');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-13', 'CS2-001.1');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-14', 'CS2-001.2');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-14', 'CS2-001.3');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-15', 'CS2-002');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-15', 'CS2-002.1');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-16', 'CS2-002.2');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-16', 'CS2-002.3');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-17', 'CS2-003');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-18', 'CS2-003.1');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-19', 'CS2-004');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-20', 'CS2-004.1');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-21', 'CS2-005');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-22', 'CS2-005.1');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-23', 'CS2-006');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-24', 'CS2-006.1');
/*Cuarto Semestre*/
INSERT INTO cursosalon(Salon, Curso)VALUES('S-25', 'CS4-001');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-25', 'CS4-001.1');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-26', 'CS4-001.2');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-26', 'CS4-001.3');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-27', 'CS4-002');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-27', 'CS4-002.1');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-28', 'CS4-002.2');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-28', 'CS4-002.3');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-29', 'CS4-003');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-30', 'CS4-003.1');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-31', 'CS4-004');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-32', 'CS4-004.1');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-33', 'CS4-005');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-34', 'CS4-005.1');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-35', 'CS4-006');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-36', 'CS4-006.1');
/*Quinto Semestre*/
INSERT INTO cursosalon(Salon, Curso)VALUES('S-37', 'CS5-001');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-37', 'CS5-001.1');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-38', 'CS5-001.2');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-38', 'CS5-001.3');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-39', 'CS5-002');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-39', 'CS5-002.1');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-40', 'CS5-002.2');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-40', 'CS5-002.3');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-41', 'CS5-003');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-42', 'CS5-003.1');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-43', 'CS5-004');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-44', 'CS5-004.1');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-45', 'CS5-005');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-46', 'CS5-005.1');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-47', 'CS5-006');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-48', 'CS5-006.1');
/*Septimo Semestre*/
INSERT INTO cursosalon(Salon, Curso)VALUES('S-49', 'CS7-001');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-49', 'CS7-001.1');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-50', 'CS7-001.2');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-50', 'CS7-001.3');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-51', 'CS7-002');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-51', 'CS7-002.1');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-52', 'CS7-002.2');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-52', 'CS7-002.3');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-53', 'CS7-003');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-54', 'CS7-003.1');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-55', 'CS7-004');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-56', 'CS7-004.1');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-57', 'CS7-005');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-58', 'CS7-005.1');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-59', 'CS7-006');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-60', 'CS7-006.1');
/*Octavo Semestre*/
INSERT INTO cursosalon(Salon, Curso)VALUES('S-61', 'CS8-001');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-61', 'CS8-001.1');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-62', 'CS8-001.2');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-62', 'CS8-001.3');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-63', 'CS8-002');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-63', 'CS8-002.1');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-64', 'CS8-002.2');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-64', 'CS8-002.3');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-65', 'CS8-003');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-66', 'CS8-003.1');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-67', 'CS8-004');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-68', 'CS8-004.1');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-69', 'CS8-005');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-70', 'CS8-005.1');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-71', 'CS8-006');
INSERT INTO cursosalon(Salon, Curso)VALUES('S-72', 'CS8-006.1');

/**   Vistas necesarias  **/
Create View CursoMateria As
Select c.Clave,m.Nombre,m.Semestre,c.Profesor from Curso c Inner Join Materia m
On c.Materia=m.IdMateria;

Create View CursoProfesorV As
Select cm.Clave,cm.Nombre Materia,p.Nombre,p.ApellidoPaterno,p.ApellidoMaterno,cm.Semestre
From CursoMateria cm Inner Join Profesor p
On cm.Profesor=p.IdProfesor;

Create view InformacionCursos As
Select cp.Clave,cp.Materia,cp.Nombre,cp.ApellidoPaterno,cp.ApellidoMaterno,h.Dias,h.Hora,cp.Semestre
From CursoProfesorV cp Inner Join CursoHorario ch
On cp.Clave=ch.Curso Inner Join Horario h
On ch.Horario=h.IdHorario
Group By cp.Clave,cp.Materia,cp.Nombre,cp.ApellidoPaterno,cp.ApellidoMaterno,h.Dias,h.Hora,cp.Semestre;

Create View NoSalonV As
Select c.Clave,sa.NoSalon
from cursoalumno ca Inner Join Curso c
On ca.Curso=c.Clave Inner Join CursoSalon cs
On c.Clave=cs.Curso Inner Join Salon sa
On cs.Salon=sa.NoSalon;

Create View Creditos As
Select c.Clave,m.Creditos
From CursoAlumno ca Inner Join Curso c
On ca.Curso=c.Clave Inner Join Materia m
On c.Materia=IdMateria;
