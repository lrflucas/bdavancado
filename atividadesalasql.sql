-- criação do banco
create database Locadora

use Locadora
go

-- criação das tabelas
create table Filme (
	IDFilme int identity(1,1) primary key,
	Nome nvarchar(30),
	Duracao int,
	Categoria nvarchar(13)
);

create table Ator (
	IDAtor int identity(1,1) primary key,
	Ator nvarchar(20),
	Cache smallint,
	Produtora nvarchar(30)
);

create table TipoParticipacao(
	IDTipo int identity(1,1) primary key,
	Tipo nvarchar(30)
);

create table Filme_Ator(
	IDFilme int,
	IDAtor int,
	IDTipo int,
	primary key (IDFilme, IDAtor),
	constraint FK_FilmeAtor_Tipo foreign key (IDTipo) references TipoParticipacao(IDtipo)
);

-- criação das constraints
alter table Filme
add constraint CHK_IDFilme check (IDFilme >= 1 and IDFilme <= 2000);

alter table Ator
add constraint CHK_IDAtor check (IDAtor >= 1 and IDAtor <= 999);

alter table Ator
add constraint CHK_ValorCache check (Cache <= 45000);

alter table TipoParticipacao
add constraint CHK_IDTipo check (IDTipo >= 1 and IDTipo <= 100);

alter table Filme_Ator
add constraint CHK_IDFilmeAtor check (IDFilme >= 1 and IDFilme <= 999);


-- povoando tabelas
insert into Filme (Nome, Duracao, Categoria) values
('Xuxa e os duendes', 180, 'Infantil'),
('Super-Homem', 200, 'Aventura'),
('Senhor dos Anéis', 450, 'Ficção'),
('Triplo X', 180, 'Ação'),
('A procura de Nemo', 180, 'Infantil'),
('Connan', 300, 'Ação');

insert into TipoParticipacao (Tipo) values
('Ator Principal'),
('Ator Secundário'),
('Figurante'),
('Duble'),
('Participação Especial');

insert into Ator (Ator, Cache, Produtora) values
('Tom Hanks', 20000, 'Universal Pictures'),
('Meryl Streep', 15000, 'Warner Bros.'),
('Leonardo DiCaprio', 25000, 'Paramount Pictures'),
('Jennifer Lawrence', 18000, '20th Century Studios'),
('Robert Downey Jr.', 13000, 'Marvel Studios'),
('Angelina Jolie', 22000, 'Columbia Pictures'),
('Will Smith', 28000, 'Sony Pictures'),
('Scarlett Johansson', 27000, 'Disney');


-- inserindo alguns registros na tabela Filme_Ator
insert into Filme_Ator (IDFilme, IDAtor, IDTipo) values
(2, 5, 3),
(3, 3, 4);

-- alterando duração do filme triplo x
update Filme
set Duracao = 200
where IDFilme = 4;

-- alterando categoria do filme connan
update Filme
set Categoria = 'Aventura'
where IDFilme = 6;

-- apagando o tipo de participação 2
delete from TipoParticipacao
where IDTipo = 2;

-- apagando todos os filmes com duração acima de 410
delete from Filme
where Duracao > 410;

-- criando tabela Controle_Exclusao
create table Controle_Exclusao(
	IDExclusao int identity(1,1) primary key,
	IDFilme int,
	IDAtor int,
	IDTipo int
);

-- criando trigger tgr_monitora_filme_ator
create trigger tgr_monitora_filme_ator
on Filme_Ator
after delete
as
begin
	insert into Controle_Exclusao (IDFilme, IDAtor, IDTipo)
	select IDFilme, IDAtor, IDTipo
	from deleted;
end;

delete from Filme_Ator
where IDFilme = 3 and IDTipo = 4;

select * from Controle_Exclusao	