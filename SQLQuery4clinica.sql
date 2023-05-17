create DATABASE clinicaUc13;
go
use clinicaUc13;
go
create TABLE paciente(
	cpf varchar(14) primary key,
	nome_paciente varchar(40) not null,
	telefone varchar(14) not null,
	numero_plano int not null,
	nome_plano varchar(20) not null,
	tipo_plano varchar(10) not null
	)
create TABLE medico(
	crm int primary key,
	nome_medico varchar(30) not null,
	especialidade varchar(20) not null
	)
create TABLE exame(
	codigo int primary key,
	especificacao varchar(20) not null,
	preco money not null
)
create TABLE consulta(
	numero_consulta int identity(23000,1) primary key,
	data_exame date,
	horario_consulta time,
	fk_paciente_cpf varchar(14),
	fk_medico_crm int
)
create TABLE pedido_exame(
	numero_pedido int identity(2300,1)primary key, 
	resultado varchar(40) not null,
	data_exame date,
	valor_pagar money,
	fk_consulta_numero_consulta int,
	fk_exame_codigo int,
)
ALTER TABLE pedido_exame ADD CONSTRAINT fk_pedido_exame_2
FOREIGN KEY (fk_consulta_numero_consulta)
REFERENCES consulta (numero_consulta)
ON DELETE CASCADE;
ALTER TABLE pedido_exame ADD CONSTRAINT fk_pedido_exame_3
FOREIGN KEY (fk_exame_codigo)
REFERENCES exame (codigo);
ALTER TABLE consulta ADD CONSTRAINT fk_consulta_2
FOREIGN KEY (fk_paciente_cpf)
REFERENCES paciente (cpf)
ON DELETE CASCADE;
ALTER TABLE consulta ADD CONSTRAINT fk_consulta_3
FOREIGN KEY (fk_medico_crm)
REFERENCES medico (crm)
ON DELETE CASCADE;
insert into paciente values('999999999','gabriel','(99)999999999',0001,'prata','economico');
insert into paciente values('999999998','alfonso','(99)999999998',0002,'gold','basico');
insert into paciente values('999999997','jorge','(99)999999997',0003,'platinium','vip');
insert into paciente values('999999996','claudio','(99)999999997',004,'esmerald','vip');
select * from paciente

insert into medico values(0001,'alberto reis','anestesista');
insert into medico values(0002,'maria','pedagoga');
insert into medico values(0003,'robin','cirurgiao');
select * from medico

insert into exame values(0001,'tirar sangue',50);
insert into exame values(0002,'raio-x',100);
insert into exame values(0003,'clinico geral',100);
insert into exame values(0004,'radiografia',100);
select * from exame

insert into consulta values('2023/05/17','11:51','999999999',0001);
insert into consulta values('2023/05/17','11:51','999999998',0002);
insert into consulta values('2023/05/17','11:51','999999996',0003);
select * from consulta

insert into pedido_exame values ('Excessao','2023/05/17',50,0001,0001);
insert into pedido_exame values ('penddente','2023/05/17',100,0002,0002);
insert into pedido_exame values ('normal','2023/05/17',100,0004,0002);
select * from pedido_exame

select * from paciente;

update paciente set nome_paciente = 'Pedro' where cpf= 322323232323;

select * from paciente;
select * from paciente;
delete from paciente where cpf= 322323232323;
select * from paciente;
