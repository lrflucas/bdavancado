use bdpedido
go

-- LISTA 6

-- 1. Exibir o total de frete pago.

select sum(Frete) from Pedidos

-- 2. Quantos funcionários foram contratados em 1992.

select count(*) from Funcionarios
where DataDeContratacao like '1992%'

-- 3. Quantos fornecedores são da Alemanha.

select Pais, count(*) from Fornecedores
where Pais like 'Alemanha'
group by Pais

-- 4. Qual o total de quantidades vendidas.

select sum(Quantidade) from Detalhes_do_Pedido

-- 5. Qual o valor do frete mais caro.

select max(Frete) from Pedidos

-- 6. Qual o valor do desconto mais barato.

select min(Desconto) from Detalhes_do_Pedido

-- 7. Quantos produtos são da categoria Condimentos (CódigoDaCategoria = 2).

select CodigoDaCategoria, count(*) from Produtos
where CodigoDaCategoria like '2'
group by CodigoDaCategoria

-- 8. Quantas categorias começam com a letra “C” (nome da categoria).

select count(*) from Categorias
where NomeDaCategoria like 'C%'

-- 9. Quantos produtos estão com o estoque abaixo do nível de reposição.

select count(*) from Produtos
where UnidadesEmEstoque < NivelDeReposicao

-- 10. Qual o valor total dos preços unitários em Produtos.

select sum(PrecoUnitario) from Produtos

-- 11. Quanto já foi vendido (PreçoUnitário * Quantidade) do produto cujo código é 51.

select sum(PrecoUnitário * Quantidade) from Detalhes_do_Pedido
where CodigoDoProduto = 51

-- 12. Quantos pedidos foram feitos pelo cliente cujo código é “ROMEY” no ano de 1996.

select CodigoDoCliente, count(*) from Pedidos
where CodigoDoCliente like 'ROMEY'
group by CodigoDoCliente

-- 13. Quantos funcionários fazem aniversário no mês de julho.

select count(*) from Funcionarios
where DataDeNascimento like '%-07-%'

-- 14. Quantos produtos começam com a “C” ou “G” ou “N”.

select count(*) from Produtos
where NomeDoProduto like 'C%' or NomeDoProduto like 'G%' or NomeDoProduto like 'N%'

-- 15. Quantos clientes estão localizados na Alemanha, México ou Reino Unido.

select Pais, count(*) from Clientes
where Pais like 'Alemanha' or Pais like 'México' or Pais like 'Reino Unido'
group by Pais

-- 16. Quantos clientes não possuem fax.

select count(*) from Clientes
where Fax is null

-- 17. Qual o total existente em estoque (PreçoUnitário*UnidadesEmEstoque).

select sum(PrecoUnitario * UnidadesEmEstoque) from Produtos

-- 18. Qual o total já vendido (PreçoUnitário*Quantidade).

select sum(PrecoUnitário * Quantidade) from Detalhes_do_Pedido

-- 19. Qual o total vendido (PreçoUnitário*Quantidade) do produto cujo código é 19.

select sum(PrecoUnitário * Quantidade) from Detalhes_do_Pedido
where CodigoDoProduto = 19

-- 20. Quanto de frete foi pago para os pedidos feitos pelo cliente cujo código é “LILAS”.

select sum(Frete) from Pedidos
where CodigoDoCliente like 'LILAS'

-- LISTA 7

-- 1. Exibir o nome do produto cujo preço unitário seja acima do preço unitário médio.

select NomeDoProduto, PrecoUnitario from Produtos
where PrecoUnitario > (select avg(PrecoUnitario) from Produtos)

-- 2. Exibir um relatório com o nome dos clientes que já compraram o produto “Maxilaku”.

select c.NomeDoContato from Clientes c
join Pedidos pe
on c.CodigoDoCliente = pe.CodigoDoCliente
join Detalhes_do_Pedido d
on pe.NumeroDoPedido = d.NumeroDoPedido
join Produtos pro
on d.CodigoDoProduto = pro.CodigoDoProduto
where pro.NomeDoProduto = 'Maxilaku'

-- 3. Exibir um relatório com o número do pedido de todos os pedidos que tiveram acima de 5 itens por pedido.

select distinct NumeroDoPedido from Detalhes_do_Pedido
where Quantidade > 5

-- 4. Exibir um relatório com o nome dos clientes e o valor do maior pedido feito por ele.

