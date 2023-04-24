select sapiens.e085cli.codcli AS COD,
       sapiens.e085cli.nomcli AS CLIENTE,
       sapiens.e085cli.sigufs AS EST,
       sapiens.e085cli.cidcli AS CIDADE,
       sapiens.e085cli.cgccpf AS CNPJ,
       sapiens.e085cli.apecli AS NOME_FANTASIA,
       sapiens.e085cli.codgre AS GRUPO,
       sapiens.e085hcl.codrep AS REPRESENTANTE
  from sapiens.e085cli, sapiens.e085hcl
 where sapiens.e085cli.codcli = sapiens.e085hcl.codcli
   and sapiens.e085hcl.codemp = 25
   and sapiens.e085hcl.codfil = 1
   and EXISTS (select codcli
          from sapiens.e140nfv
         where sapiens.e085cli.codgre in (37, 214) 
           and e085cli.codcli = e140nfv.codcli
           and e085hcl.codemp = e140nfv.codemp
           and tipnfs > 0)
    ORDER BY sapiens.e085cli.codgre