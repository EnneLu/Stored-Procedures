
--inserir cliente--


CREATE PROCEDURE Cliente_insert 
	@nome	VARCHAR(100),
	@data_nascimento varchar(100),
	@cpf VARCHAR(11)
as
begin
	declare @verificarCpf bit
	set @verificarCpf  = (select dbo.validarCpf(@cpf))


	--Verificação de nome
		if(@nome is null) or ((REPLACE(@nome,'','') = ''))
		begin
			raiserror('O nome não pode ser vazio',16,1)
			return
		end
	--Fim da verificação de nome


	--Verificação de data
		if(@data_nascimento is null) or ((REPLACE(@data_nascimento,'','') = ''))
		begin
			raiserror('O nome não pode ser vazio',16,1)
			return
		end

		if(ISDATE(@data_nascimento) = 0)
		begin
			raiserror('Data invalida',16,1)
			return
		end

		if(@data_nascimento > CONVERT(varchar(10), GETDATE(),103))
		begin
			raiserror('Data invalida',16,1)
			return
		end
	--Fim da verificação de data



	--Verificação de cpf
		if(@verificarCpf = 0) or ((REPLACE(@cpf,'','') = ''))
		begin
			raiserror('Cpf incorreto',16,1)
			return
		end

	--fim da verificação de cpf


	insert into Cliente(nome,data_nascimento,cpf) values (@nome,@data_nascimento,@cpf)
end

/*teste de stored_procedure


Funciona

	exec  Cliente_insert 'Diogo Santos do Nascimento','28/02/2002','10547286406'
	exec  Cliente_insert 'Raul Severino Anderson Gomes','19/07/1941','93907929594'
	exec  Cliente_insert 'Luzia Sebastiana Mariana Teixeira','10/12/1965','00699370108'




Não Funciona exec  Cliente_insert 'Diogo','28/02/2002','10547286407'

*/

--fim de inserir cliente--