/* 
All colums which is of type uniqueidentifier will return capitalized results.
R is case sensitive, therefore the sql buildin LOWER(<column>) is used to ensure data integrity. 
*/

SELECT 
  LOWER([Id]) as Id, 
  [Username], 
  [HashedPassword], 
  LOWER([Salt]) as Salt 
FROM [dbo].[User]
WHERE [Id] = 'b2970410-bd60-478d-baf6-46cbc14e10fc'