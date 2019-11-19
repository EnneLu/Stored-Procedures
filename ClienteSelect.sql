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

	exec  Cliente_select_all  '' --seleciona todos 

	exec  Cliente_select_all  '1' --seleciona pelo id

*/

--fim de visualizar cliente--