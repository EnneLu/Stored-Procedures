--editar cliente--


CREATE PROCEDURE Cliente_update
	@id	int,
	@nome	VARCHAR(100),
	@data_nascimento varchar(30),
	@cpf VARCHAR(11)
as
begin
	declare @verificarCpf bit
	set @verificarCpf  = (select dbo.validarCpf(@cpf))


	if((@id = '') or (@id is null))
		begin
			raiserror('O campo id não pode ser vazio',16,1)
			return
		end

	--Verificação de nome
		if(@nome is null) or ((REPLACE(@nome,'','') = ''))
		begin
			raiserror('O campo nome não pode ser vazio',16,1)
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
			raiserror('Data incorreta',16,1)
			return
		end

		if(@data_nascimento > GETDATE())
		begin
			raiserror('Data invalida',16,1)
			return
		end
	--Fim da verificação de data


	--Verificação de cpf
		if(@cpf is null) or ((REPLACE(@cpf,'','') = ''))
		begin
			raiserror('O campo cpf não pode ser vazio',16,1)
			return
		end

		if(@verificarCpf = 0) or ((REPLACE(@cpf,'','') = ''))
		begin
			raiserror('Cpf incorreto',16,1)
			return
		end
	--fim da verificação de cpf

	update Cliente set nome = @nome,data_nascimento = @data_nascimento,cpf = @cpf where id = @id


end

/*teste de stored_procedure


Funciona

	exec  Cliente_update '1','Diogo santos','28/02/2001','10547286406'



*/

--fim de atualizar cliente--
