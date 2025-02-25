select CodigoDoCliente as Codigo, NomeDaEmpresa as Empresa
from Clientes
where IDCliente <= 8

select * from Produtos

select NomeDoProduto as Produto,
       PrecoUnitario,
	   PrecoUnitario * 0.05 as "Aumento5%",
	   PrecoUnitario * 0.10 as "Aumento10%",
	   PrecoUnitario - (PrecoUnitario * 0.25)
from Produtos

select * from Produtos where UnidadesEmEstoque = 0

select * from Produtos where NomeDoProduto like 'A%'

select * from Produtos where QuantidadePorUnidade like '%lata%'

select * from Clientes

select NomeDaEmpresa, Fax, Endereco
from Clientes
where Endereco like 'Av.%' and Fax != null --ou Fax is not null


select * from Funcionarios

select top 8 NomeDoProduto, PrecoUnitario from Produtos
order by PrecoUnitario desc

select distinct Cidade from Funcionarios


select * from Clientes

select distinct Pais, Cidade from Clientes
where Pais in ('Brasil', 'EUA')
order by Pais, Cidade


select * from Clientes
where IDCliente between 10 and 20