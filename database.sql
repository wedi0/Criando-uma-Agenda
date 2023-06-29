CREATE DATABASE dbagenda /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
use dbagenda;


CREATE TABLE usuarios (
  id_usuario int(11) NOT NULL,
  nome varchar(70) DEFAULT NULL,
  login varchar(70) DEFAULT NULL,
  senha varchar(250) DEFAULT NULL,
  email varchar(70) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE tarefas (
  id_tarefa int(11) NOT NULL,
  titulo varchar(100) DEFAULT NULL,
  descricao varchar(250) DEFAULT NULL,
  data_criacao date NOT NULL,
  data_conclusao date DEFAULT NULL,
  status boolean DEFAULT NULL,
  id_usuario int(11) NOT NULL,
  PRIMARY KEY (id_tarefa),
  CONSTRAINT fk_constraint_usuario FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


select * from usuarios;
select * from usuarios where id_usuario = 5;
select * from tarefas order by data_criacao asc;
select * from tarefas order by id_tarefa desc;
select * from usuarios inner join tarefas on tarefas.id_usuario =usuarios.id_usuario;

drop database dbagenda;
drop table usuarios;
drop table tarefas;