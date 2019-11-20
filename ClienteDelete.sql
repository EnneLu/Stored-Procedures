--deletar clientes  DROP procedure Cliente_delete--

CREATE PROCEDURE Cliente_delete
	@id int
as
begin
	if((@id = '') or (@id is null))
		begin
			raiserror('O id não pode ser vazio',16,1)
			return
		end

	delete from Cliente where id = @id

end

/*teste de stored_procedure


Funciona  

	exec  Cliente_delete  '1'  

	exec  Cliente_delete  '2' 

*/