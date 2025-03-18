use bdpedido
go

-- 1. Exibir o CódigoDoProduto, Desconto de todos os produtos já vendidos.

select CodigoDoProduto, Desconto from Detalhes_do_Pedido
order by CodigoDoProduto

-- 2. Exibir o CódigoDoProduto de todos os produtos já comercializados.

select CodigoDoProduto from Detalhes_do_Pedido
order by CodigoDoProduto

-- 3. Exibir o CódigoDoCliente de todos os clientes que já fizeram solicitação de pedidos.

select CodigoDoCliente from Pedidos

-- 4. Exibir o NomeDoCliente, Endereço e uma coluna adicional com a palavra “Cliente preferencial”.

select NomeDoContato as NomeDoCliente, Endereco, 'Cliente preferencial' from Clientes

-- 5. Exibir os 25% dos registros existentes na tabela Produtos.

select top 25 percent * from Produtos

-- 6. Exibir os 50% dos registros existentes na tabela Funcionários.

select top 50 percent * from Funcionarios

-- 7. Exibir os 10% dos registros existentes na tabela Pedido.

select top 10 percent * from Pedidos

-- 8. Exibir os 17% dos registros existentes na tabela Fornecedores.

select top 17 percent * from Fornecedores

-- 9. Exibir os 85% dos registros existentes na tabela Categoria.

select top 85 percent * from Categorias

-- 10. Exibir todas as cidades dos funcionários sem haver repetição de linhas.

select distinct Cidade from Funcionarios	

-- 11. Exibir todas as regiões dos funcionários sem haver repetição de linhas.

select distinct Regiao from Funcionarios

-- 12. Exibir todos os paises dos fornecedores sem haver repetição de linhas.

select distinct Pais from Funcionarios

-- 13. Exibir o código do cliente que já fizeram pedido em nossa loja, sem haver repetição de linha.

select distinct CodigoDoCliente from Pedidos

-- 14. Exibir o código de todos os produtos que já foram vendidos em nossa loja, sem haver repetição de linhas.

select distinct CodigoDoProduto from Detalhes_do_Pedido

-- 15. Exibir o CódigoDoProduto, NomeDoProduto, PreçoUnitário e uma coluna adicional com um acrescimo de 7% sobre o PreçoUnitário da tabela Produtos.

select CodigoDoProduto, NomeDoProduto, PrecoUnitario, (PrecoUnitario + (PrecoUnitario * 0.07)) as 'Acréscimo de 7%' from Produtos

-- 16. Exibir o NúmeroDoPedido, PreçoUnitário, Desconto e uma coluna adicional com a diferença entre o PreçoUnitário e o Desconto (é dado em percentagem), com o título “Preço Final”.

select NumeroDoPedido, PrecoUnitário, Desconto, (PrecoUnitário - Desconto) as 'Preço Final' from Detalhes_do_Pedido

-- 17. Exibir o NúmeroDoPedido, uma coluna adicional com o preço total (PreçoUnitário * Quantidade) com o título “Preço Total” e uma coluna adicional com o preço final ((PreçoUnitário * Quantidade) – Desconto (é dados em percentagem)) com o título “Preço Final” da tabela DetalheDoPedido.

select NumeroDoPedido, (PrecoUnitário * Quantidade) as 'Preço Total', ((PrecoUnitário * Quantidade) - Desconto) as 'Preço Final' from Detalhes_do_Pedido

-- 18. Exibir o PreçoUnitário, uma coluna adicional com o preço unitário acrescido de 25%, uma coluna adicional com o preço unitário acrescido de 35% e uma coluna adicional com o preço unitário acrescido de 45%, da tabela Produtos, coloque um título para cada coluna adicional.

select PrecoUnitario, (PrecoUnitario + (PrecoUnitario * 0.25)) as 'Acréscimo de 25%', (PrecoUnitario + (PrecoUnitario * 0.35)) as 'Acréscimo de 35%', (PrecoUnitario + (PrecoUnitario * 0.45)) as 'Acréscimo de 45%' from Produtos

-- 19. Exibir o NúmeroDoPedido, Frete, uma coluna adicional com o Frete acrescido de 5% e uma coluna adicional com o Frete acrescido de 10%, da tabela Pedido, coloque um título para cada coluna adicional.

