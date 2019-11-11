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


*/




--inserir cliente--


CREATE PROCEDURE Cliente_insert 
	@nome	VARCHAR(100),
	@data_nascimento DATE,
	@cpf VARCHAR(11)
as
begin
	declare @verificarCpf bit
	set @verificarCpf  = (select dbo.validarCpf(@cpf))

	if(@nome is null) or ((REPLACE(@nome,'','') = ''))
	begin
		raiserror('O campo nome não pode ser vazio',16,1)
		return
	end


	if(@verificarCpf = 0) or ((REPLACE(@cpf,'','') = ''))
	begin
		raiserror('Cpf incorreto',16,1)
		return
	end
	insert into Cliente(nome,data_nascimento,cpf) values (@nome,@data_nascimento,@cpf)

end

/*teste de stored_procedure
DROP procedure Cliente_insert 


Funciona  exec  Cliente_insert 'Diogo','28/02/2002','10547286406'


Não Funciona exec  Cliente_insert 'Diogo','28/02/2002','10547286407'




--fim de inserir cliente--
