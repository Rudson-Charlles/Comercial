-- Query otimizada para DimProducts
SELECT 
  p.ProductKey AS IDProduto, -- Identificador único do produto
  p.ProductAlternateKey AS CodigoItemProduto, -- Código alternativo do produto
  p.EnglishProductName AS [Nome do Produto], -- Nome do produto em inglês
  ps.EnglishProductSubcategoryName AS [Subcategoria], -- Nome da subcategoria
  pc.EnglishProductCategoryName AS [Categoria do Produto], -- Nome da categoria
  p.Color AS [Cor do Produto], -- Cor do produto
  p.Size AS [Tamanho do Produto], -- Tamanho do produto
  p.ProductLine AS [Linha do Produto], -- Linha do produto
  p.ModelName AS [Nome do Modelo do Produto], -- Nome do modelo do produto
  p.EnglishDescription AS [Descrição do Produto], -- Descrição do produto em inglês
  COALESCE(p.Status, 'Obsoleto') AS [Status do Produto] -- Tratamento de valores nulos
FROM 
  [AdventureWorksDW2022].[dbo].[DimProduct] AS p
  INNER JOIN [AdventureWorksDW2022].[dbo].[DimProductSubcategory] AS ps 
    ON ps.ProductSubcategoryKey = p.ProductSubcategoryKey
  INNER JOIN [AdventureWorksDW2022].[dbo].[DimProductCategory] AS pc 
    ON ps.ProductCategoryKey = pc.ProductCategoryKey
WHERE 
  p.Status IS NOT NULL -- Filtro: apenas produtos com status definido
ORDER BY 
  p.ProductKey ASC; -- Ordenação pelo ID do produto
