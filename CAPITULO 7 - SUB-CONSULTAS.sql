--Cpirulo 07 - sub-consultas

--
SELECT COD_CONTRATO, DATA ,TOTAL
FROM TCONTRATO
WHERE TOTAL >=
  ( SELECT VALOR FROM TCURSO
    WHERE COD_CURSO = 3);

-- Errado, só pode retornar uma lina na subconsulta
SELECT COD_CONTRATO, DATA, TOTAL
FROM TCONTRATO
WHERE TOTAL >=
  ( SELECT VALOR FROM TCURSO
    WHERE VALOR > 500);

--Todos os alunos da mesma cidade do aluno 1
--menos o aluno 1
SELECT COD_ALUNO, NOME, CIDADE
FROM TALUNO
WHERE CIDADE = ( SELECT CIDADE FROM TALUNO
                  WHERE COD_ALUNO = 2 )
AND COD_ALUNO != 2;

--Todos os alunos da mesma cidade e estado do aluno 2
--menos o aluno 2
SELECT COD_ALUNO, NOME, CIDADE, ESTADO
FROM TALUNO
WHERE (CIDADE, ESTADO) =
          ( SELECT CIDADE, ESTADO FROM TALUNO
            WHERE COD_ALUNO = 10 )
AND COD_ALUNO != 10 ;

SELECT * FROM TALUNO;

UPDATE TALUNO SET
CIDADE = 'CAMARAGIBE'
WHERE COD_ALUNO = 24;

--Soma todos os itens, e mostra somente cujo o
--valor minimo seja maior que o valor medio
--dos cursos
SELECT COD_CURSO, Min (VALOR), Sum (VALOR),
        Count (*) QTDE
FROM TITEM
WHERE COD_CURSO > 0
GROUP BY COD_CURSO
HAVING Min (VALOR) >
       (SELECT Avg (VALOR) FROM TCURSO)
ORDER BY COD_CURSO;

--soma o total de contrato por aluno e mostra
--somente cujo o menor contrato seja maior que
--o valor medio de curso
SELECT COD_ALUNO, Min (TOTAL), Sum (TOTAL)
FROM TCONTRATO
GROUP BY COD_ALUNO
HAVING MIN (TOTAL) >
  (SELECT Avg (VALOR) FROM TCURSO);

--Todos os cursos que estao na tabela de
--Item (vendidos)
SELECT COD_CURSO, NOME, VALOR
FROM TCURSO
WHERE COD_CURSO IN (SELECT COD_CURSO FROM TITEM)
ORDER BY COD_CURSO ASC;

--Todos os cursos que nao estao na tabela de item
--nao vendidos
SELECT COD_CURSO, NOME, VALOR
FROM TCURSO
WHERE COD_CURSO NOT IN
      (SELECT COD_CURSO FROM TITEM)
ORDER BY NOME;

--
SELECT COD_CURSO, NOME, VALOR
FROM TCURSO WHERE COD_CURSO IN (1, 2, 3, 4)
ORDER BY COD_CURSO ASC;

--
SELECT COD_CURSO, NOME, VALOR
FROM TCURSO
WHERE COD_CURSO = 1
OR COD_CURSO = 2
OR COD_CURSO = 3
OR COD_CURSO = 4
ORDER BY COD_CURSO ASC;


--todos os cursos que foram vendidos
--pelo valor padrao
SELECT * FROM TITEM
WHERE (COD_CURSO, VALOR) IN
      (SELECT COD_CURSO, VALOR FROM TCURSO);

SELECT * FROM TCURSO;
SELECT * FROM TITEM;

--subconsulta na clausula from
SELECT ITE.COD_CONTRATO, ITE.VALOR,
       ITE.COD_CURSO,
       CUR.COD_CURSO, CUR.VALOR
FROM TITEM ITE, (SELECT COD_CURSO, VALOR
                 FROM TCURSO
                 WHERE VALOR > 500 ) CUR
WHERE CUR.COD_CURSO = ITE.COD_CURSO;



