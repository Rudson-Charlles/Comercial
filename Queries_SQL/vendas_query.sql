-- Tabela Cleansed FACT_InternetSales --
SELECT 
  fis.ProductKey AS IDProduto, -- Chave única do produto
  CONVERT(VARCHAR(10), CONVERT(DATE, CONVERT(VARCHAR(8), fis.OrderDateKey)), 103) AS DataPedido, -- Data do pedido no formato DD/MM/AAAA
  CONVERT(VARCHAR(10), CONVERT(DATE, CONVERT(VARCHAR(8), fis.DueDateKey)), 103) AS DataEntrega, -- Data de entrega no formato DD/MM/AAAA
  CONVERT(VARCHAR(10), CONVERT(DATE, CONVERT(VARCHAR(8), fis.ShipDateKey)), 103) AS DataEnvio, -- Data de envio no formato DD/MM/AAAA
  fis.CustomerKey AS IDCliente, -- Chave única do cliente
  fis.SalesOrderNumber AS NumeroPedido, -- Número do pedido
  COALESCE(fis.SalesAmount, 0) AS ValorVenda -- Valor total da venda, tratando valores nulos
FROM 
  [AdventureWorksDW2022].[dbo].[FactInternetSales] AS fis
WHERE 
  fis.OrderDateKey IS NOT NULL -- Garante que os valores de OrderDateKey não sejam nulos
ORDER BY 
  fis.OrderDateKey ASC; -- Ordenação pela data do pedido (chave)
