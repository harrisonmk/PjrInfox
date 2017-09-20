-- Comentarios
-- a linha abaixo cria um banco de dados
 create database dbinfox;
 
 -- a linha abaixo escolhe o banco de dados
 use dbinfox;
 
 -- o bloco de instruções abaixo cria uma tabela
 
 create table tbusuarios (
 
  iduser int primary key,
  usuario varchar (50) not null, /* not null obriga o preenchimento dessa variavel*/
  fone varchar (15),
  login varchar (15) not null unique, /* unique faz que apenas esse usuario tenha esse login */
  senha varchar (15) not null
  
 );
 
 -- o comando abaixo descreve a tabela
 
describe tbusuarios;

-- a linha abaixo insere dados na tabela (CRUD)
-- create -> insert

insert into tbusuarios (iduser,usuario,fone,login,senha)
values (1,'josé de assi','996881919','joseassis','123456');

-- a linha abaixo exibe os dados da tabela (CRUD)
-- read -> select

 select * from tbusuarios;
 
insert into tbusuarios (iduser,usuario,fone,login,senha)
values (2,'Administrador','996881919','admin','admin');
insert into tbusuarios (iduser,usuario,fone,login,senha)
values (3,'Bill gates','996881919','bill','123456');

-- a linha abaixo modifica dados na tabela (CRUD)
-- update -> update

update tbusuarios set fone='8888-8888' where iduser=2; 

-- a linha abaixo apaga um registro da tabela (CRUD)
-- delete -> delete

delete from tbusuarios where iduser=3;

select * from tbusuarios;


create table tbclientes (
idcli int primary key auto_increment, /* auto_increment gera altomaticamente o id*/
nomecli varchar (50) not null,
endcli varchar (100),
fonecli varchar (50) not null, /* not null obriga o usuario a preencher*/
emailcli varchar (50) 

);

describe tbclientes;

insert into tbclientes(nomecli,endcli,fonecli,emailcli)
values ('harrison','rua mamona','99688-1919','harrison.mitchell@hotmail.com');

 select * from tbclientes;
 
 
 use dbinfox;
 
 create table tbos (
 
 os int primary key auto_increment,
 data_os timestamp default current_timestamp,  /* altomaticamente gera a data e a hora do servidor*/
 equipamento varchar (150) not null,
 defeito varchar (150) not null,
 servico varchar (150),
 tecnico varchar (30),
 valor decimal(10,2),
 idcli int not null, /*chave estrangeira*/
 foreign key(idcli) references tbclientes(idcli) /*chave estrangeira*/
 
 );
 
 describe tbos;
 
 insert into tbos (equipamento,defeito,servico,tecnico,valor,idcli)
 values ('notbook','não liga','troca fonte','zé',87.50,1);
 
 select * from tbos;
 
 -- o codigo abaixo traz informações de duas tabelas
 
select
O.os,equipamento,defeito,servico,valor,
C.nomecli,fonecli
from tbos as O
inner join tbclientes as C
on (O.idcli = C.idcli); 