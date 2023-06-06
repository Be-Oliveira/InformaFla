-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql - banco local - ambiente de desenvolvimento
*/

CREATE DATABASE informafla;
USE informafla;
CREATE TABLE usuario (
idUsuario int primary key auto_increment,
Nickname varchar(100) UNIQUE,
Email varchar (45),
Senha varchar (45),
ConfirmacaoSenha varchar (45)
);


CREATE TABLE camisa (
idCamisa int auto_increment,
Cor1 varchar (45),
Cor2 varchar (45),
Detalhes varchar (60), 
fkUsuario int,
constraint fkUsu foreign key (fkUsuario)
references usuario(idUsuario),
constraint pkComposta primary key (idCamisa, fkUsuario)
) auto_increment = 20;


 INSERT INTO camisa  VALUES
 (null, 'branco', 'vermelho','listras onduladas',1),
(null, 'preto', 'vermelho', 'linhas retas e horizontais',2);



CREATE TABLE idolos (
idIdolo int primary key auto_increment,
Nome varchar (45),
Geração varchar (45),
Posição varchar (45),
fkUsuario varchar(100),
constraint frkUsuario foreign key (fkUsuario)
references usuario(Nickname)
) auto_increment= 100;

select * from camisa;
desc usuario;



SELECT idolos.nome, idolos.geração, idolos.posição FROM usuario 
    right JOIN idolos
    ON idolos.fkUsuario = usuario.idUsuario;
    
select count(nome) as 'qtd_pessoas', nome as 'idolo nome' from idolos group by nome;

select * from idolos;
select * from usuario;
select * from camisa;
    
   



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
CREATE TABLE usuario (
idUsuario int primary key auto_increment,
Nickname varchar(100) UNIQUE,
Email varchar (45),
Senha varchar (45),
ConfirmacaoSenha varchar (45)
);


CREATE TABLE camisa (
idCamisa int auto_increment,
Cor1 varchar (45),
Cor2 varchar (45),
Detalhes varchar (60), 
fkUsuario int,
constraint fkUsu foreign key (fkUsuario)
references usuario(idUsuario),
constraint pkComposta primary key (idCamisa, fkUsuario)
) auto_increment = 20;


 INSERT INTO camisa  VALUES
 (null, 'branco', 'vermelho','listras onduladas',1),
(null, 'preto', 'vermelho', 'linhas retas e horizontais',2);



CREATE TABLE idolos (
idIdolo int primary key auto_increment,
Nome varchar (45),
Geração varchar (45),
Posição varchar (45),
fkUsuario varchar(100),
constraint frkUsuario foreign key (fkUsuario)
references usuario(Nickname)
) auto_increment= 100;

select * from camisa;
desc usuario;



SELECT idolos.nome, idolos.geração, idolos.posição FROM usuario 
    right JOIN idolos
    ON idolos.fkUsuario = usuario.idUsuario;
    
select count(nome) as 'qtd_pessoas', nome as 'idolo nome' from idolos group by nome;

select * from idolos;
select * from usuario;
select * from camisa;
    
   


 

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
