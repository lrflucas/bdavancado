<<<<<<< HEAD
use bdpedido
go

-- 1. Exibir CódigoDoCliente, NomeDaEmpresa e o Endereço de todos os clientes cadastrados na empresa.

select CodigoDoCliente, NomeDaEmpresa, Endereco from Clientes

-- 2. Exibir o SobreNome, Nome, DataDeNascimento, DataDeContratação de todos os funcionários da empresa.

select Sobrenome, Nome, DataDeNascimento, DataDeContratacao from Funcionarios

-- 3. Exibir CódigoDaCategoria, NomeDaCategoria e Descrição das categorias existentes.

select CodigoDaCategoria, NomeDaCategoria, Descricao from Categorias

-- 4. Exibir o NomeDaEmpresa, NomeDoContato e Telefone de todos os fornecedores da empresa.

select NomeDaEmpresa, NomeDoContato, Telefone from Fornecedores

-- 5. Exibir CódigoDoProduto, NomeDoProduto e PreçoUnitário de todos os produtos da empresa.

select CodigoDoProduto, NomeDoProduto, PrecoUnitario from Produtos

-- 6. Exibir o CódigoDaTransportadora, NomeDaEmpresa e Telefone das transportadoras cadastradas na empresa.

select CodigoDaTransportadora, NomeDaEmpresa, Telefone from Transportadoras

-- 7. Exibir o NomeDoCliente, Endereço e uma coluna adicional com a palavra “Cliente preferencial”.

select NomeDoContato as NomeDoCliente, Endereco, 'Cliente preferencial' from Clientes

-- 8. Exibir o CódigoDoProduto, uma coluna adicional “Produto existente” e o NomeDoProduto.

select CodigoDoProduto, 'Produto existente', NomeDoProduto from Produtos

-- 9. Exibir o Endereço, TelefoneResidencial, uma coluna adicional “Pertence ao quadro”, ramal e uma coluna adicional “Ativo” da tabela Funcionário.

select Endereco, TelefoneResidencial, 'Pertence ao quadro', Ramal, 'Ativo' from Funcionarios

-- 10. Exibir NomeDaCategoria, Descrição e uma coluna adicional “Definição” da tabela Categoria.

select NomeDaCategoria, Descricao, 'Definição' from Categorias

-- 11. Exibir os 5 primeiros registros, da tabela Pedido.

select top 5 * from Pedidos
order by NumeroDoPedido

-- 12. Exibir os 15 primeiros registros da tabela Funcionário.

select top 15 * from Funcionarios
order by CodigoDoFuncionario

-- 13. Exibir o NomeDaEmpresa dos 3 primeiros registro da tabela Fornecedor.

select top 3 NomeDaEmpresa from Fornecedores
order by CodigoDoFornecedor

-- 14. Exibir os 20 primeiros registro da tabela Produtos.

select top 20 * from Produtos
order by CodigoDoProduto

-- 15. Exibir os 2 primeiros registro da tabela Categoria.

select top 2 * from Categorias
order by CodigoDaCategoria

-- 16. Exibir o Nome, Cargo, Tratamento dos funcionários da empresa, dando os títulos: Funcionário, Função e Título respectivamente.

select Nome as Funcionário, Cargo as Função, Tratamento as Título from Funcionarios

-- 17. Exibir o NomeDaEmpresa, NomeDoContato e CargoDoContato da tabela Fornecedores, criando um título para cada coluna.

select NomeDaEmpresa as Empresa, NomeDoContato as Cliente, CargoDoContato as Cargo from Fornecedores

-- 18. Exibir o Nome, TelefoneResidencial com o título “Fone” e Observações com o título “Obs” da tabela Funcionários.

select Nome, TelefoneResidencial as Fone, Observacoes as Obs from Funcionarios

-- 19. Exibir NomeDaCategoria com o título “Categoria”, Descrição com o título “Observação” e uma coluna adicional com o conteúdo “Aprovado” cujo título seja “Situação”, da tabela Categoria.