select NumeroDoPedido, Frete, (Frete + (Frete * 0.05)) as 'Acréscimo de 5%', (Frete + (Frete * 0.10)) as 'Acréscimo de 10%' from Pedidos

-- 20. Exibir o CódigoDoProduto, NomeDoProduto, NívelDeReposição e uma coluna adicional com o NívelDeReposição acrescido de 5, coloque um título da coluna que você adicionou, da tabela Produtos.

select CodigoDoProduto, NomeDoProduto, NivelDeReposicao, (NivelDeReposicao + (NivelDeReposicao * 0.05)) as 'Acréscimo de 5%' from Produtos

-- 21. Exibir o CódigoDoProduto, uma coluna adicional com o total em estoque (PreçoUnitário * UnidadesEmEstoque) com o título “Total em Estoque” da tabela Produtos.

select CodigoDoProduto, (PrecoUnitario * UnidadesEmEstoque) as 'Total em Estoque' from Produtos

-- 22. Exibir o NúmeroDoPedido, CódigoDoProduto, PreçoUnitário, Quantidade, uma coluna com o preço total acrescido de 20% com o título “Cheque p/ 30 dias”, uma coluna com o preço total acrescido de 30% com o título “Cheque p/ 60 dias” e uma coluna com o preço total descontado de 15% com o título “À vista”, da tabela DetalhesDoPedido.

select NumeroDoPedido, CodigoDoProduto, PrecoUnitário, Quantidade, ((PrecoUnitário * Quantidade) * 0.20 + (PrecoUnitário * Quantidade)) as 'Cheque p/ 30 dias', ((PrecoUnitário * Quantidade) * 0.30 + (PrecoUnitário * Quantidade)) as 'Cheque p/ 60 dias', ((PrecoUnitário * Quantidade) - (PrecoUnitário * Quantidade) * 0.15) as 'À vista' from Detalhes_do_Pedido

-- 23. Exibir o CódigoDoProduto, NomeDoProduto, NívelDeReposição e uma coluna adicional com um acréscimo de 5 no NívelDeReposição, da tabela Produtos.

select CodigoDoProduto, NomeDoProduto, NivelDeReposicao, (NivelDeReposicao + (NivelDeReposicao * 0.05)) as 'Acréscimo de 5%' from Produtos

-- 24. Exibir o NúmeroDoPedido, CódigoDoCliente com título “Cliente”, CódigoDoFuncionário e uma coluna com o valor do frete descontado 7% e título “Frete c/ desconto”.

select NumeroDoPedido, CodigoDoCliente as 'Cliente', CodigoDoFuncionario, (Frete - (Frete * 0.07)) as 'Frete c/ desconto' from Pedidos

-- 25. Exibir o Nome e Sobrenome dos funcionários por ordem decrescente de nome.

select Nome, Sobrenome from Funcionarios
order by Nome desc

-- 26. Exibir o CódigoDoProduto, NomeDoProduto e PreçoUnitário por ordem crescente de NomeDoProduto.

select CodigoDoProduto, NomeDoProduto, PrecoUnitario from Produtos
order by NomeDoProduto

-- 27. Exibir o CódigoDoProduto com título “Cód.”, NomeDoProduto com título “Produto” e PreçoUnitário com título “P. Unitário”, por ordem decrescente de CódigoDoProduto.

select CodigoDoProduto as 'Cód.', NomeDoProduto as 'Produto', PrecoUnitario as 'P. Unitário' from Produtos
order by CodigoDoProduto desc

-- 28. Exibir País, Região, CódigoDoFornecedor, NomeDaEmpresa e NomeDoContato da tabela Fornecedores por ordem crescente de País, decrescente de Região e crescente de NomeDaEmpresa.

select Pais, Regiao, CodigoDoFornecedor, NomeDaEmpresa, NomeDoContato from Fornecedores
order by Pais, Regiao desc, NomeDaEmpresa

-- 29. Exibir o CódigoDoFuncionário,SobreNome e Nome dos funcionários por ordem crescente de País.

select CodigoDoFuncionario, Sobrenome, Nome from Funcionarios
order by Pais