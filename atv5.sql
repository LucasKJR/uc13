
-- Seguran�a da Informa��o - Controle de Acesso - comandos DCL do SQL

create login usuario with password = 'Abc12345';

use clinica;

create user usu for login usuario;

grant select to usu;

grant insert to usu;

revoke select from adm;



EXEC clinica.dbo.sp_helprotect @username = 'usu';


-- Teste de login com controle de acesso - comandos DML do SQL ---------------


 select * from consulta;

insert into Habilidades values('teste','testedddd');

delete from Habilidades where NomeHabilidade = 'teste';

-- insert into paciente values('789.012.345-67','Ab�lio Sanches','(11)99012-3456',901234,'Ultramed','Padr�o');



-- Exclus�o de usu�rio e login

-- drop user usuario_consulta;

-- drop login aluno;


