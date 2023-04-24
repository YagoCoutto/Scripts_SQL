-- PARA EXPORTAR COMO EXECEL

SELECT NOMCLI,
       FONCLI,
       INTNET,
       SIGUFS,
       CIDCLI,
       CASE SITCLI
         WHEN 'A' THEN
          'ATIVO'
         WHEN 'I' THEN
          'INATIVO'
       END SITUACAO

FROM E085CLI