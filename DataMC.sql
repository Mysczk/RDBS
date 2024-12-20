-- Insert data into Roles
INSERT INTO "Roles" ("name") VALUES 
('Author'), ('Artist'), ('Editor');

-- Insert data into Mangas
INSERT INTO "Mangas" ("title") VALUES 
('Naruto'), ('One Piece'), ('Attack on Titan'), ('Dragon Ball'), 
('Bleach'), ('Death Note'), ('Fullmetal Alchemist'), ('Fairy Tail'), 
('Sword Art Online'), ('My Hero Academia'), ('Black Clover'), 
('Demon Slayer'), ('Tokyo Ghoul'), ('One Punch Man'), ('Hunter x Hunter'),
('Fairy Tail'), ('Sword Art Online'), ('My Hero Academia'), 
('Black Clover'), ('Demon Slayer'), ('Tokyo Ghoul'), 
('One Punch Man'), ('Hunter x Hunter'), ('Gintama'), 
('Blue Exorcist'), ('The Seven Deadly Sins'), ('Toriko'), 
('Akame ga Kill'), ('Claymore'), ('Attack on Titan: No Regrets'),
('Ve službách krále');

-- Insert data into Rooms
INSERT INTO "Rooms" ("name", "capacity", "price") VALUES 
('Room A', 20, 1000), ('Room B', 30, 1500), ('Room C', 25, 1200),
('Room D', 15, 800), ('Room E', 35, 1700), ('Room F', 40, 2000);

-- Insert data into Positions
INSERT INTO "Positions" ("name", "description") VALUES 
('Manager', 'Manages the store'), 
('Cashier', 'Handles customer payments'), 
('Stock Clerk', 'Manages inventory'), 
('Customer Service', 'Assists customers'), 
('Security', 'Ensures safety'), 
('Janitor', 'Keeps the store clean'),
('Assistant Manager', 'Assists the manager in daily tasks'), 
('Maintenance', 'Handles repairs and maintenance'), 
('Receptionist', 'Greets and assists customers at the front desk'), 
('Barista', 'Prepares and serves coffee and other beverages');

-- Insert data into Types
INSERT INTO "Types" ("name") VALUES 
('Book'), ('Merchandise'), ('Food'),
('Beverage'), ('Accessory'),('Clothing'),
('Collectible'), ('Stationery'), ('Decoration'), 
('Game');

-- Insert data into Genres
INSERT INTO "Genres" ("name") VALUES 
('Shonen'), ('Seinen'), ('Shojo'),
('Josei'), ('Kodomo'), ('Slice of Life'),
('Comedy'), ('Drama'), ('Fantasy'), 
('Mystery'), ('Thriller'), ('Horror');

-- Insert data into Customers
INSERT INTO "Customers" ("firstName", "lastName", "mail", "password", "vip") VALUES 
('John', 'Doe', 'john.doe@example.com', 'password123', false),
('Jane', 'Smith', 'jane.smith@example.com', 'password123', true), 
('Alice', 'Johnson', 'alice.johnson@example.com', 'password123', false),
('Michael', 'Brown', 'michael.brown@example.com', 'password123', true),
('Emily', 'Davis', 'emily.davis@example.com', 'password123', false),
('Chris', 'Martinez', 'chris.martinez@example.com', 'password123', true),
('Sarah', 'Wilson', 'sarah.wilson@example.com', 'password123', false),
('David', 'Garcia', 'david.garcia@example.com', 'password123', true),
('Emma', 'Rodriguez', 'emma.rodriguez@example.com', 'password123', false),
('Daniel', 'Miller', 'daniel.miller@example.com', 'password123', true),
('Oliver', 'King', 'oliver.king@example.com', 'password123', true), 
('Sophia', 'Green', 'sophia.green@example.com', 'password123', false), 
('William', 'Hall', 'william.hall@example.com', 'password123', true),
('Isabella', 'Adams', 'isabella.adams@example.com', 'password123', false),
('James', 'Baker', 'james.baker@example.com', 'password123', true),
('Ava', 'Evans', 'ava.evans@example.com', 'password123', false),
('Logan', 'Turner', 'logan.turner@example.com', 'password123', true),
('Mia', 'Parker', 'mia.parker@example.com', 'password123', false),
('Lucas', 'Edwards', 'lucas.edwards@example.com', 'password123', true),
('Amelia', 'Collins', 'amelia.collins@example.com', 'password123', false);

