delimiter //
create procedure listacorreo(
inout emailList varchar(400)
)
begin
declare finished integer default 0;
declare emailAddress varchar (100) default "";

declare curEmail
cursor for
select correo from usuarios;
-- declare not found handler
declare continue handler
for not found set finished= 1;

open curEmail;
set emailList = "";
getEmail: loop
	fetch curEmail INTO emailAddress;
	if finished = 1 then
		leave getEmail;
	end if;
	-- build email list
    set emailList = concat(emailAddress,";",emailList);
    end loop getEmail;
    close curEmail;
end
//
