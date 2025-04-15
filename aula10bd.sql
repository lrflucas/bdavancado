-- Executando um select normal
SELECT CodigoDoCliente, COUNT(*) AS Total
FROM Pedidos
GROUP BY CodigoDoCliente;
GO

-- Criando uma Stored Procedure e colocando um select dentro
CREATE PROCEDURE ExibirTotalPorCliente
AS
BEGIN
	SELECT CodigoDoCliente, COUNT(*) AS Total
	FROM Pedidos
	GROUP BY CodigoDoCliente;
END;

-- Executando uma story procedure criada
EXEC ExibirTotalPorCliente;

-- Apagando uma Stored Procedure
DROP PROCEDURE ExibirTotalPorCliente

---------------------------------------------------------
-- Criando uma Stored Procedure com passagem de parâmetro
CREATE PROCEDURE ExibirTotalPorClienteCodigo
@IDCliente VARCHAR(40)
AS
BEGIN
	SELECT CodigoDoCliente, COUNT(*) AS Total
	FROM Pedidos
	GROUP BY CodigoDoCliente
    HAVING CodigoDoCliente = @IDCliente;
END;
GO

-- Executando uma Stored Procedure com passagem de parâmetro
EXEC ExibirTotalPorClienteCodigo @IDCliente='BERGS'
EXEC ExibirTotalPorClienteCodigo @IDCliente='BLAUS'



create procedure SP_ListaProdutosPorCategoria
@NomeDaCategoria varchar(20)
as
begin
	select p.CodigoDoProduto, p.NomeDoProduto, c.NomeDaCategoria
	from Produtos p
	join Categorias c
	on p.CodigoDaCategoria = c.CodigoDaCategoria
	where c.NomeDaCategoria = @NomeDaCategoria
end;

exec SP_ListaProdutosPorCategoria @NomeDaCategoria='Bebidas'

-- Apagando uma Stored Procedure
DROP PROCEDURE ExibirTotalPorClienteCodigo;

----------------------------------------------------------------
-- Criando uma Stored Procedure com uma estrutura condicional
CREATE PROCEDURE ExemploCondicaoParametro
@IDTransportadora INT
AS
BEGIN
    DECLARE @TotalRegistros INT;
	select @TotalRegistros = count(*) from Pedidos
	where CodigoDaTransportadora=@IDTransportadora
    IF @TotalRegistros > 200
    BEGIN
        PRINT 'Existem mais de 200 registros na tabela.';
    END
    ELSE
    BEGIN
        PRINT 'Existem 200 ou menos registros na tabela.';
    END
END;

-- Executando uma Stored Procedure com passagem de parâmetro
EXEC ExemploCondicaoParametro @IDTransportadora=3

select count(*) from 

-----------------------------------------------------------------
-- Criando uma Stored Procedure com uma estrutura de repetição
CREATE PROCEDURE ExemploRepeticao
AS
BEGIN
    DECLARE @Contador INT = 1;
    WHILE @Contador <= 5
    BEGIN
        PRINT 'Contador: ' + CAST(@Contador AS VARCHAR(10));
        SET @Contador = @Contador + 1;
    END
END;
GO

-- Executando uma Stored Procedure
ALTER PROCEDURE ExemploRepeticao
@total INT
AS
BEGIN
    DECLARE @Contador INT = 1;

    WHILE @Contador <= @total
    BEGIN
        PRINT 'Contador: ' + CAST(@Contador AS VARCHAR(10));
        SET @Contador = @Contador + 1;
    END
END;

-- Executando uma Stored Procedure
EXEC ExemploRepeticao @total=7


--------------------------------------------------------------
-- Atualizando o atributo PrecoUnitario dos Produtos
UPDATE Produtos
Set PrecoUnitario = PrecoUnitario + (PrecoUnitario * 0.01)

-- Criando uma SP para dar uma aumento no preço dos produtos
CREATE PROCEDURE AtualizandoPrecoProduto
@NovoValor float
AS
BEGIN
	UPDATE Produtos
	Set PrecoUnitario = PrecoUnitario + (PrecoUnitario * @NovoValor)
END;

-- Executando a SP
EXEC AtualizandoPrecoProduto @NovoValor=0.07

-- Verificando se o valor foi alterado
select PrecoUnitario from Produtos

-- Apagando uma Stored Procedure
DROP PROCEDURE AtualizandoPrecoProduto;

-- Verificando todas as SP do Sistema
select * from sys.objects where type='P'

