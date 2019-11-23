--editar Veiculo--


CREATE PROCEDURE Veiculo_update
	@id	int,
	@fabricante	VARCHAR(60),
	@modelo	VARCHAR(60),
	@ano_fabricante INT,
	@placa CHAR(8),
	@uf CHAR(2)
as
begin

	update Veiculo set fabricante = @fabricante,modelo = @modelo,ano_fabricante = @ano_fabricante,placa = @placa,uf = @uf where id = @id

end