select c.NomeDoContato as NomeDoCliente, max(d.Quantidade * d.PrecoUnitário) from Clientes c
join Pedidos p 
on c.CodigoDoCliente = p.CodigoDoCliente
join Detalhes_do_Pedido d
on p.NumeroDoPedido = d.NumeroDoPedido
group by c.NomeDoContato

-- 5. Exibir um relatório com o nome do produto e a maior quantidade vendida desse produto.

select p.NomeDoProduto, max(d.Quantidade) from Produtos p
join Detalhes_do_Pedido d
on p.CodigoDoProduto = d.CodigoDoProduto
group by p.NomeDoProduto

-- 6. Exibir um relatório com o nome do produto e o preço mais baixo vendido desse produto.

select p.NomeDoProduto, min(d.PrecoUnitário) from Produtos p
join Detalhes_do_Pedido d
on p.CodigoDoProduto = d.CodigoDoProduto
group by p.NomeDoProduto

-- 7. Exibir o número do pedido de todos os pedidos cuja transportadora seja “Speedy Express” no segunda trimestre de 1996.

select p.NumeroDoPedido from Pedidos p
join Transportadoras t
on p.CodigoDaTransportadora = t.CodigoDaTransportadora
where t.NomeDaEmpresa like 'Speedy Express' and p.DataDoPedido between '1996-04-01' and '1996-06-30'

-- 8. Exibir um relatório com todos os números de pedidos realizados nos meses de Abril/96 e Março/97.

select NumeroDoPedido from Pedidos
where (DataDoPedido between '1996-04-01' and '1996-04-30') or (DataDoPedido between '1997-03-01' and '1997-03-31')

-- 9. Exibir um relatório com todos os números de pedidos que tiveram seu valor ((PreçoUnitário * Quantidade) – Desconto), acima da média das vendas relacionados no segundo trimestre de 1997.

select d.NumeroDoPedido from Detalhes_do_Pedido d
join Pedidos p
on d.NumeroDoPedido = p.NumeroDoPedido
where (d.PrecoUnitário * d.Quantidade - d.Desconto) > (select avg(d.PrecoUnitário * d.Quantidade - d.Desconto) from Detalhes_do_Pedido d
	join Pedidos p on d.NumeroDoPedido = p.NumeroDoPedido
    where p.DataDoPedido between '1997-04-01' and '1997-06-30')

-- 10. Exibir um relatório com o nome dos fornecedores que apresentam preço unitário dos seus produtos acima da média.

select f.NomeDaEmpresa as NomeDoFornecedor from Fornecedores f
join Produtos p 
on f.CodigoDoFornecedor = p.CodigoDoFornecedor
where p.PrecoUnitario > (select avg(PrecoUnitario) from Produtos)
group by f.NomeDaEmpresa

-- 11. Exibir um relatório com o nome do produto e o seu preço unitário de todos que pertença a categoria “Confeitos” (utilizando sub-query).

select NomeDoProduto, PrecoUnitario from Produtos
where CodigoDaCategoria in (select CodigoDaCategoria from Categorias where NomeDaCategoria = 'Confeitos')

-- 12. Exibir o número do pedido, código do cliente e a data do pedido de todos os pedidos das transportadora “Speedy Express” ou “Federal Shipping” (utilizando sub-query).

select NumeroDoPedido, CodigoDoCliente, DataDoPedido from Pedidos
where CodigoDaTransportadora in (select CodigoDaTransportadora from Transportadoras where NomeDaEmpresa in ('Speedy Express', 'Federal Shipping'))

-- 13. Exibir um relatório com o nome do cliente (NomeDaEmpresa), o número do pedido e a data do pedidos de todos os pedidos realizados no mês de agosto de 1996 ou no mês de setembro 1997.

select c.NomeDaEmpresa, p.NumeroDoPedido, p.DataDoPedido from Clientes c
join Pedidos p
on c.CodigoDoCliente = p.CodigoDoCliente
where (p.DataDoPedido between '1996-08-01' and '1996-08-31') or (p.DataDoPedido between '1997-09-01' and '1997-09-30')

-- 14. Exibir um relatório com todos os pedidos que foram feitos por clientes que apresentam Fax nulo.

select p.* from Pedidos p
join Clientes c
on p.CodigoDoCliente = c.CodigoDoCliente
where c.Fax is null

