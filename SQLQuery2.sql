
create DATABASE RPG
go

use RPG
go
create TABLE Usuarios(
	IdUsuario int primary key identity,
	NomeUsuario varchar(40) not null,
	Senha varchar(255) not null,
	Telefone varchar(20)not null,
	Email varchar (40) unique not null,
)
go
create TABLE Classes(
	IdClasse int primary key identity,
	Tipo varchar (30) unique not null,
	DescricaoClasse varchar (255),
)
go
create TABLE Personagens(
	IdPersonagem int primary key identity,
	NomePersonagem varchar (30) unique not null,
	fk_IdUsuario int unique foreign key references Usuarios(IdUsuario),
	fk_IdClasse int foreign key references Classes(IdClasse)
)
go
create TABLE Habilidades(
	IdHabilidade int primary key identity,
	NomeHabilidade varchar (40) unique not null,
	DescricaoHabilidade varchar (255)
)
go
create TABLE ClassesHabilidades(
	fk_IdClasse int foreign key references Classes(IdClasse),
	fk_IdHabilidade int foreign key references Habilidades(IdHabilidade)
)
go
--Inserindo:
insert into Usuarios (Senha,NomeUsuario,Email,Telefone) values ('123','lucas','lucas@gmai.com','(21)93559-9877')
insert into Usuarios values ('kohagura', '321','(99)0123456789','locas@gmai.com')
insert into Classes values ('cavaleiro','caracteristicas')
insert into Classes values ('Barbaro', 'caracteristicas')
insert into Habilidades values ('Recuperar Vida', 'Descricao'),('lança mortal','Descricao de lança mortal'),('Escudo Supremo','')

insert into Personagens values ('Debug',1,1)
insert into ClassesHabilidades values (1,2),(1,1)
insert into Personagens values ('Kill3R',2,2)
insert into ClassesHAbilidades values (2,3), (2,1)
--modifica
update Usuarios set senha = '234' where IdUsuario = 1
--busca:
select * from Usuarios
select * from Classes
select * from Habilidades
select * from Personagens
select * from ClassesHabilidades

select IdUsuario, Email from Usuarios
select IdUsuario, Email from Usuarios where IdUsuario = 1


select * from Personagens 
join Usuarios
on Personagens.fk_IdUsuario = Usuarios.IdUsuario


select P.NomePersonagem, U.Email from Personagens P 
join Usuarios U
on P.fk_IdUsuario = U.IdUsuario



----------------------------------FIM DO DML/DQL------------------------------------------	