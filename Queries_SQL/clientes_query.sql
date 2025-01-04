SELECT 
  c.CustomerKey AS IDCliente, -- Identificador único do cliente
  c.FirstName AS [Primeiro Nome], -- Primeiro nome do cliente
  c.LastName AS [Último Nome], -- Último nome do cliente
  CONCAT(c.FirstName, ' ', c.LastName) AS [Nome Completo], -- Combinação do primeiro e último nome
  CASE c.Gender 
    WHEN 'M' THEN 'Masculino'
    WHEN 'F' THEN 'Feminino'
    ELSE 'Desconhecido'
  END AS Gênero, -- Tratamento do campo gênero
  CONVERT(VARCHAR(10), c.DateFirstPurchase, 103) AS DataPrimeiraCompra, -- Data da primeira compra no formato DD/MM/AAAA
  COALESCE(g.City, 'Desconhecida') AS [Cidade do Cliente] -- Cidade do cliente, com tratamento para valores nulos
FROM 
  [AdventureWorksDW2022].[dbo].[DimCustomer] AS c
  INNER JOIN [AdventureWorksDW2022].[dbo].[DimGeography] AS g 
    ON g.GeographyKey = c.GeographyKey -- Junção com a tabela DimGeography para obter a cidade
WHERE 
  c.DateFirstPurchase IS NOT NULL -- Filtra apenas registros com data de primeira compra
ORDER BY 
  c.CustomerKey ASC; -- Ordenação pelo ID do cliente (ascendente)
