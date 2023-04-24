Select E099usu.Codemp,
       R999usu.Codusu,
       R999usu.Nomusu,
       'Update E099USU Set Venlpd='||''''||'N'||''''||' where CODEMP='||E099usu.Codemp||' and CODUSU='||R999usu.Codusu||';' Desativa,
       'Update E099USU Set Venlpd='||''''||'S'||''''||' where CODEMP='||E099usu.Codemp||' and CODUSU='||R999usu.Codusu||';' Ativa
  From Sapiens.E099usu, Sapiens.R999usu, sapiens.r910usu
 Where r910usu.CODENT = R999usu.CODUSU
   and r910usu.CONHAB = 1
   And E099usu.Situsu = 'A'
   And E099usu.Venlpd = 'S'
   And E099usu.Codusu not in (708, 909, 505, 562, 266, 158,838,296)
   And E099usu.Codusu = R999usu.Codusu
 Order By 2,1