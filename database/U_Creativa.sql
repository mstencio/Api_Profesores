--Crear la base de datos
CREATE DATABASE U_Creativa;

--Crear las tablas
CREATE TABLE Estudiante(
id_estudiante int identity(1,1) not null,
nombre nvarchar(30) not null,
cedula nvarchar(100) not null,
telefono nvarchar(30) not null,
direccion nvarchar(300) not null,
correo nvarchar(100),
primary key (id_estudiante)
)

CREATE TABLE Profesor(
id_profesor int identity(1,1) not null,
nombre nvarchar(30) not null,
cedula nvarchar(100) not null,
telefono nvarchar(30) not null,
direccion nvarchar(300) not null,
correo nvarchar(100),
primary key (id_profesor)
)

CREATE TABLE Sede(
id_sede int identity(1,1) not null,
direccion nvarchar(300) not null,
nombre nvarchar(40) not null,
telefono nvarchar(30) not null,
correo nvarchar(100) not null,
primary key(id_sede)
)

CREATE TABLE Materias(
id_materias int identity(1,1),
nombre nvarchar(100),
descripcion nvarchar(500),
primary key(id_materias)
)

CREATE TABLE Cursos(
id_cursos int identity(1,1),
id_materias int not null,
constraint FK_Cursos_Materias FOREIGN KEY (id_materias) REFERENCES Materias(id_materias),
nombre nvarchar(100),
duracion nvarchar(50),
descripcion nvarchar(300),
primary key(id_cursos)
)

CREATE TABLE matriculas(
id_matriculas int identity(1,1),
id_estudiante int not null,
id_sede int,
id_profesor int,
id_cursos int,
fecha_hora_consulta datetime,
primary key(id_matriculas),
constraint FK_Matriculas__Estudiante FOREIGN KEY (id_estudiante) REFERENCES Estudiante(id_estudiante),
constraint FK_Matriculas_Sede FOREIGN KEY (id_sede) REFERENCES Sede(id_sede),
constraint FK_Matriculas_Profesor FOREIGN KEY (id_profesor) REFERENCES Profesor(id_profesor),
constraint FK_Matriculas_Cursos FOREIGN KEY (id_cursos) REFERENCES Cursos(id_cursos),
)

--insertar datos en las tablas
INSERT INTO Estudiante VALUES
('Juan Perez', '304167414', '88723651', 'Heredia, 200m oeste del Pali', 'juan.perez@gmail.com'),
('Alexa Aguilar', '114780579', '60871492', 'Alajuela, 1K sur del templo', 'alexa.aguilar@gmail.com'),
('Jose Robles', '404167933', '85634489', 'Cartago centro', 'jose.robles@gmail.com'),
('Jimena Mora', '125530774', '87301274', 'Escazu, san rafael', 'jimena.mora@gmail.com')
select *from Estudiante

INSERT INTO Profesor VALUES
('Allan Perez', '504167417', '68723653', 'Puntarenas, 200m oeste del BN', 'allan.perez@gmail.com'),
('Alex Piedra', '314780574', '70871491', 'Perez Zeledon, 1K sur del parque', 'alex.piedra@gmail.com'),
('Pedro Pineda', '104167933', '85434482', 'Santa Ana centro', 'Pedro.pineda@gmail.com'),
('Ana Navarro', '285530772', '80301271', 'Alajuela, san rafael', 'ana.navarro@gmail.com')
select *from Profesor

INSERT INTO Sede VALUES
('San jose, 1K norte de los tribunales', 'Sede Juan Pablo II ', '22308973', 'juanpablo@ucreativa.com'),
('Heredia, 200m sur del BN', 'Sede Benito Mora', '26809064', 'benitomora@ucreativa.com'),
('Alajuela centro', 'Sede Madre Teresa', '27185089', 'madreteresa@ucreativa.com')
select *from Sede

INSERT INTO Materias VALUES
('HTML, CSS', 'Conocimientos basicos de la estructura WEB'),
('Python', 'Conocimentos sobre logica computacional'),
('java Script', 'lenguaje muy utilizado en la WEB'),
('Dibujo', 'Desarollo de habilidades creativas'),
('Fotografia', 'Conocimiento sobre equipos, luz y enfoque'),
('Diseño', 'Conocimiento sobre modelado, patrones y texturas')
select *from Materias

INSERT INTO Cursos VALUES
(1, 'Desarrolo WEB', '8 meses', 'Desarollo de paginas WEB dinamicas'),
(2, 'Inteligencia artificial', '18 meses', 'Creacion de soluciones automatizadas y con aprendizaje artificial'),
(6, 'Diseño grafico', '10 meses', ' Creación y procesamiento de imágenes'),
(5, 'Fotografia profecional', '12 meses', 'Herramientas para poder mostrar arte por medio de imágenes')
select *from Cursos

INSERT INTO matriculas VALUES
(1,3,2,4, '04-12-2022 08:45'),
(2,2,2,6, '05-30-2022 11:15'),
(4,1,3,5, '06-08-2022 15:00'),
(3,3,1,3, '06-20-2022 08:00')
select *from matriculas


--crear una vista
GO
CREATE VIEW view_get_matriculas AS
SELECT
id_matriculas,
e.nombre as 'Nombre Estudiante',
p.nombre as 'Nombre Profesor',
c.nombre as 'Curso'
FROM matriculas i
INNER JOIN Estudiante e on e.id_estudiante = i.id_estudiante
INNER JOIN Profesor p on p.id_profesor = i.id_profesor
INNER JOIN Cursos c on c.id_cursos = i.id_cursos
GO