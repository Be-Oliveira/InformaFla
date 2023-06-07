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

select * from camisa;

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
    
   