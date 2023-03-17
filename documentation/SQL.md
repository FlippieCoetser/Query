
```sql
LOWER([Id]) as Id, [Username], [HashedPassword], LOWER([Salt]) as Salt 
```

```r
fields <- list(
  'Id'             |> INCLOSE() |> LOWER('Id'),
  'Username'       |> INCLOSE(),
  'HashedPassword' |> INCLOSE(), 
  'Salt'           |> INCLOSE() |> LOWER('Id')
)
```