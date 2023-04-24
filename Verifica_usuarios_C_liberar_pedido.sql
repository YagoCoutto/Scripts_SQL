Select 
    Sapiens.E099usu.Codemp As Empresa,
    Sapiens.R999usu.Codusu As Cod,
    Sapiens.R999usu.Nomusu As Usuario,
    Sapiens.E099usu.Venlpd As Liberar_Pedido,
    Sapiens.E099usu.Situsu As Situação_Usuario
From 
    Sapiens.E099usu,
    Sapiens.R999usu
Where 
--    Sapiens.E099usu.Codusu = 708
        Sapiens.E099usu.Situsu = UPPER('a')
    And Sapiens.E099usu.Venlpd = UPPER('s')
    And Sapiens.E099usu.Codusu not in (708, 909,505,562, 266, 146)
    
    And Sapiens.E099usu.Codusu = Sapiens.R999usu.Codusu
Order By sapiens.e099usu.nomusu