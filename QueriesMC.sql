update "Customers" 
set "password" = 'Heslo123' -- 'password123'
where id = 1;

-- delete
delete from "RoomReservations" where id = 1;

-- Select all customers
select * from "Customers" c;
-- Select all VIP customers
select * from "Customers" c where vip = true;

-- Select all VIP customers order by name
select * from "Customers" c where vip = true order by "firstName";

-- Total count by customer type
select
	case when c.vip = true then 'VIP customer'
	else 'Standard customer'
	end as "customerType", count(id) as "totalCustomers"
from "Customers" c group by vip;

-- Select for Average salary in MangaCoffee
select round(avg(e.salary),2) 
from "Employees" e;

-- Right join
select *
from "Orders" o
right join "Employees" e on e.id = o."employeeId";

-- Left join
select e."firstName", e."lastName", e.salary, p."name" as "position"
from "Employees" e 
left join "Positions" p ON p.id = e."positionId";

-- Left join with group by and operations
select p."name", round(avg(e.salary),2) as salary 
from "Employees" e 
left join "Positions" p ON p.id = e."positionId"
group by p."name";

-- Inner join
select p."name" as "position", e.salary 
from "Positions" p 
inner join "Employees" e on e."positionId" = p.id 

SELECT concat(e."firstName", ' ', e."lastName"), COUNT(o."customerId") AS order_count
FROM "Employees" e
LEFT JOIN "Orders" o ON e.id = o."employeeId"
GROUP BY e.id, o."customerId" 
HAVING COUNT(o."employeeId") > 1;

select r."name" as "roomName", concat(c."firstName", ' ', c."lastName") as "customerName", concat(e."firstName", ' ', e."lastName") as "employeeName", o."orderDate" as "orderDate"
from "Orders" o 
inner join "Rooms" r on r.id = o."roomId" 
inner join "Customers" c on c.id = o."customerId" 
inner join "Employees" e on e.id = o."employeeId";

-- Right joins with concats
select r."name" as "roomName", concat(c."firstName", ' ', c."lastName") as "customerName" ,concat(e."firstName", ' ',e."lastName") as "employeeName", o."orderDate"
from "Orders" o 
right join "Rooms" r on r.id = o."roomId"
right join "Customers" c on c.id = o."customerId"
right join "Employees" e on  e.id = o."employeeId";

-- View of people connected to rooms
create or replace view "RoomPeople" as
select r."name" as "roomName", c."firstName" as "customerFName", c."lastName" as "customerLName" , e."firstName" as "EmployeeFName", e."lastName" as "employeeLName", o."orderDate"
from "Orders" o 
right join "Rooms" r on r.id = o."roomId"
right join "Customers" c on c.id = o."customerId"
right join "Employees" e on  e.id = o."employeeId";

select *
from "RoomPeople" 
where "roomName" is null;

select r."name" as "roomName", concat(c."firstName", ' ', c."lastName") as "customerName", date(rr."startTime"), (rr."endTime" - rr."startTime") as duration
from "RoomReservations" rr 
inner join "Rooms" r on r.id = rr."roomId" 
inner join "Customers" c on c.id = rr."roomId"
where (rr."endTime" - rr."startTime") > interval '1 day';

select r."name", r.capacity, rr."startTime" 
from "RoomReservations" rr  
right join "Rooms" r on rr."roomId" = r.id
group by r.id, rr.id having r.capacity > 30;


select concat(c."firstName", ' ', c."lastName") as "creatorName", m.title as "mangaTitle", r."name" as "role" 
from "Mangas_Creators" mc 
right join "Creators" c on mc."creatorId"  = c.id 
right join "Mangas" m on mc."mangaId" = m.id
inner join "Roles" r on mc."roleId" = r.id;



-- funkce
drop function room_capacity;
create or replace function room_capacity(capacity_room int)
returns int
language plpgsql
as
$$
declare 
room_count integer;
begin
	select count(*)
	into room_count
	from "Rooms" r
	where r.capacity >= capacity_room;
return room_count;
end;
$$

select room_capacity(20);



-- procedura
DROP PROCEDURE IF EXISTS insert_type(varchar);

CREATE OR REPLACE PROCEDURE insert_type(_name varchar(255))
LANGUAGE plpgsql
AS 
$$
BEGIN
    -- Pokus o vložení hodnoty
    INSERT INTO "Types" (name) VALUES (_name);

    -- Informace o úspěchu
    RAISE NOTICE 'Hodnota "%" byla úspěšně vložena do tabulky Types.', _name;

EXCEPTION
    WHEN OTHERS THEN
        RAISE WARNING 'Neočekávaná chyba: %. Vložení hodnoty "%" se nezdařilo.', SQLERRM, _name;
END;
$$;


call insert_type('Test');
call insert_type(null);


select * from "Types" t ;

select * from "Types" t where t."name" = 'Test';
delete from "Types" t where t."name" = 'test';