select NomeDaCategoria as Categoria, Descricao as Observação, 'Aprovado' as 'Situação' from Categorias

-- 20. Exibir o CódigoDoProduto, NomeDoProduto, PreçoUnitário e uma coluna adicional com um acrescimo de 7% sobre o PreçoUnitário da tabela Produtos.

select CodigoDoProduto, NomeDoProduto, PrecoUnitario, PrecoUnitario * 0.07 as 'Acréscimo de 7%' from Produtos

-- 21. Exibir o Nome e Sobrenome dos funcionários por ordem decrescente de nome.

select Nome, Sobrenome from Funcionarios
order by Nome desc

-- 22. Exibir o CódigoDoProduto, NomeDoProduto e PreçoUnitário por ordem crescente de NomeDoProduto.

select CodigoDoProduto, NomeDoProduto, PrecoUnitario from Produtos
order by NomeDoProduto

-- 23. Exibir o CódigoDoProduto com título “Cód.”, NomeDoProduto com título “Produto” e PreçoUnitário com título “P. Unitário”, por ordem decrescente de CódigoDoProduto.

select CodigoDoProduto as 'Cód.', NomeDoProduto as Produto, PrecoUnitario as 'P. Unitário' from Produtos
order by CodigoDoProduto desc

-- 24. Exibir País, Região, CódigoDoFornecedor, NomeDaEmpresa e NomeDoContato da tabela Fornecedores por ordem crescente de País, decrescente de Região e crescente de NomeDaEmpresa.

select Pais, Regiao, CodigoDoFornecedor, NomeDaEmpresa, NomeDoContato from Fornecedores
order by Pais, Regiao desc, NomeDaEmpresa

-- 25. Exibir o CódigoDoFuncionário,SobreNome e Nome dos funcionários por ordem crescente de País.

select CodigoDoFuncionario, Sobrenome, Nome from Funcionarios
=======
use bdpedido
go

-- 1. Exibir CódigoDoCliente, NomeDaEmpresa e o Endereço de todos os clientes cadastrados na empresa.

select CodigoDoCliente, NomeDaEmpresa, Endereco from Clientes

-- 2. Exibir o SobreNome, Nome, DataDeNascimento, DataDeContratação de todos os funcionários da empresa.

select Sobrenome, Nome, DataDeNascimento, DataDeContratacao from Funcionarios

-- 3. Exibir CódigoDaCategoria, NomeDaCategoria e Descrição das categorias existentes.

select CodigoDaCategoria, NomeDaCategoria, Descricao from Categorias

-- 4. Exibir o NomeDaEmpresa, NomeDoContato e Telefone de todos os fornecedores da empresa.

select NomeDaEmpresa, NomeDoContato, Telefone from Fornecedores

-- 5. Exibir CódigoDoProduto, NomeDoProduto e PreçoUnitário de todos os produtos da empresa.

select CodigoDoProduto, NomeDoProduto, PrecoUnitario from Produtos

-- 6. Exibir o CódigoDaTransportadora, NomeDaEmpresa e Telefone das transportadoras cadastradas na empresa.

select CodigoDaTransportadora, NomeDaEmpresa, Telefone from Transportadoras

-- 7. Exibir o NomeDoCliente, Endereço e uma coluna adicional com a palavra “Cliente preferencial”.

select NomeDoContato as NomeDoCliente, Endereco, 'Cliente preferencial' from Clientes

-- 8. Exibir o CódigoDoProduto, uma coluna adicional “Produto existente” e o NomeDoProduto.

select CodigoDoProduto, 'Produto existente', NomeDoProduto from Produtos

-- 9. Exibir o Endereço, TelefoneResidencial, uma coluna adicional “Pertence ao quadro”, ramal e uma coluna adicional “Ativo” da tabela Funcionário.

select Endereco, TelefoneResidencial, 'Pertence ao quadro', Ramal, 'Ativo' from Funcionarios

