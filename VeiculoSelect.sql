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
/*
	
	exec Veiculo_select_all''
	
*/