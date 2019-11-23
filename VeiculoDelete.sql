CREATE PROCEDURE Veiculo_delete
	@id int
as
begin
	if((@id = '') or (@id is null))
		begin
			raiserror('O id não pode ser vazio',16,1)
			return
		end

	delete from Veiculo where id = @id

end