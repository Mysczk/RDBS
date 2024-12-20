DROP TABLE IF EXISTS "Employees" CASCADE;
DROP TABLE IF EXISTS "Mangas" CASCADE;
DROP TABLE IF EXISTS "Rooms" CASCADE;
DROP TABLE IF EXISTS "Genres" CASCADE;
DROP TABLE IF EXISTS "Positions" CASCADE;
DROP TABLE IF EXISTS "Customers" CASCADE;
DROP TABLE IF EXISTS "Creators" CASCADE;
DROP TABLE IF EXISTS "Mangas_Creators" CASCADE;
DROP TABLE IF EXISTS "Mangas_Genres" CASCADE;
DROP TABLE IF EXISTS "Roles" CASCADE;
DROP TABLE IF EXISTS "RoomReservations" CASCADE;
DROP TABLE IF EXISTS "Items" CASCADE;
DROP TABLE IF EXISTS "Types" CASCADE;
DROP TABLE IF EXISTS "Orders" CASCADE;
DROP TABLE IF EXISTS "OrderItems" CASCADE;

CREATE TABLE IF NOT EXISTS "Roles" (
	"id" serial NOT NULL,
	"name" varchar(255) NOT NULL,
	PRIMARY KEY("id")
);

CREATE TABLE IF NOT EXISTS "Mangas" (
	"id" serial NOT NULL,
	"title" varchar(255) NOT NULL,
	PRIMARY KEY("id")
);

CREATE TABLE IF NOT EXISTS "Rooms" (
	"id" serial NOT NULL,
	"name" varchar(255) NOT NULL,
	"capacity" smallint NOT NULL,
	"price" int NOT NULL,
	PRIMARY KEY("id")
);

CREATE TABLE IF NOT EXISTS "Positions" (
	"id" serial NOT NULL,
	"name" varchar(255) NOT NULL,
	"description" text,
	PRIMARY KEY("id")
);

CREATE TABLE IF NOT EXISTS "Types" (
	"id" serial NOT NULL,
	"name" varchar(255) NOT NULL,
	PRIMARY KEY("id")
);

CREATE TABLE IF NOT EXISTS "Genres" (
	"id" serial NOT NULL,
	"name" varchar(255) NOT NULL,
	PRIMARY KEY("id")
);

CREATE TABLE IF NOT EXISTS "Customers" (
	"id" serial NOT NULL,
	"firstName" varchar(255) NOT NULL,
	"lastName" varchar(255) NOT NULL,
	"mail" varchar(255) NOT NULL,
	"password" varchar(255) NOT NULL,
	"vip" boolean NOT NULL DEFAULT False,
	PRIMARY KEY("id")
);

CREATE TABLE IF NOT EXISTS "Creators" (
	"id" serial NOT NULL,
	"firstName" varchar(255) NOT NULL,
	"lastName" varchar(255) NOT NULL,
	"bio" text,
	PRIMARY KEY("id")
);

CREATE TABLE IF NOT EXISTS "Employees" (
	"id" serial NOT NULL,
	"firstName" varchar(255) NOT NULL,
	"lastName" varchar(255) NOT NULL,
	"mail" varchar(255) NOT NULL,
	"positionId" int NOT NULL,
	"phone" varchar(13) NOT NULL,
	"salary" bigint NOT NULL,
	PRIMARY KEY("id"),
	FOREIGN KEY("positionId") REFERENCES "Positions"("id") ON UPDATE NO ACTION ON DELETE NO ACTION
);

create table if not exists "Items"(
	"id" serial NOT NULL,
	"name" varchar(255) NOT NULL,
	"typeId" int NOT NULL,
	"cost" int NOT NULL,
	PRIMARY KEY("id"),
	FOREIGN KEY("typeId") REFERENCES "Types"("id") ON UPDATE NO ACTION ON DELETE NO action
	
);

CREATE TABLE IF NOT EXISTS "Mangas_Creators" (
	"id" serial NOT NULL,
	"creatorId" int NOT NULL,
	"mangaId" int NOT NULL,
	"roleId" int NOT NULL,
	PRIMARY KEY("id"),
	FOREIGN KEY("creatorId") REFERENCES "Creators"("id") ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY("mangaId") REFERENCES "Mangas"("id") ON UPDATE NO ACTION ON DELETE NO action,
	FOREIGN KEY("roleId") REFERENCES "Roles"("id") ON UPDATE NO ACTION ON DELETE NO ACTION
);


CREATE TABLE IF NOT EXISTS "Mangas_Genres" (
	"id" serial NOT NULL,
	"genreId" int NOT NULL,
	"mangaId" int NOT NULL,
	PRIMARY KEY("id"),
	FOREIGN KEY("genreId") REFERENCES "Genres"("id") ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY("mangaId") REFERENCES "Mangas"("id") ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE UNIQUE INDEX IF NOT EXISTS "genreId_mangaId_index"
ON "Mangas_Genres" ("genreId", "mangaId");


CREATE TABLE IF NOT EXISTS "RoomReservations" (
	"id" serial NOT NULL,
	"roomId" int NOT NULL,
	"customerId" int NOT NULL,
	"startTime" timestamp NOT NULL,
	"endTime" timestamp NOT NULL,
	PRIMARY KEY("id"),
	FOREIGN KEY("roomId") REFERENCES "Rooms"("id") ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY("customerId") REFERENCES "Customers"("id") ON UPDATE NO ACTION ON DELETE NO ACTION
);

create table if not exists "Orders"(
	"id" serial not null,
	"roomId" int NOT NULL,
	"customerId" int NOT NULL,
	"employeeId" int NOT NULL,
	"orderDate" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY("id"),
	FOREIGN KEY("roomId") REFERENCES "Rooms"("id") ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY("customerId") REFERENCES "Customers"("id") ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY("employeeId") REFERENCES "Employees"("id") ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE IF NOT EXISTS "OrderItems" (
	"id" serial NOT NULL,
	"orderId" int NOT NULL,
	"itemId" int NOT NULL,
	"mangaId" int,
	"quantity" int NOT NULL,
	PRIMARY KEY("id"),
	FOREIGN KEY("orderId") REFERENCES "Orders"("id") ON UPDATE NO ACTION ON DELETE CASCADE,
	FOREIGN KEY("itemId") REFERENCES "Items"("id") ON UPDATE NO ACTION ON DELETE NO action,
	foreign key("mangaId") references "Mangas"("id") ON UPDATE NO ACTION ON DELETE cascade
);