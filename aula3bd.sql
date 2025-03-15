select CodigodoFornecedor from Fornecedores

select distinct CodigodoFornecedor from Produtos

select NomeDoProduto, NomeDaEmpresa
from Produtos p, Fornecedores f
where p.CodigoDoFornecedor = f.CodigoDoFornecedor

select p.NomeDoProduto, f.NomeDaEmpresa, c.NomeDaCategoria
from Produtos p
join Fornecedores f
on p.CodigoDoFornecedor = f.CodigoDoFornecedor
join Categorias c
on p.CodigoDaCategoria = c.CodigoDaCategoria
order by p.NomeDoProduto


select * from Clientes

select distinct CodigoDoCliente from Pedidos

-- Código do cliente, nome do contato, número do pedido

select c.CodigoDoCliente, c.NomeDoContato, p.NumeroDoPedido
from Clientes c
left join Pedidos p
on p.CodigoDoCliente = c.CodigoDoCliente
where p.NumeroDoPedido is null


select c.CodigoDoCliente, c.NomeDoContato, p.NumeroDoPedido
from Clientes c
left join Pedidos p
on p.CodigoDoCliente = c.CodigoDoCliente
where month(p.DataDoPedido) in (4,5,6)

select month(DataDoPedido) from Pedidos