SELECT * FROM "OrderItems" oi WHERE "orderId"= 1 FOR update;
select * from "OrderItems" oi;

-- user
--
create user testeros with password 'turboheslo';
create role reader;
grant usage on schema "MangaCoffee" to reader;
grant select on "Types"to reader;
grant reader to testeros;
--
revoke select on table "Types" from reader;
revoke usage on schema "MangaCoffee" from reader;
drop user testeros;
drop role reader;
--
set session authorization testeros;
select * from "Types" t;
reset session Authorization;

-- cursor














create or replace procedure create_user()
language plpgsql as
$$
declare 
	user_cursor CURSOR FOR SELECT mail, phone FROM "Employees";
    row_data RECORD;
	begin
		open user_cursor;
		lock table "Employees" in share row exclusive mode;	
		loop
			FETCH user_cursor INTO row_data;
			EXIT WHEN NOT FOUND;
				IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = row_data.mail) THEN
					-- Pokud neexistuje, vytvoříme uživatele
					EXECUTE format('CREATE USER %I WITH PASSWORD %L', row_data.mail, row_data.phone);
				END IF;   
		end loop;
		
		close user_cursor;
		exception
		when others then
			rollback;
		  RAISE NOTICE 'Došlo k chybě: % Transakce byla rollbacknuta.', sqlerrm;
	end;
$$


create or replace procedure clear_user()
language plpgsql as
$$
declare 
	user_cursor CURSOR FOR SELECT mail FROM "Employees";
    row_data RECORD;
	begin
		open user_cursor;
		lock table "Employees" in share row exclusive mode;	
		loop
			FETCH user_cursor INTO row_data;
			EXIT WHEN NOT FOUND;
				IF EXISTS (SELECT 1 FROM pg_roles WHERE rolname = row_data.mail) THEN
					-- Pokud neexistuje, vytvoříme uživatele
					EXECUTE format('DROP USER IF EXISTS %I', row_data.mail);
				END IF;   
		end loop;
		
		close user_cursor;
		exception
		when others then
			rollback;
		  RAISE NOTICE 'Došlo k chybě: % Transakce byla rollbacknuta.', sqlerrm;
	end;
$$

call create_user();
call clear_user();

--- trigger
CREATE OR REPLACE FUNCTION create_user_account()
RETURNS TRIGGER AS
$$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = NEW.mail) THEN
        -- Pokud neexistuje, vytvoříme uživatele
        EXECUTE format('CREATE USER %I WITH PASSWORD %L', NEW.mail, NEW.phone);
    END IF;
    RETURN NEW;
END;
$$
LANGUAGE plpgsql;

create or replace TRIGGER trigger_create_user_account
AFTER INSERT ON "Employees"
FOR EACH ROW
EXECUTE FUNCTION create_user_account();

INSERT INTO "Employees" ("firstName", "lastName", "mail", "positionId", "phone", "salary") VALUES 
('Alice', 'Smith', 'alice.smith@example.com', 4, '4567890123', 55000), 
('David', 'Johnson', 'david.johnson@example.com', 5, '5678901234', 40000), 
('Grace', 'Taylor', 'grace.taylor@example.com', 6, '6789012345', 60000), 
('Hannah', 'Martinez', 'hannah.martinez@example.com', 7, '7890123456', 45000),
('Ian', 'Lopez', 'ian.lopez@example.com', 8, '8901234567', 35000);

---

CREATE OR REPLACE FUNCTION delete_user_account()
RETURNS TRIGGER AS
$$
BEGIN
    -- Vytvoření uživatele pomocí e-mailu a telefonu
    EXECUTE format('drop USER if exists %I', old.mail);
    RETURN old;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER trigger_delete_user_account
AFTER delete ON "Employees"
FOR EACH ROW
EXECUTE FUNCTION delete_user_account();

DELETE FROM "Employees" WHERE "mail" = 'alice.smith@example.com';
DELETE FROM "Employees" WHERE "mail" = 'david.johnson@example.com';
DELETE FROM "Employees" WHERE "mail" = 'grace.taylor@example.com';
DELETE FROM "Employees" WHERE "mail" = 'hannah.martinez@example.com';
DELETE FROM "Employees" WHERE "mail" = 'ian.lopez@example.com';

--- transakce

DO $$
BEGIN
    BEGIN
        -- Začátek transakce
        INSERT INTO "Items" ("name", "typeId", "cost") VALUES ('Item A', 1, 100);
        INSERT INTO "Items" ("name", "typeId", "cost") VALUES ('Item B', 999, 200); -- Neplatný typeId
        INSERT INTO "Items" ("name", "typeId", "cost") VALUES ('Item C', 2, 300);

        COMMIT; -- Potvrzení transakce, pokud vše proběhlo bez chyby
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK; -- Zrušení transakce, pokud došlo k chybě
            RAISE NOTICE 'Došlo k chybě. Transakce byla rollbacknuta.';
    END;
END;
$$;
