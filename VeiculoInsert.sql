
CREATE PROCEDURE Veiculo_insert 
	@fabricante	VARCHAR(60),
	@modelo	VARCHAR(60),
	@ano_fabricante INT,
	@placa CHAR(8),
	@uf CHAR(2)
as
begin


	--Verificação de fabricante
		if(@fabricante is null) or ((REPLACE(@fabricante,'','') = ''))
		begin
			raiserror('O nome do fabricante não pode ser vazio',16,1)
			return
		end
	--Fim da verificação de fabricante


	--Verificação de modelo
		if(@modelo is null) or ((REPLACE(@modelo,'','') = ''))
		begin
			raiserror('O nome do modelo não pode ser vazio',16,1)
			return
		end
	--Fim da verificação de modelo

	--Verificação de ano de fabricação
		if(@ano_fabricante = '') or ((REPLACE(@ano_fabricante,'','') = ''))
		begin
			raiserror('O ano de fabricação não pode ser vazio',16,1)
			return
		end
	--Fim da verificação de ano de fabricação

	--Verificação de id
		if(@placa is null) or ((REPLACE(@placa,'','') = ''))
		begin
			raiserror('A placa não pode ser vazia',16,1)
			return
		end
	--Fim da verificação de id

	insert into Veiculo(fabricante,modelo,ano_fabricante,placa,uf) values (@fabricante,@modelo,@ano_fabricante,@placa,@uf)
end

