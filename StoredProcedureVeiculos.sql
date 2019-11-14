/*
CREATE TABLE Cliente(
	id INT IDENTITY,
	nome VARCHAR(100),
	data_nascimento DATE,
	cpf CHAR(14),
	PRIMARY KEY(id)
)

CREATE TABLE Veiculo(
	id INT IDENTITY,
	fabricante VARCHAR(60),
	modelo VARCHAR(60),
	ano_fabricante INT,
	placa CHAR(8),
	uf CHAR(2)
	PRIMARY KEY(id)
)




danger zone


 drop table Cliente

 drop table Veiculo

 DROP procedure Veiculo_insert 

 DROP procedure Veiculo_select_all

 DROP procedure Veiculo_delete

 DROP procedure Veiculo_update

 drop function validarCPF

*/




--inserir cliente--


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

/*teste de stored_procedure


Funciona

	exec  Veiculo_insert 'Gurgel','BR-800','1988','MZV-6877','RN'
	exec  Veiculo_insert 'Mitsubishi','Space Wagon GLXi 2.4 ( Nova S','1999','AJX-2006','AC'
	exec  Veiculo_insert 'Porsche','911 Carrera Cabriolet 3.4/ 3.6 Mec','1995','JAI-7695','MT'
	exec  Veiculo_insert 'Hyundai','ix35 2.0 Launching Edition 16V Flex Aut.','2016','HZY-6421','PI'
	exec  Veiculo_insert 'Subaru','Impreza WRX 2.5 16V TB 4x4 5p','2007','MZK-4402','MG'
	exec  Veiculo_insert 'Mitsubishi','Colt GTi Mec','1995','GLT-8528','PB'
	exec  Veiculo_insert 'LIFAN','530 TALENT 1.5 16V 103cv 4p','2015','MNW-4744','RN'
	exec  Veiculo_insert 'Ford','KA GL 1.0i Zetec Rocam','2000','MOB-4370','PE'
	exec  Veiculo_insert 'Dodge','Dakota Sport 3.9 V6 CD Mec.','2001','MOD-5244','RN'
	exec  Veiculo_insert 'Cadillac','Seville 4.6','1991','MNH-1733','RN'





Não Funciona exec  Cliente_insert 'Diogo','28/02/2002','10547286407'



*/

--fim de inserir cliente--








--editar cliente--


CREATE PROCEDURE Cliente_update
	@id	int,
	@nome	VARCHAR(100),
	@data_nascimento DATE,
	@cpf VARCHAR(11)
as
begin
	declare @verificarCpf bit
	set @verificarCpf  = (select dbo.validarCpf(@cpf))


	if((@id = '') or (@id is null))
		begin
			select * from Cliente
			return
		end

	--Verificação de nome
	if(@nome is null) or ((REPLACE(@nome,'','') = ''))
	begin
		raiserror('O campo nome não pode ser vazio',16,1)
		return
	end
	--Fim da verificação de nome



	if(@data_nascimento is null) or ((REPLACE(@data_nascimento,'','') = ''))
	begin
		raiserror('O campo data não pode ser vazio',16,1)
		return
	end
	--Fim da verificação de nome


	if(@cpf is null) or ((REPLACE(@cpf,'','') = ''))
	begin
		raiserror('O campo cpf não pode ser vazio',16,1)
		return
	end
	--Fim da verificação de nome



	--Verificação de cpf
	if(@verificarCpf = 0) or ((REPLACE(@cpf,'','') = ''))
	begin
		raiserror('Cpf incorreto',16,1)
		return
	end
	update Cliente set nome = @nome,data_nascimento = @data_nascimento,cpf = @cpf where id = @id
	--fim da verificação de cpf

end

/*teste de stored_procedure


Funciona

	exec  Cliente_update '1','Diogo santos','28/02/2001','10547286406'




Não Funciona exec  Cliente_insert 'Diogo','28/02/2002','10547286407'


*/

--fim de inserir cliente--









--Visualizar clientes  DROP procedure Cliente_select_all--

CREATE PROCEDURE Veiculo_select_all
	@id int
as
begin
	if((@id = '') or (@id is null))
		begin
			select * from Veiculo
			return
		end

	select * from Veiculo where id = @id

end

/*teste de stored_procedure


Funciona  

	exec  Veiculo_select_all  ''

Não Funciona exec  Cliente_insert 'Diogo','28/02/2002','10547286407'


*/

--fim de visualizar cliente--






--deletar clientes  DROP procedure Cliente_delete--

CREATE PROCEDURE Cliente_delete
	@id int
as
begin
	if((@id = '') or (@id < 1))
		begin
			raiserror('nao foi possivel deletar o cliente',16,1)
			return
		end

		delete from Cliente where id = @id

end

/*teste de stored_procedure


Funciona  exec  Cliente_delete  '-1'


Não Funciona exec  Cliente_insert 'Diogo','28/02/2002','10547286407'


*/

--fim de deletar cliente--
