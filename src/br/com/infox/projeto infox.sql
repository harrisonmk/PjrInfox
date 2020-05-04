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


-- a linha abaixo exibe os dados da tabela (CRUD)
-- read -> select

 select * from tbusuarios;
 
insert into tbusuarios (iduser,usuario,fone,login,senha)
values (2,'Administrador','996881919','admin','admin');


insert into tbusuarios(iduser,usuario,fone,login,senha)
values (4,'Harrison','67996881919','HarrisonMK','Harrison14');

insert into tbusuarios(iduser,usuario,fone,login,senha,perfil)
values (6,'maria','1235465','maria123','123','user');


-- a linha abaixo adiciona um campo a tabela
alter table tbusuarios add column perfil varchar (20) not null;

-- a linha abaixo remove um campo da tabela
-- alter table tbusuarios drop column perfil;

-- a linha abaixo da perfil de administrador
-- update tbusuarios set perfil='admin' where iduser=2; 
-- update tbusuarios set perfil='admin' where iduser=4;

-- a linha abaixo da perfil de usuario
-- update tbusuarios set perfil='user' where iduser=5;

-- a linha abaixo modifica dados na tabela (CRUD)
-- update -> update

-- update tbusuarios set fone='8888-8888' where iduser=2; 

-- update tbusuarios set usuario='HarrisonMK' where iduser=4;

-- a linha abaixo apaga um registro da tabela (CRUD)
-- delete -> delete

describe tbusuarios;

-- delete from tbusuarios where iduser=3;

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
 
 
 -- a linha abaixo procura todos os nomes com a letra j
 select * from tbclientes where nomecli like 'j%';
 
 -- a linha abaixo mostra os ids nomes com Jo e o telefone
 select idcli,nomecli,fonecli from tbclientes where nomecli like 'jo%';
 
 -- substitui o nome da variavel pelo nome que coloquei depois do as
 select idcli as Id,nomecli as Nome ,fonecli as Fone from tbclientes where nomecli like 'jo%';
 
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
 
 -- a linha abaixo altera a tabela tbos adicionando o campo tipo apos a coluna data_os
 alter table tbos add tipo varchar (15) not null after data_os;
 
 -- a linha abaixo altera a tabela tbos adicionando o campo situacao apos a coluna tipo
 alter table tbos add situacao varchar (50) not null after tipo;

 
 
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

-- cria duas novas
alter table tbos add column tipo varchar(22);
alter table tbos add column situacao varchar(50);


-- o bloco de instrução abaixo faz a seleção e união de duas tabelas
-- OSER é uma variavel que contem os campos desejados da tabela OS
-- CLI é outra variavel que contem os campos dejesados da da tabela clientes

select OSER.os,data_os,tipo,situacao,equipamento,valor, Cli.nomecli,fonecli from tbos as OSER inner join tbclientes as CLI on (Cli.idcli = OSER.idcli);