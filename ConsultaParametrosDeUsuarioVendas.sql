-- VERIFICA PARAMETROS EM TODAS EMPREASAS


select  *
from
    SAPIENS.e099usu
where
    codemp in (1, 6, 10, 25, 26)
    and codusu = 968
    or
    codemp in (1, 6, 10, 25, 26)
    and codusu = 969
   
    