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
	@id	INT,
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

	--Verificação de fabricante
		if(@modelo is null) or ((REPLACE(@modelo,'','') = ''))
		begin
			raiserror('O nome do modelo não pode ser vazio',16,1)
			return
		end
	--Fim da verificação de fabricante

	--Verificação de id
		if((@id = '') or (@id is null))
		begin
			select * from Cliente
			return
		end
	--Fim da verificação de id

	--Verificação de id
		if((@id = '') or (@id is null))
		begin
			select * from Cliente
			return
		end
	--Fim da verificação de id

end

/*teste de stored_procedure


Funciona

	exec  Cliente_insert 'Diogo','28/02/2002','10547286406'
	exec  Cliente_insert 'Raul Severino Anderson Gomes','19/07/1941','93907929594'
	exec  Cliente_insert 'Luzia Sebastiana Mariana Teixeira','10/12/1965','00699370108'




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

CREATE PROCEDURE Cliente_select_all
	@id int
as
begin
	if((@id = '') or (@id is null))
		begin
			select * from Cliente
			return
		end

	select * from Cliente where id = @id

end

/*teste de stored_procedure


Funciona  

	exec  Cliente_select_all  ''


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