-- 10. Exibir NomeDaCategoria, Descrição e uma coluna adicional “Definição” da tabela Categoria.

select NomeDaCategoria, Descricao, 'Definição' from Categorias

-- 11. Exibir os 5 primeiros registros, da tabela Pedido.

select top 5 * from Pedidos
order by NumeroDoPedido

-- 12. Exibir os 15 primeiros registros da tabela Funcionário.

select top 15 * from Funcionarios
order by CodigoDoFuncionario

-- 13. Exibir o NomeDaEmpresa dos 3 primeiros registro da tabela Fornecedor.

select top 3 NomeDaEmpresa from Fornecedores
order by CodigoDoFornecedor

-- 14. Exibir os 20 primeiros registro da tabela Produtos.

select top 20 * from Produtos
order by CodigoDoProduto

-- 15. Exibir os 2 primeiros registro da tabela Categoria.

select top 2 * from Categorias
order by CodigoDaCategoria

-- 16. Exibir o Nome, Cargo, Tratamento dos funcionários da empresa, dando os títulos: Funcionário, Função e Título respectivamente.

select Nome as Funcionário, Cargo as Função, Tratamento as Título from Funcionarios

-- 17. Exibir o NomeDaEmpresa, NomeDoContato e CargoDoContato da tabela Fornecedores, criando um título para cada coluna.

select NomeDaEmpresa as Empresa, NomeDoContato as Cliente, CargoDoContato as Cargo from Fornecedores

-- 18. Exibir o Nome, TelefoneResidencial com o título “Fone” e Observações com o título “Obs” da tabela Funcionários.

select Nome, TelefoneResidencial as Fone, Observacoes as Obs from Funcionarios

-- 19. Exibir NomeDaCategoria com o título “Categoria”, Descrição com o título “Observação” e uma coluna adicional com o conteúdo “Aprovado” cujo título seja “Situação”, da tabela Categoria.

select NomeDaCategoria as Categoria, Descricao as Observação, 'Aprovado' as 'Situação' from Categorias

-- 20. Exibir o CódigoDoProduto, NomeDoProduto, PreçoUnitário e uma coluna adicional com um acrescimo de 7% sobre o PreçoUnitário da tabela Produtos.

select CodigoDoProduto, NomeDoProduto, PrecoUnitario, PrecoUnitario * 0.07 as 'Acréscimo de 7%' from Produtos

-- 21. Exibir o Nome e Sobrenome dos funcionários por ordem decrescente de nome.

select Nome, Sobrenome from Funcionarios
order by Nome desc

-- 22. Exibir o CódigoDoProduto, NomeDoProduto e PreçoUnitário por ordem crescente de NomeDoProduto.

select CodigoDoProduto, NomeDoProduto, PrecoUnitario from Produtos
order by NomeDoProduto

-- 23. Exibir o CódigoDoProduto com título “Cód.”, NomeDoProduto com título “Produto” e PreçoUnitário com título “P. Unitário”, por ordem decrescente de CódigoDoProduto.

select CodigoDoProduto as 'Cód.', NomeDoProduto as Produto, PrecoUnitario as 'P. Unitário' from Produtos
order by CodigoDoProduto desc

-- 24. Exibir País, Região, CódigoDoFornecedor, NomeDaEmpresa e NomeDoContato da tabela Fornecedores por ordem crescente de País, decrescente de Região e crescente de NomeDaEmpresa.

select Pais, Regiao, CodigoDoFornecedor, NomeDaEmpresa, NomeDoContato from Fornecedores
order by Pais, Regiao desc, NomeDaEmpresa

-- 25. Exibir o CódigoDoFuncionário,SobreNome e Nome dos funcionários por ordem crescente de País.

select CodigoDoFuncionario, Sobrenome, Nome from Funcionarios
>>>>>>> 7f23ac76c19cfa72b32e3aaa84542f0794ed5b41
order by Pais