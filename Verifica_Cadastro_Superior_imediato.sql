select
    codemp,
    codusu,
    nomusu,
    supime
from
    sapiens.e099usu
where
    codemp in (1, 10, 25,26) and 
    codusu in (296, 751, 464, 911, 617, 954, 794, 714, 906, 994)
    
ORDER BY codemp;

