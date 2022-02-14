USE [fbd_db]
GO
/****** Object:  UserDefinedFunction [dbo].[f1]    Script Date: 11/02/2022 14:42:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER function [dbo].[f1] (@matr_aluno_input int)
  returns @tab_result table (matr_aluno int, cod_disciplina int)
  as
  begin

  if @matr_aluno_input IS NULL
    begin  

    insert into @tab_result

    select  matr_aluno_fk, Cod_disc_fk
    from Aluno_disc where  ((((PrimeiraAP+SegundaAP)/2) BETWEEN 4 AND 7)  and ((PrimeiraAP+SegundaAP)/2 < 7) and 
    (((((PrimeiraAP + SegundaAP)/2) + AF)/2) < 5))

    end
  else 
    begin

    insert into @tab_result

    select  matr_aluno_fk, Cod_disc_fk
    from Aluno_disc where (((PrimeiraAP+SegundaAP)/2 > 7) or (((PrimeiraAP + SegundaAP)/2) + AF)/2 > 5) and matr_aluno_fk = @matr_aluno_input

    end

return 
end