-- Insert data into Employees
INSERT INTO "Employees" ("firstName", "lastName", "mail", "positionId", "phone", "salary") VALUES 
('Bob', 'Brown', 'bob.brown@example.com', 1, '1234567890', 50000), 
('Charlie', 'Davis', 'charlie.davis@example.com', 2, '2345678901', 30000), 
('Eve', 'Wilson', 'eve.wilson@example.com', 3, '3456789012', 25000),
('Frank', 'Taylor', 'frank.taylor@example.com', 4, '4567890123', 35000),
('Grace', 'Anderson', 'grace.anderson@example.com', 5, '5678901234', 40000),
('Hank', 'Thomas', 'hank.thomas@example.com', 6, '6789012345', 28000),
('Ivy', 'Harris', 'ivy.harris@example.com', 1, '7890123456', 50000),
('Jack', 'Clark', 'jack.clark@example.com', 2, '8901234567', 30000),
('Kara', 'Lewis', 'kara.lewis@example.com', 3, '9012345678', 25000),
('Igor', 'Makataka', 'makataka@example.com', 3, '9017844678', 25000),
('Liam', 'Robinson', 'liam.robinson@example.com', 4, '1234567809', 35000),
('Tom', 'Patterson', 'tom.patterson@example.com', 7, '1345678901', 45000), 
('Jerry', 'Carter', 'jerry.carter@example.com', 8, '1456789012', 32000), 
('Maggie', 'Perry', 'maggie.perry@example.com', 9, '1567890123', 29000),
('Nancy', 'Morgan', 'nancy.morgan@example.com', 10, '1678901234', 37000),
('Oscar', 'Bell', 'oscar.bell@example.com', 10, '1789012345', 48000),
('Pamela', 'Cox', 'pamela.cox@example.com', 2, '1890123456', 34000),
('Quentin', 'Reed', 'quentin.reed@example.com', 1, '1901234567', 51000),
('Rachel', 'Cook', 'rachel.cook@example.com', 2, '2012345678', 31000),
('Steve', 'Brooks', 'steve.brooks@example.com', 3, '2123456789', 27000),
('Uma', 'Lee', 'uma.lee@example.com', 4, '2234567890', 36000),
('Victor', 'Walker', 'victor.walker@example.com', 5, '2345678901', 41000);

-- Insert data into Items
INSERT INTO "Items" ("name", "typeId", "cost") VALUES 
('Naruto Volume 1', 1, 200), 
('One Piece T-Shirt', 2, 500), 
('Ramen', 3, 150),
('Dragon Ball Volume 1', 1, 220),
('Bleach Poster', 2, 300),
('Death Note Notebook', 2, 400),
('Fullmetal Alchemist Keychain', 2, 250),
('Fairy Tail Mug', 2, 350),
('Sword Art Online Volume 1', 1, 230),
('My Hero Academia Backpack', 2, 600),
('Black Clover Volume 1', 1, 210),
('Demon Slayer Hoodie', 2, 700),
('Tokyo Ghoul Mask', 2, 450),
('One Punch Man Cap', 2, 350),
('Hunter x Hunter Volume 1', 1, 240),
('Fairy Tail Volume 1', 1, 200), 
('Sword Art Online T-Shirt', 2, 550), 
('Gintama Keychain', 3, 150),
('Blue Exorcist Volume 1', 1, 220),
('The Seven Deadly Sins Poster', 2, 350),
('Toriko Notebook', 2, 300),
('Akame ga Kill Keychain', 3, 250),
('Claymore Mug', 2, 400),
('Attack on Titan: No Regrets Volume 1', 1, 250),
('Tokyo Ghoul Hoodie', 2, 650),
('One Punch Man Cap', 2, 450),
('Hunter x Hunter T-Shirt', 2, 500),
('Fairy Tail Cap', 2, 350),
('Gintama Mug', 2, 300),
('Blue Exorcist Notebook', 2, 280);

