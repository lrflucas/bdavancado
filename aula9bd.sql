-- Selecionando campos da tabela Clientes
SELECT * FROM Clientes

-- Criando uma View
CREATE VIEW ClientesAlemanha AS
SELECT CodigoDoCliente, NomeDaEmpresa, NomeDoContato, Endereco
FROM Clientes
WHERE Pais = 'Alemanha';

--Executando uma View
SELECT * FROM ClientesAlemanha

--Alterando uma View
ALTER VIEW ClientesAlemanha AS
SELECT CodigoDoCliente, NomeDaEmpresa, NomeDoContato, Endereco, Telefone
FROM Clientes
WHERE Pais = 'Alemanha';

--Executando uma View
SELECT * FROM ClientesAlemanha

-- Apagando uma visão
DROP VIEW ClientesAlemanha

--Executando uma View
select * from ClientesAlemanha

