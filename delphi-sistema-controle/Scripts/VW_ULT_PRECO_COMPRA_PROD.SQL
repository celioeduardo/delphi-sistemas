CREATE VIEW VW_ULT_PRECO_COMPRA_PROD(
    COD_PRODUTO,
    VAL_PRECO)
AS
Select
A.COD_PRODUTO,
Case
  when
  (Select X.VAL_PRECO
    From CAD_PRECO_COMPRA X
    Where X.COD_PRODUTO = A.COD_PRODUTO And
          X.DAT_PRECO = (Select Max(Y.DAT_PRECO)
                           From CAD_PRECO_COMPRA Y
                           Where Y.COD_PRODUTO = A.COD_PRODUTO)) Is Null Then 0
  else
    (Select X.VAL_PRECO
        From CAD_PRECO_COMPRA X
        Where X.COD_PRODUTO = A.COD_PRODUTO And
              X.DAT_PRECO = (Select Max(Y.DAT_PRECO)
                               From CAD_PRECO_COMPRA Y
                               Where Y.COD_PRODUTO = A.COD_PRODUTO))
End as VAL_PRECO
From
CAD_PRODUTO A
;