--editar Veiculo--


CREATE PROCEDURE Veiculo_update
	@id	int,
	@fabricante	VARCHAR(60),
	@modelo	VARCHAR(60),
	@ano_fabricacao INT,
	@placa CHAR(8),
	@uf CHAR(2)
as
begin

	declare @erro bit
	set @erro = 0

	--Verificação de id
		if(@id = '') or ((REPLACE(@id,'','') = ''))
		begin
			raiserror('O id não pode ser vazio',16,1)
			return
		end
	--Fim da verificação de id
	--Verificação de fabricante
		if(@fabricante is null) or ((REPLACE(@fabricante,'','') = ''))
		begin
			raiserror('O nome do fabricante não pode ser vazio',16,1)
			set @erro = 1
			--return
		end
	--Fim da verificação de fabricante


	--Verificação de modelo
		if(@modelo is null) or ((REPLACE(@modelo,'','') = ''))
		begin
			raiserror('O nome do modelo não pode ser vazio',16,1)
			set @erro = 1
			--return
		end
	--Fim da verificação de modelo

	--Verificação de ano de fabricação
		if(@ano_fabricacao = '') or ((REPLACE(@ano_fabricacao,'','') = ''))
		begin
			raiserror('O ano de fabricação não pode ser vazio',16,1)
			set @erro = 1
			--return
		end

		if(@ano_fabricacao > year(getdate()) or (@ano_fabricacao not like'[0-9][0-9][0-9][0-9]'))
		begin
			raiserror('O ano de fabricação invalido',16,1)
			set @erro = 1
			--return
		end
	--Fim da verificação de ano de fabricação

	--Verificação de placa
		if(@placa is null) or ((REPLACE(@placa,'','') = '')) 
		begin
			raiserror('A placa não pode ser vazia',16,1)
			set @erro = 1
			--return
		end
		if((@placa not like '[a-z][a-z][0-9][0-9][0-9][a-z][a-z]' ) and (@placa not like '[a-z][a-z][a-z][0-9][0-9][0-9][0-9]') ) 
		begin
			raiserror('Placa digitada está no formato invalido',16,1)
			set @erro = 1
			--return
		end
	--Fim da verificação de placa

	--Verificação de uf
		if(@uf is null) or ((REPLACE(@uf,'','') = ''))
		begin
			raiserror('A uf não pode ser vazia',16,1)
			set @erro = 1
			--return
		end

		if((UPPER(@uf) != 'AC') and
		(UPPER(@uf) != 'AL') and
		(UPPER(@uf) != 'AP') and
		(UPPER(@uf) != 'AM') and
		(UPPER(@uf) != 'BA') and
		(UPPER(@uf) != 'CE') and
		(UPPER(@uf) != 'DF') and
		(UPPER(@uf) != 'ES') and
		(UPPER(@uf) != 'GO') and
		(UPPER(@uf) != 'MA') and
		(UPPER(@uf) != 'MT') and
		(UPPER(@uf) != 'MS') and
		(UPPER(@uf) != 'MG') and
		(UPPER(@uf) != 'PA') and
		(UPPER(@uf) != 'PB') and
		(UPPER(@uf) != 'PR') and
		(UPPER(@uf) != 'PE') and
		(UPPER(@uf) != 'PI') and
		(UPPER(@uf) != 'RJ') and
		(UPPER(@uf) != 'RN') and
		(UPPER(@uf) != 'RS') and
		(UPPER(@uf) != 'RO') and
		(UPPER(@uf) != 'RR') and
		(UPPER(@uf) != 'SC') and
		(UPPER(@uf) != 'SP') and
		(UPPER(@uf) != 'SE') and
		(UPPER(@uf) != 'TO'))
		begin
			raiserror('UF invalida',16,1)
			set @erro = 1
			--return
		end

		if(@erro = 1)
		begin
			rollback transaction
			return
		end

	--Fim da verificação de uf

	insert into Veiculo(fabricante,modelo,ano_fabricacao,placa,uf) values (@fabricante,@modelo,@ano_fabricacao,@placa,@uf)

end
