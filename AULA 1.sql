SELECT * FROM TALUNO;

DELETE FROM TALUNO
WHERE COD_ALUNO = 5;

ROLLBACK;

DELETE FROM TALUNO WHERE NOME = 'VALDO';

SELECT * FROM TALUNO WHERE NOME = 'VALDO';



CREATE TABLE TITEM
( COD_ITEM INTEGER NOT NULL PRIMARY KEY,
  COD_CURSO INTEGER,
  COD_CONTRATO INTEGER,
  VALOR NUMBER(8,2)
);

SELECT * FROM TITEM;

INSERT INTO TITEM VALUES (1, 1, 1, 500);
INSERT INTO TITEM VALUES (2, 1, 2, 500);
INSERT INTO TITEM VALUES (3, 3, 3, 1500);
INSERT INTO TITEM VALUES (4, 4, 4, 1600);
INSERT INTO TITEM VALUES (5, 1, 5, 500);
INSERT INTO TITEM VALUES (6, 1, 6, 500);
INSERT INTO TITEM VALUES (7, 2, 6, 500);
INSERT INTO TITEM VALUES (8, 3, 7, 500);

COMMIT;

SELECT * FROM TITEM;

SELECT * FROM TCONTRATO
WHERE COD_CONTRATO = 2;

--ALTERAR TCONTRATO DA TABELA
UPDATE TCONTRATO SET
  DESCONTO = 18
  WHERE COD_CONTRATO = 2;


UPDATE TCONTRATO SET
  DESCONTO = 20      ,
  DATA = '25/01/2013',
  TOTAL = 2500
  WHERE COD_CONTRATO = 2;



  SELECT * FROM TALUNO;

  UPDATE TALUNO SET
  CIDADE = 'CANOAS'
  WHERE Upper(CIDADE) = 'IVOTI';

  UPDATE TALUNO SET
  NOME = 'FRIDA'
  WHERE COD_ALUNO = 5;

  SELECT * FROM TCURSO;

  UPDATE TCURSO SET
  VALOR = 499.99
  WHERE COD_CURSO = 1;

  COMMIT;

