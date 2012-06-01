DROP VIEW VW_CAD_CONTA;

CREATE VIEW VW_CAD_CONTA(
COD_CONTA,
NOM_CONTA,
FLG_TP_CONTA,
FLG_NATUREZA,
VAL_SALDO_ATUAL)
AS
Select
A.COD_CONTA,
A.NOM_CONTA||' ('||A.FLG_TP_CONTA||')',
A.FLG_TP_CONTA,
A.FLG_NATUREZA,
A.VAL_SALDO_INI +
Case When (Select Sum(
   Case A.FLG_NATUREZA 
		 When 'D' Then VAL_LANCAMENTO
		 Else VAL_LANCAMENTO * -1
		 End)	 
  From MOV_LANCAMENTO X
	Where X.COD_CONTA_DEB = A.COD_CONTA) Is Null Then 0
Else	
(Select Sum(
   Case A.FLG_NATUREZA 
		 When 'D' Then VAL_LANCAMENTO
		 Else VAL_LANCAMENTO * -1
		 End)	 
  From MOV_LANCAMENTO X
	Where X.COD_CONTA_DEB = A.COD_CONTA)
End +
Case When (Select Sum(
   Case A.FLG_NATUREZA 
		 When 'C' Then VAL_LANCAMENTO
		 Else VAL_LANCAMENTO * -1
		 End)	 
  From MOV_LANCAMENTO X
	Where X.COD_CONTA_CRE = A.COD_CONTA) Is Null Then 0
Else	
(Select Sum(
   Case A.FLG_NATUREZA 
		 When 'C' Then VAL_LANCAMENTO
		 Else VAL_LANCAMENTO * -1
		 End)	 
  From MOV_LANCAMENTO X
	Where X.COD_CONTA_CRE = A.COD_CONTA)
End SALDO_ATUAL
From	
CAD_CONTA A;