
CREATE PROCEDURE Veiculo_insert 
	@fabricante	VARCHAR(60),
	@modelo	VARCHAR(60),
	@ano_fabricacao INT,
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
		if(@ano_fabricacao = '') or ((REPLACE(@ano_fabricacao,'','') = ''))
		begin
			raiserror('O ano de fabricação não pode ser vazio',16,1)
			return
		end

		if(@ano_fabricacao > year(getdate()) or (@ano_fabricacao not like'[0-9][0-9][0-9][0-9]'))
		begin
			raiserror('O ano de fabricação invalido',16,1)
			return
		end
	--Fim da verificação de ano de fabricação

	--Verificação de placa
		if(@placa is null) or ((REPLACE(@placa,'','') = '')) 
		begin
			raiserror('A placa não pode ser vazia',16,1)
			return
		end
		if((@placa not like '[a-z][a-z][0-9][0-9][0-9][a-z][a-z]' ) and (@placa not like '[a-z][a-z][a-z][0-9][0-9][0-9][0-9]') ) 
		begin
			raiserror('Placa digitada está no formato invalido',16,1)
			return
		end
	--Fim da verificação de placa

	--Verificação de uf
		if(@uf is null) or ((REPLACE(@uf,'','') = ''))
		begin
			raiserror('A uf não pode ser vazia',16,1)
			return
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
			return
		end

	--Fim da verificação de uf

	insert into Veiculo(fabricante,modelo,ano_fabricacao,placa,uf) values (@fabricante,@modelo,@ano_fabricacao,@placa,@uf)
end


/*teste de stored_procedure


Funciona

	exec  Veiculo_insert 'Gurgel','BR-800','1988','MZV6877','RN'
	exec  Veiculo_insert 'Mitsubishi','Space Wagon GLXi 2.4 ( Nova S','1999','AJX2006','AC'
	exec  Veiculo_insert 'Porsche','911 Carrera Cabriolet 3.4/ 3.6 Mec','1995','JAI7695','MT'
	exec  Veiculo_insert 'Hyundai','ix35 2.0 Launching Edition 16V Flex Aut.','2016','HZY6421','PI'
	exec  Veiculo_insert 'Subaru','Impreza WRX 2.5 16V TB 4x4 5p','2007','MZK4402','MG'
	exec  Veiculo_insert 'Mitsubishi','Colt GTi Mec','1995','GLT8528','PB'
	exec  Veiculo_insert 'LIFAN','530 TALENT 1.5 16V 103cv 4p','2015','MNW4744','RN'
	exec  Veiculo_insert 'Ford','KA GL 1.0i Zetec Rocam','2000','MOB4370','PE'
	exec  Veiculo_insert 'Dodge','Dakota Sport 3.9 V6 CD Mec.','2001','MOD5244','RN'
	exec  Veiculo_insert 'Cadillac','Seville 4.6','1991','MNH1733','RN'

*/

--fim de inserir cliente--
