-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql - banco local - ambiente de desenvolvimento
*/

CREATE DATABASE informafla;
USE informafla;


select * from usuario;

desc usuario;
CREATE TABLE usuario (
idUsuario int primary key auto_increment,
Nickname varchar(100),
Email varchar (45),
Senha varchar (45),
fkIdolos int,
constraint fkIdol foreign key (fkIdolos)
references idolos(idIdolo)
);


CREATE TABLE resultados (
idResultado int,
dtJogo datetime,
acertos int,
erros int, 
fkUsuario int,
constraint fkUsu foreign key (fkUsuario)
references usuario(idUsuario),
constraint pkComposta primary key (idResultado, fkUsuario)
);



CREATE TABLE idolos (
idIdolo int primary key auto_increment,
Nome varchar (45),
Geração varchar (45),
Posição varchar (45)
) auto_increment= 100;



/* create table aquario ( 
 em nossa regra de negócio, um aquario tem apenas um sensor 
	id INT PRIMARY KEY AUTO_INCREMENT,
	descricao VARCHAR(300) 
); 

 esta tabela deve estar de acordo com o que está em INSERT de sua API do arduino - dat-acqu-ino 

create table medida (
	id INT PRIMARY KEY AUTO_INCREMENT,
	dht11_umidade DECIMAL,
	dht11_temperatura DECIMAL,
	luminosidade DECIMAL,
	lm35_temperatura DECIMAL,
	chave TINYINT,
	momento DATETIME,
	fk_aquario INT,
	FOREIGN KEY (fk_aquario) REFERENCES aquario(id)
);


/*
comando para sql server - banco remoto - ambiente de produção
*/

CREATE DATABASE informafla;
USE informafla;


select * from usuario;

desc usuario;
CREATE TABLE usuario (
idUsuario int primary key auto_increment,
Nickname varchar(100),
Email varchar (45),
Senha varchar (45),
fkIdolos int,
constraint fkIdol foreign key (fkIdolos)
references idolos(idIdolo)
);


CREATE TABLE resultados (
idResultado int,
dtJogo datetime,
acertos int,
erros int, 
fkUsuario int,
constraint fkUsu foreign key (fkUsuario)
references usuario(idUsuario),
constraint pkComposta primary key (idResultado, fkUsuario)
);



CREATE TABLE idolos (
idIdolo int primary key auto_increment,
Nome varchar (45),
Geração varchar (45),
Posição varchar (45)
) auto_increment= 100;


 

/*
comandos para criar usuário em banco de dados azure, sqlserver,
com permissão de insert + update + delete + select
*/

CREATE USER [usuarioParaAPIWebDataViz_datawriter_datareader]
WITH PASSWORD = '#Gf_senhaParaAPIWebDataViz',
DEFAULT_SCHEMA = dbo;

EXEC sys.sp_addrolemember @rolename = N'db_datawriter',
@membername = N'usuarioParaAPIWebDataViz_datawriter_datareader';

EXEC sys.sp_addrolemember @rolename = N'db_datareader',
@membername = N'usuarioParaAPIWebDataViz_datawriter_datareader';