-- Insert data into Creators
INSERT INTO "Creators" ("firstName", "lastName", "bio") VALUES 
('Masashi', 'Kishimoto', 'Creator of Naruto'), 
('Eiichiro', 'Oda', 'Creator of One Piece'), 
('Hajime', 'Isayama', 'Creator of Attack on Titan'),
('Akira', 'Toriyama', 'Creator of Dragon Ball'),
('Tite', 'Kubo', 'Creator of Bleach'),
('Tsugumi', 'Ohba', 'Creator of Death Note'),
('Hiromu', 'Arakawa', 'Creator of Fullmetal Alchemist'),
('Hiro', 'Mashima', 'Creator of Fairy Tail'),
('Reki', 'Kawahara', 'Creator of Sword Art Online'),
('Kohei', 'Horikoshi', 'Creator of My Hero Academia'),
('Hiro', 'Mashima', 'Creator of Fairy Tail'), 
('Reki', 'Kawahara', 'Creator of Sword Art Online'), 
('Yoshihiro', 'Togashi', 'Creator of Hunter x Hunter'),
('Hideaki', 'Sorachi', 'Creator of Gintama'),
('Kazue', 'Kato', 'Creator of Blue Exorcist'),
('Nakaba', 'Suzuki', 'Creator of The Seven Deadly Sins'),
('Mitsutoshi', 'Shimabukuro', 'Creator of Toriko'),
('Takahiro', 'Akame', 'Creator of Akame ga Kill'),
('Norihiro', 'Yagi', 'Creator of Claymore'),
('Gun', 'Snark', 'Creator of Attack on Titan: No Regrets'),
('Jiří', 'Fišer', 'Creator of Ve službách krále');

-- Insert data into Mangas_Creators
INSERT INTO "Mangas_Creators" ("creatorId", "mangaId", "roleId") VALUES 
(1, 1, 1), 
(2, 2, 1), 
(3, 3, 1),
(4, 4, 1), 
(5, 5, 1), 
(6, 6, 1),
(7, 7, 1),
(8, 8, 1),
(9, 9, 1),
(10, 10, 1),
(11, 11, 1), 
(12, 12, 1), 
(13, 13, 1),
(14, 14, 1), 
(15, 15, 1), 
(16, 16, 1),
(17, 17, 1),
(18, 18, 1),
(19, 19, 1),
(20, 20, 1),
(21,31,1);

-- Insert data into Mangas_Genres
INSERT INTO "Mangas_Genres" ("genreId", "mangaId") VALUES 
(1, 1), 
(1, 2), 
(2, 3),
(1, 4), 
(1, 5), 
(2, 6),
(3, 7),
(3, 8),
(1, 9),
(1, 10),
(1, 11), 
(2, 12), 
(2, 13),
(3, 14), 
(4, 15), 
(5, 16),
(6, 17),
(1, 18),
(2, 19),
(3, 20);

-- Insert data into RoomReservations
INSERT INTO "RoomReservations" ("roomId", "customerId", "startTime", "endTime") VALUES 
(1, 1, '2024-07-01 10:00:00', '2024-07-01 12:00:00'), 
(2, 2, '2024-07-01 13:00:00', '2024-07-01 15:00:00'), 
(3, 3, '2024-07-01 16:00:00', '2024-07-01 18:00:00'),
(4, 4, '2024-07-02 10:00:00', '2024-07-02 12:00:00'), 
(5, 5, '2024-07-02 13:00:00', '2024-07-02 15:00:00'), 
(6, 6, '2024-07-02 16:00:00', '2024-07-02 18:00:00'),
(1, 7, '2024-07-03 10:00:00', '2024-07-03 12:00:00'), 
(2, 8, '2024-07-03 13:00:00', '2024-07-03 15:00:00'), 
(3, 9, '2024-07-03 16:00:00', '2024-07-03 18:00:00'),
(4, 10, '2024-07-04 10:00:00', '2024-07-05 12:00:00'),
(1, 11, '2024-07-05 10:00:00', '2024-07-05 12:00:00'), 
(2, 12, '2024-07-05 13:00:00', '2024-07-05 15:00:00'), 
(3, 13, '2024-07-05 16:00:00', '2024-07-05 18:00:00'),
(4, 14, '2024-07-06 10:00:00', '2024-07-06 12:00:00'), 
(5, 15, '2024-07-06 13:00:00', '2024-07-06 15:00:00'), 
(6, 16, '2024-07-06 16:00:00', '2024-07-06 18:00:00'),
(1, 17, '2024-07-07 10:00:00', '2024-07-07 12:00:00'), 
(2, 18, '2024-07-07 13:00:00', '2024-07-07 15:00:00'), 
(3, 19, '2024-07-07 16:00:00', '2024-07-07 18:00:00'),
(1, 17, '2024-07-10 10:00:00', '2024-07-13 12:00:00'), 
(2, 18, '2024-10-07 13:00:00', '2024-10-07 15:00:00'), 
(3, 19, '2024-10-07 16:00:00', '2024-10-07 18:00:00'),
(4, 20, '2024-10-08 10:00:00', '2024-10-08 12:00:00'),
(1, 1, '2024-10-08 13:00:00', '2024-10-08 15:00:00'), 
(2, 2, '2024-10-08 16:00:00', '2024-10-08 18:00:00'), 
(3, 3, '2024-10-09 10:00:00', '2024-10-09 12:00:00'),
(4, 4, '2024-10-09 13:00:00', '2024-10-09 15:00:00'), 
(5, 5, '2024-10-09 16:00:00', '2024-10-09 18:00:00'), 
(6, 6, '2024-10-10 10:00:00', '2024-10-10 12:00:00'),
(1, 7, '2024-10-10 13:00:00', '2024-10-10 15:00:00'), 
(2, 8, '2024-10-10 16:00:00', '2024-10-10 18:00:00'), 
(3, 9, '2024-10-11 10:00:00', '2024-10-11 12:00:00'),
(4, 10, '2024-10-11 13:00:00', '2024-10-11 15:00:00'), 
(5, 11, '2024-10-11 16:00:00', '2024-10-11 18:00:00'), 
(6, 12, '2024-10-12 10:00:00', '2024-10-12 12:00:00'),
(1, 13, '2024-10-12 13:00:00', '2024-10-12 15:00:00'), 
(2, 14, '2024-10-12 16:00:00', '2024-10-12 18:00:00'), 
(3, 15, '2024-10-13 10:00:00', '2024-10-13 12:00:00'),
(4, 16, '2024-10-13 13:00:00', '2024-10-13 15:00:00'), 
(5, 17, '2024-10-13 16:00:00', '2024-10-13 18:00:00'), 
(6, 18, '2024-10-14 10:00:00', '2024-10-14 12:00:00'),
(1, 19, '2024-10-14 13:00:00', '2024-10-14 15:00:00'), 
(2, 20, '2024-10-14 16:00:00', '2024-10-14 18:00:00');

