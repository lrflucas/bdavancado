select avg(PrecoUnitário) from Detalhes_do_Pedido


select count(CodigoDoFuncionario) from Pedidos
group by CodigoDoFuncionario

select CodigoDoFuncionario, count(CodigoDoFuncionario) as total from Pedidos
group by CodigoDoFuncionario
order by total


select Pais, Cidade, count(*) from Clientes -- count(*) ou count(Pais, Cidade), tanto faz
group by Pais, Cidade                       -- group by só funciona se a mesma coluna que ele selecionar, estiver em cima no select
order by Pais, Cidade

select Pais, Cidade, count(*) as total from Clientes
group by Pais, Cidade                       
order by total desc


-- Qual é a quantidade de produtos vendidos por categoria?
-- Qual é o faturamento já realizado por categoria?

select c.NomeDaCategoria, count(*) as 'Quantidade' from Detalhes_do_Pedido d
join Produtos p on d.CodigoDoProduto = p.CodigoDoProduto
join Categorias c on p.CodigoDaCategoria = c.CodigoDaCategoria
group by p.CodigoDaCategoria, c.NomeDaCategoria
order by Quantidade desc

select c.NomeDaCategoria, sum(d.PrecoUnitário * d.Quantidade) as 'total' from Detalhes_do_Pedido d
join Produtos p on d.CodigoDoProduto = p.CodigoDoProduto
join Categorias c on p.CodigoDaCategoria = c.CodigoDaCategoria
group by c.NomeDaCategoria
order by total desc
 

select * from Produtos

select avg(PrecoUnitario) from Produtos

select * from Produtos
where PrecoUnitario > (select avg(PrecoUnitario) from Produtos)

select * from Produtos
where CodigoDaCategoria in (
select CodigoDaCategoria from Categorias
where CodigoDaCategoria >= 5
)
