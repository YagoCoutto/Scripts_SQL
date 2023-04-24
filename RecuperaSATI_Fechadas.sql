Select s.sataresol, SATNUM SATI,
       NVL(NVL((SELECT NOMUSU
                 FROM SAPIENS.R999USU X
                WHERE X.CODUSU = S.SATUSUSOL),
               S.SATOSUSER),
           substr(S.SATEMLSOL, 1, 11)) SOLICITANTE,
       SATI.SATI_TITULO(SATDESSOL) TITULO,
       SATDESSOL,
       U.USRLGN COLABORADOR,
       to_char(s.satdatsol, 'MM/YYYY') DATA,
       DECODE(S.SATSTASAI,0,'Aberto',30,'Aprovação',60,'Concluída',S.SATSTASAI) situacao
       
    from SATI.SAT S, SATI.USRSIS U
     where U.USUSEQ = S.SATCOLABO
       and S.SATUSUSOL in (642, 800, 157)
       and sataresol = 'S'
       and s.satdatsol>=to_date('01/06/2019','DD/MM/YYYY')
     Order by SATDATSOL, SATNUM;
     
     