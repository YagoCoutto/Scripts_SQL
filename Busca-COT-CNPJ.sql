-- BUSCA NUMERO DE CONTRATO ATRAVÉS DO CPNJ DO FORNECEDOR
select 
    sapiens.e460ctr.codemp, 
    sapiens.e460ctr.codfil,
    sapiens.e460ctr.numctr AS CONTRATO,
    sapiens.e460ctr.objctr,
    sapiens.e460ctr.codfor,
    sapiens.e460ctr.numnfc,
    
    sapiens.e095for.nomfor,
    sapiens.e095for.apefor,
    sapiens.e095for.cgccpf AS CNPJ
from 
    SAPIENS.e460ctr,
    SAPIENS.e095for
    
where
    e460ctr.codemp IN (25, 26)
    and e460ctr.codfil = 1
 -- and e460ctr.numctr = 267
    and e095for.cgccpf = 05146982000148 --CNJP/CPF AQUI
    and e095for.codfor = e460ctr.codfor;
    
    
-- CONSULTA SERVIÇO. 
select   sapiens.e460ccs.codemp,
    sapiens.e460ccs.codfil,
    sapiens.e460ccs.numctr,
    sapiens.e460ccs.seqccs, 
    sapiens.e460ccs.codser, 
    sapiens.e460ccs.cplccs, 
    sapiens.e460ccs.qtdccs,
    sapiens.e460ccs.datcpt AS DATA,
    CASE
        WHEN e460ccs.numnfc > 0 THEN
        to_char(e460ccs.numnfc)
        ELSE 'NOTA FISCAL NÃO REGISTRADA'
    END NOTA,
    sapiens.e460ccs.preuni AS VALOR,
    sapiens.e460ccs.fornfc,
    sapiens.e460ccs.filnfc,
    sapiens.e460ccs.seqisc,
    
    sapiens.e501tcp.sittit AS SIT_TITULO
        
from
    SAPIENS.e460ccs
    LEFT JOIN SAPIENS.e501tcp ON 
        E460CCS.CODEMP = E501TCP.CODEMP AND
         E460CCS.CODFIL = E501TCP.CODFIL AND
          E460CCS.NUMNFC = E501TCP.NUMNFC AND
            E460CCS.NUMOCP = E501TCP.NUMOCP AND
            E460CCS.FILNFC = E501TCP.FILNFC AND
            E460CCS.SNFNFC = E501TCP.SNFNFC
WHERE
     e460ccs.numctr = 15 -- N CONTRATO AQUI
    and sapiens.e460ccs.datcpt > to_date('01/07/2022','DD/MM/YYYY')   
and rownum <= 10
ORDER BY sapiens.e460ccs.datcpt ;

-- CONSULTA PRODUTOS.

select *
from
  SAPIENS.e460ccp 
where
    codemp IN (25,26) and codfil = 1
    and numctr = 15 -- N CONTRATO AQUI
    and datcpt > '01-07-2022'    
and rownum <= 10
ORDER BY datcpt 
    