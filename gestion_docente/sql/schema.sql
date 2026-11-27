CREATE DATABASE IF NOT EXISTS dbgestion_academica;
USE dbgestion_academica;
CREATE DATABASE dbgestion_academica;
USE dbgestion_academica;

create table escuela(
id_escuela int auto_increment primary key,
nombre varchar(100) not null,
facultad varchar(100) not null
);

create table semestre(
id_semestre int auto_increment primary key,
codigo varchar(20) not null,
fecha_inicio date not null,
fecha_fin date not null
);

create table curso(
id_curso int auto_increment primary key,
id_escuela int not null,
nombre varchar(100) not null,
creditos int not null,
horas_teoria int not null,
horas_practica int not null,
ciclo varchar(10) not null,
constraint fk_escuela_curso foreign key (id_escuela) references escuela(id_escuela)
);

create table docente(
id_docente int auto_increment primary key,
id_escuela int not null,
nombre varchar(100) not null,
apellidos varchar(100) not null,
correo varchar(100) null,
telefono varchar(15) null,
grado_academico varchar(50) null,
especialidad varchar(100) null,
categoria varchar(50) null,
constraint fk_escuela_docente foreign key (id_escuela) references escuela(id_escuela)
);

create table actividades(
id_acti int auto_increment primary key,
id_docente int not null,
descripcion varchar(255) not null,
constraint fk_docente_actividades foreign key (id_docente) references docente(id_docente)
);

create table contrato(
id_contrato int auto_increment primary key,
id_docente int not null,
fecha_inicio date not null,
fecha_fin date null,
dedicacion varchar(50) not null,
horas_semanales int not null,
remuneracion decimal(10,2) null,
constraint fk_docente_contrato foreign key (id_docente) references docente(id_docente)
);

create table seccion(
id_seccion int auto_increment primary key,
id_curso int not null,
id_docente int null,
id_semestre int not null,
turno varchar(20) not null,
aula varchar(20) null,
horario varchar(50) null,
horas_asignadas int not null,
nro_matriculados int null,
constraint fk_curso_seccion foreign key (id_curso) references curso(id_curso),
constraint fk_docente_seccion foreign key (id_docente) references docente(id_docente),
constraint fk_semestre_seccion foreign key (id_semestre) references semestre(id_semestre)
);

create table delegado(
id_delegado int auto_increment primary key,
id_seccion int not null,
nombres varchar(100) not null,
apellidos varchar(100) not null,
correo varchar(100) null,
telefono varchar(15) null,
constraint fk_seccion_delegado foreign key (id_seccion) references seccion(id_seccion)
);

create table silabo(
id_silabo int auto_increment primary key,
id_seccion int not null,
competencias text not null,
metodologia text not null,
sistema_evaluacion text not null,
bibliografia text null,
fecha_presentacion date null,
constraint fk_seccion_silabo foreign key (id_seccion) references seccion(id_seccion)
);

create table temaclase(
id_tema int auto_increment primary key,
id_silabo int not null,
nro_semana int not null,
nro_sesion int not null,
tema varchar(200) not null,
fecha_programada date not null,
fecha_dictada date null,
constraint fk_silabo_temaclase foreign key (id_silabo) references silabo(id_silabo)
);