--Capitulo 8 - DML

SELECT * FROM TDESCONTO;

INSERT INTO TDESCONTO (CLASSE, INFERIOR, SUPERIOR)
VALUES ('&CLA', &INF, &SUP);

SELECT * FROM TDESCONTO
WHERE CLASSE = '&CLA';

UPDATE TDESCONTO SET
INFERIOR = &INF,
SUPERIOR = &SUP
WHERE CLASSE = '&CLA';

DELETE FROM TDESCONTO
WHERE CLASSE = '&CLA';

---------------------------
CREATE TABLE TDESCONTO2
  AS SELECT * FROM TDESCONTO;

SELECT * FROM TDESCONTO2;

COMMIT;

--Transação (Commit/Rollback)

--
--Deleta todos os registros

DELETE FROM TDESCONTO2;

ROLLBACK;

-deleta todos os registros da tabela
--nao tem clausula where
TRUNCATE TABLE TDESCONTO2;

--save point
SAVEPOINT UPD_B;

UPDATE TDESCONTO SET
SUPERIOR = 88
WHERE CLASSE = 'B';

SAVEPOINT UPD_A;

UPDATE TDESCONTO SET
SUPERIOR = 99
WHERE CLASSE = 'A';

--ponto de restauração
SAVEPOINT  INS_OK;

SELECT * FROM TDESCONTO;

INSERT INTO TDESCONTO (CLASSE, INFERIOR, SUPERIOR)
VALUES  ('&CLA' , &INF, &SUP );

SELECT * FROM TDESCONTO;

ROLLBACK TO SAVEPOINT INS_OK;
ROLLBACK TO SAVEPOINT UPD_B;

ROLLBACK;

SELECT * FROM TDESCONTO2;

DROP TABLE TDESCONTO2;

COMMIT;








