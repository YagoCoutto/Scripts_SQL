select
    sapiens.e140ide.sitdea AS SIT_ANTERIOR,
    sapiens.e140ide.numnfv,
    CASE
        WHEN sapiens.e140ide.sitdoe = sapiens.r996lsf.keynam THEN
                sapiens.r996lsf.valkey
    END SIT_ATUAL,
    sapiens.e140ide.usucan,
    sapiens.r999usu.nomusu

from
    sapiens.e140ide
    INNER JOIN SAPIENS.r999usu ON
            sapiens.e140ide.usucan = sapiens.r999usu.codusu,
    sapiens.R996LSF 
   
where
    sapiens.e140ide.codemp = 25
    and sapiens.e140ide.codfil = 1
    and sapiens.e140ide.codsnf = '1' --Codigo da serie da nota fiscal de saida
    and sapiens.e140ide.numnfv = 50430 --numero da nota fiscal de saida;
    and r996lsf.lstnam = 'LSitNel'
    and  R996LSF.KEYNAM = sapiens.e140ide.sitdoe
    


