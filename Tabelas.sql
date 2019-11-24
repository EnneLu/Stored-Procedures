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
	ano_fabricacao INT,
	placa CHAR(8),
	uf CHAR(2)
	PRIMARY KEY(id)
)


danger zone


 drop table Cliente

 drop table Veiculo

 DROP procedure Cliente_insert 

 DROP procedure Cliente_select_all

 DROP procedure Cliente_delete

 DROP procedure Cliente_update

 drop function validarCPF
