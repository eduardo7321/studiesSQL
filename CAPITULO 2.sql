--CAPITULO 2

SELECT COD_ALUNO, NOME, CIDADE
FROM TALUNO

SELECT * FROM  TALUNO;

SELECT COD_ALUNO AS "Codigo", Nome AS "Nome do Aluno"
FROM TALUNO;

--Distinct retira linhas duplicadas
-- todas colunas tem que ser iguais
SELECT CIDADE FROM TALUNO
ORDER BY CIDADE;

SELECT DISTINCT CIDADE FROM TALUNO;

--Nao agrupa pois cod_aluno difere
--para cada linha
SELECT DISTINCT CIDADE, COD_ALUNO
FROM TALUNO
ORDER BY CIDADE;



---
SELECT NOME AS CURSO,
       VALOR/CARGA_HORARIA,
       Round(VALOR/CARGA_HORARIA,2) AS VALOR_HORA
FROM TCURSO
ORDER BY VALOR_HORA



SELECT * FROM TCONTRATO;

UPDATE TCONTRATO SET
DESCONTO = NULL
WHERE COD_CONTRATO = 4;

--calculo com coluna = NULL
--resultado = NULL
SELECT COD_CONTRATO,
       TOTAL,
       DESCONTO,
       TOTAL+DESCONTO,
       TOTAL-DESCONTO AS VALOR_LIQUIDO
FROM TCONTRATO;

--
SELECT COD_ALUNO,
       DESCONTO,
       Nvl(DESCONTO,0),
       TOTAL,
       TOTAL + Nvl(DESCONTO,0) AS TOTAL_MAIS_DESCONTO
FROM TCONTRATO;

--
SELECT COD_ALUNO || ' - ' || NOME || ' [ ' || CIDADE || ' ] ' AS ALUNO
FROM TALUNO
ORDER BY COD_ALUNO;



  INTEER           - 1, 2 -- numero inteiro -> number(38)

  NUMBER(5,2) - 999,99
  NUMERIC(5,2) - 999,99

  DATE - '10/03/2011 00:00:00'

  VARCHAR2(10) - 'MARCIO'
  CHAR(10)     - 'MARCIO    '