-- Insert data into Orders
INSERT INTO "Orders" ("roomId", "customerId", "employeeId", "orderDate") VALUES 
(1, 1, 1, '2024-07-01 10:30:00'), 
(2, 2, 2, '2024-07-01 13:30:00'), 
(3, 3, 3, '2024-07-01 16:30:00'),
(4, 4, 4, '2024-07-02 10:30:00'), 
(5, 5, 5, '2024-07-02 13:30:00'), 
(6, 6, 6, '2024-07-02 16:30:00'),
(1, 7, 7, '2024-07-03 10:30:00'), 
(2, 8, 8, '2024-07-03 13:30:00'), 
(3, 9, 9, '2024-07-03 16:30:00'),
(4, 10, 10, '2024-07-04 10:30:00'),
(1, 11, 11, '2024-07-05 10:30:00'), 
(2, 12, 12, '2024-07-05 13:30:00'), 
(3, 13, 13, '2024-07-05 16:30:00'),
(4, 14, 14, '2024-07-06 10:30:00'), 
(5, 15, 15, '2024-07-06 13:30:00'), 
(6, 16, 16, '2024-07-06 16:30:00'),
(1, 17, 17, '2024-07-07 10:30:00'), 
(2, 18, 18, '2024-07-07 13:30:00'), 
(3, 19, 19, '2024-07-07 16:30:00'),
(4, 20, 20, '2024-07-08 10:30:00'),
(3, 9, 9, '2024-09-15 16:30:00'),
(4, 10, 10, '2024-10-15 10:30:00');

-- Insert data into OrderItems
INSERT INTO "OrderItems" ("orderId", "itemId", "mangaId", "quantity") VALUES 
(1, 1, 30, 2), 
(2, 2, 1, 1), 
(3, 3, 2, 3),
(4, 4, 3, 1), 
(5, 5, 4, 2), 
(6, 6, 5, 1),
(7, 7, 6, 3), 
(8, 8, 7, 2), 
(9, 9, 8, 1),
(10, 10, 9, 2),
(11, 11, 10, 2), 
(12, 12, 11, 1), 
(13, 13, 12, 3),
(14, 14, 13, 1), 
(15, 15, 14, 2), 
(16, 16, 15, 1),
(17, 17, 16, 3), 
(18, 18, 17, 2), 
(19, 19, 18, 1),
(20, 20, 19, 2),
(10, 1, 31, 2), 
(20, 2, 21, 1), 
(13, 3, 22, 3),
(14, 4, 23, 1), 
(15, 5, 24, 2), 
(16, 6, 25, 1),
(17, 7, 26, 3), 
(18, 8, 27, 2), 
(19, 9, 28, 1);

