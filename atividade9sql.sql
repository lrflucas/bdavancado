use bdpedido
go

-- 1. Crie uma visão chamada “View_FornecedorPais” que exiba “NomeDaEmpresa”, “Endereco” e “Pais” da tabela “Fornecedores”.

create view View_FornecedorPais
as
select NomeDaEmpresa, Endereco, Pais
from Fornecedores;

-- 2. Crie uma visão chamada “View_Funcionarios” que mostre os funcionários cujo tratamento seja “Sra.” da tabela “Funcionarios”.

create view View_Funcionarios
as
select Nome, Sobrenome
from Funcionarios
where Tratamento like 'Sra.';

-- 3. Crie uma visão chamada “View_TotalPedidosPorCliente” que exiba o “NomeDaEmpresa” e o “TotalPedidos”.

create view View_TotalPedidosPorCliente
as
select c.NomeDaEmpresa, count(p.CodigoDoCliente) as TotalPedidos
from Pedidos p
join Clientes c
on c.CodigoDoCliente = p.CodigoDoCliente
group by c.NomeDaEmpresa;

-- 4. Crie uma visão chamada “View_TotalFuncionario” que combine dados das tabelas “Funcionarios” e “Pedidos” para mostrar “Nome”, “Cargo” e o total de pedidos feito por cada funcionário.

create view View_TotalFuncionario
as
select f.Nome, f.Cargo, count(p.CodigoDoFuncionario) as TotalPedidos
from Pedidos p
join Funcionarios f
on f.CodigoDoFuncionario = p.CodigoDoFuncionario
group by f.Nome, f.Cargo;

-- 5. Altere a visão “View_FornecedorPais” para incluir a coluna “Cidade”.

alter view View_FornecedorPais
as
select NomeDaEmpresa, Endereco, Pais, Cidade
from Fornecedores;

-- 6. Crie uma visão chamada “View_TotalCargo” que combine dados das tabelas “Funcionarios” e “Pedidos” para mostrar “Cargo” e o total de pedidos feito por cada Cargo.

create view View_TotalCargo
as
select f.Cargo, count(p.CodigoDoFuncionario) as TotalPedidos
from Pedidos p
join Funcionarios f
on f.CodigoDoFuncionario = p.CodigoDoFuncionario
group by f.Cargo;

-- 7. Exclua a visão “View_TotalFuncionario”.

drop view View_TotalFuncionario;

-- 8. Crie uma visão chamada “View_FornecedoresCidade” que mostre apenas o “NomeDaEmpresa”, “Endereco” e “Cidade” da tabela “Fornecedores”,
-- cuja cidade esteja entre London, Osaka, Berlin e São Paulo.

create view View_FornecedoresCidade
as
select NomeDaEmpresa, Endereco, Cidade
from Fornecedores
where Cidade in ('London', 'Osaka', 'Berlin', 'São Paulo');

-- 9. Faça uma consulta à visão “View_FornecedoresCidade” para mostrar todos os clientes que moram em “São Paulo”.

select * from View_FornecedoresCidade
where Cidade like 'São Paulo';

-- 10. Faça uma consulta à visão “View_TotalCargo” para mostrar todos os Funcionários com cargo “Representante de Vendas”.

select * from View_TotalCargo
where Cargo like 'Representante de Vendas';