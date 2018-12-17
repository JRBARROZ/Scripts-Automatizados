use cadastro;
show tables;
select * from cursos Where ano between '2014' and '2016' order by ano desc;
select * from cursos where ano = '2016' order by ano desc, nome asc;
select * from cursos where nome like 'p%';
select distinct carga from cursos;
select avg(totaulas)from cursos;
select sum(totaulas) from cursos;
select min(totaulas) from cursos where ano = '2016';
select nome, min(totaulas) from cursos where ano = '2016';
select * from cursos where ano in('2016', '2015', '2017') order by ano desc;
select * from cursos where carga < 30 and totaulas < 35 and descricao = 'lógica de programação' order by desc;
select * from cursos where carga > 30 or totaulas < 30 order by ano desc;
describe gafanhotos;
describe cursos;
alter table gafanhotos add column curso_fk int after id;
alter table gafanhotos add constraint curso_id foreign key (curso_fk) references cursos(idcurso);
select * from gafanhotos;
select g.nome, g.curso_fk, c.nome, c.ano from gafanhotos as g inner join cursos as c on c.idcurso = g.curso_fk order by g.nome;
delete from cursos where idcurso = '9'; 
update gafanhotos set curso_fk = '8' where id = 1;
create database testando default charset = 'utf8' default collate utf8_general_ci;
use testando;

create table teste(
	nome varchar(30),
    id_teste int not null auto_increment,
    constraint teste_pk PRIMARY KEY (id_teste)

);
