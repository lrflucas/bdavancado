-- 1. Quantas unidades estão cadastradas na tabela bebidas?

select * from bebida

-- 2. Quantas categorias estão cadastradas na tabela bebidas?

select distinct categoria
from bebida                 

-- 3. Quantas bebidas apresentam em seu nome a palavra 'COPO'?

select bebida
from bebida                 
where bebida like '%copo%'

-- 4. Preciso de um arquivo em formato csv com os dados bebida e custobebida.

select bebida, custobebida
from bebida

-- 5. Preciso de um arquivo em formato xlsx com as seguintes colunas:
   -- a. Bebida
   -- b. Custobebida
   -- c. Custobebida + 10%
   -- d. Precocardapio
   -- e. Precocardapio – 15%

select bebida,
       custobebida,
       custobebida * 0.10 as 'Custobebida + 10%',
	   precocardapio,
	   precocardapio - (precocardapio * 0.15) as 'Precocardapio - 15%'
from bebida

-- 6. Preciso da lista das bebidas que estejam entre os idbedidas de 100 até 150?

select * from bebida
where idbebida between 100 and 150

-- 7. Quais são das bebidas que começam com a letra “V”?

select * from bebida where bebida like 'V%'

-- 8. Quais as 10 bebidas mais caras?

select top 10 * from bebida
order by precocardapio desc

-- 9. Quais as 20 bebidas mais baratas?

select top 20 * from bebida
order by precocardapio

-- 10.Quais as 30 bebidas com maior custo?

select top 30 * from bebida
order by custobebida desc

-- 11.Quais as bebidas com o código começando com “RV4”?

select * from bebida
where codigo like 'RV4%'

-- 12.Relacionar as bebidas com os seguintes cabeçalho:
   -- a. Bebida -> Produto
   -- b. Precocardapio -> Preço Venda
   -- c. Custobebida -> Custo Bebida

select bebida as produto,
       precocardapio as 'preço venda',
	   custobebida as 'custo bebida'
from bebida

-- 13.Quais as bebidas que apresentam em seu nome a palavra “ZERO”

select * from bebida
where bebida like '%zero%'