-- 15. Exibir um relatório com o nome dos clientes que tiveram o valor total de seus pedidos acima da média de pedidos.

select c.NomeDaEmpresa from Clientes c
join Pedidos p
on c.CodigoDoCliente = p.CodigoDoCliente
join Detalhes_do_Pedido d
on p.NumeroDoPedido = d.NumeroDoPedido
group by c.NomeDaEmpresa having sum(d.PrecoUnitário * d.Quantidade) > (select avg(TotalPedido) from (
																select sum(PrecoUnitário * Quantidade) AS TotalPedido from Detalhes_do_Pedido group by NumeroDoPedido) as SubqueryMedia)

-- 16. Exibir o nome dos funcionários que estão abaixo da média de idade.

select Nome, SobreNome from Funcionarios
where DataDeNascimento < (select avg(DataDeNascimento) from Funcionarios)

-- 17. Exibir o nome dos funcionários que estão acima da média do número de pedidos feito pelos funcionários.

select f.Nome, f.SobreNome from Funcionarios f
join Pedidos p 
on f.CodigoDoFuncionario = p.CodigoDoFuncionario
group by f.CodigoDoFuncionario, f.Nome, f.Sobrenome having count(p.NumeroDoPedido) > (select avg(PedidosPorFuncionário) from
															(select count(NumeroDoPedido) as PedidosPorFuncionário from Pedidos group by CodigoDoFuncionario) as SubqueryMedia)

-- 18. Exibir o número do pedido de todos os clientes que não apresentam Fax.

select p.NumeroDoPedido from Pedidos p
join Clientes c 
on p.CodigoDoCliente = c.CodigoDoCliente
where c.Fax is null

-- 19. Exibir o Nome dos clientes que ainda não efetuaram nenhum pedido.

select c.NomeDaEmpresa from Clientes c
left join Pedidos p 
on c.CodigoDoCliente = p.CodigoDoCliente
where p.NumeroDoPedido is null

-- 20. Exibir todos o pedidos que contiver algum produto cuja categoria seja “Bebidas”.

select distinct pe.NumeroDoPedido from Pedidos pe
join Detalhes_do_Pedido d
on pe.NumeroDoPedido = d.NumeroDoPedido
join Produtos pro 
on d.CodigoDoProduto = pro.CodigoDoProduto
join Categorias c
on pro.CodigoDaCategoria = c.CodigoDaCategoria
where c.NomeDaCategoria = 'Bebidas'

-- 21. Exibir o nome dos funcionários que fizeram pedidos para os clientes: Antonio Moreno Taquería, Blauer See Delikatessen e Ernst Handel.

select distinct f.Nome, f.SobreNome from Funcionarios f
join Pedidos p
on f.CodigoDoFuncionario = p.CodigoDoFuncionario
join Clientes c
on p.CodigoDoCliente = c.CodigoDoCliente
where c.NomeDaEmpresa in ('Antonio Moreno Taquería', 'Blauer See Delikatessen', 'Ernst Handel')

-- 22. Exibir o nome dos clientes cujo pedidos estejam com o valor do frete acima da média.

select distinct c.NomeDaEmpresa from Clientes c
join Pedidos p
on c.CodigoDoCliente = p.CodigoDoCliente
where p.Frete > (select avg(Frete) from Pedidos)

-- 23. Exibir o nome dos produtos cujo desconto dado esteja abaixo da média de descontos oferecidos aos produtos.

select distinct p.NomeDoProduto from Produtos p
join Detalhes_do_Pedido d
on p.CodigoDoProduto = d.CodigoDoProduto
where d.Desconto < (select avg(Desconto) from Detalhes_do_Pedido)

-- 24. Exibir o nome dos fornecedores cujo produto apresente preço unitário acima da média dos preços unitários.

select distinct f.NomeDaEmpresa from Fornecedores f
join Produtos p
on f.CodigoDoFornecedor = p.CodigoDoFornecedor
where p.PrecoUnitario > (select avg(PrecoUnitario) from Produtos)

-- 25. Exibir o nome dos produtos que apresentam unidades em estoque abaixo da média das quantidades vendidas.

select distinct p.NomeDoProduto from Produtos p
join Detalhes_do_Pedido d
on p.CodigoDoProduto = d.CodigoDoProduto
where p.UnidadesEmEstoque < (select avg(Quantidade) from Detalhes_do_Pedido)
