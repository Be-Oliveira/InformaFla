USE informafla;



select * from usuario;

desc usuario;
CREATE TABLE usuario (
idUsuario int primary key auto_increment,
Nickname varchar(100) UNIQUE,
Email varchar (45),
Senha varchar (45),
ConfirmacaoSenha varchar (45),
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

select * from usuario;
