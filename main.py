from sqlalchemy import (
    create_engine, Column, Integer, String, Text, Boolean, ForeignKey, SmallInteger, BigInteger, DateTime, MetaData, func, text
)
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import relationship, sessionmaker
from sqlalchemy.exc import SQLAlchemyError

DATABASE_URL = "postgresql://postgres:postgres@localhost:5432/MangaCoffee"
engine = create_engine(DATABASE_URL, echo=True)
Base = declarative_base(metadata=MetaData(schema="MangaCoffee"))

# Tabulka Roles
class Role(Base):
    __tablename__ = "Roles"
    __table_args__ = {"schema": "MangaCoffee"}
    id = Column(Integer, primary_key=True)
    name = Column(String(255), nullable=False)

# Tabulka Mangas
class Manga(Base):
    __tablename__ = "Mangas"
    __table_args__ = {"schema": "MangaCoffee"}
    id = Column(Integer, primary_key=True)
    title = Column(String(255), nullable=False)
    creators = relationship("MangaCreator", back_populates="manga")
    genres = relationship("MangaGenre", back_populates="manga")

# Tabulka Rooms
class Room(Base):
    __tablename__ = "Rooms"
    __table_args__ = {"schema": "MangaCoffee"}
    id = Column(Integer, primary_key=True)
    name = Column(String(255), nullable=False)
    capacity = Column(SmallInteger, nullable=False)
    price = Column(Integer, nullable=False)
    reservations = relationship("RoomReservation", back_populates="room")

# Tabulka Positions
class Position(Base):
    __tablename__ = "Positions"
    __table_args__ = {"schema": "MangaCoffee"}
    id = Column(Integer, primary_key=True)
    name = Column(String(255), nullable=False)
    description = Column(Text)
    superiorId = Column(Integer, ForeignKey('Positions.id', ondelete='SET NULL'))
    superior = relationship("Position", backref="subordinates", remote_side=[id])

# Tabulka Types
class Type(Base):
    __tablename__ = "Types"
    __table_args__ = {"schema": "MangaCoffee"}
    id = Column(Integer, primary_key=True)
    name = Column(String(255), nullable=False)

# Tabulka Genres
class Genre(Base):
    __tablename__ = "Genres"
    __table_args__ = {"schema": "MangaCoffee"}
    id = Column(Integer, primary_key=True)
    name = Column(String(255), nullable=False)

# Tabulka Customers
class Customer(Base):
    __tablename__ = "Customers"
    __table_args__ = {"schema": "MangaCoffee"}
    id = Column(Integer, primary_key=True)
    first_name = Column("firstName", String(255), nullable=False)
    last_name = Column("lastName", String(255), nullable=False)
    mail = Column(String(255), nullable=False)
    password = Column(String(255), nullable=False)
    vip = Column(Boolean, nullable=False, default=False)
    reservations = relationship("RoomReservation", back_populates="customer")
    orders = relationship("Order", back_populates="customer")

# Tabulka Creators
class Creator(Base):
    __tablename__ = "Creators"
    __table_args__ = {"schema": "MangaCoffee"}
    id = Column(Integer, primary_key=True)
    first_name = Column("firstName", String(255), nullable=False)
    last_name = Column("lastName", String(255), nullable=False)
    bio = Column(Text)
    mangas = relationship("MangaCreator", back_populates="creator")

# Tabulka Employees
class Employee(Base):
    __tablename__ = "Employees"
    __table_args__ = {"schema": "MangaCoffee"}
    id = Column(Integer, primary_key=True)
    first_name = Column("firstName", String(255), nullable=False)
    last_name = Column("lastName", String(255), nullable=False)
    mail = Column(String(255), nullable=False)
    position_id = Column("positionId", Integer, ForeignKey("Positions.id"), nullable=False)
    phone = Column(String(13), nullable=False)
    salary = Column(BigInteger, nullable=False)
    position = relationship("Position")
    orders = relationship("Order", back_populates="employee")

# Tabulka Items
class Item(Base):
    __tablename__ = "Items"
    __table_args__ = {"schema": "MangaCoffee"}
    id = Column(Integer, primary_key=True)
    name = Column(String(255), nullable=False)
    type_id = Column("typeId", Integer, ForeignKey("Types.id"), nullable=False)
    cost = Column(Integer, nullable=False)
    type = relationship("Type")

# Tabulka MangaCreators
class MangaCreator(Base):
    __tablename__ = "Mangas_Creators"
    __table_args__ = {"schema": "MangaCoffee"}
    id = Column(Integer, primary_key=True)
    creator_id = Column("creatorId", Integer, ForeignKey("Creators.id"), nullable=False)
    manga_id = Column("mangaId", Integer, ForeignKey("Mangas.id"), nullable=False)
    role_id = Column("roleId", Integer, ForeignKey("Roles.id"), nullable=False)
    creator = relationship("Creator", back_populates="mangas")
    manga = relationship("Manga", back_populates="creators")
    role = relationship("Role")

# Tabulka MangaGenres
class MangaGenre(Base):
    __tablename__ = "Mangas_Genres"
    __table_args__ = {"schema": "MangaCoffee"}
    id = Column(Integer, primary_key=True)
    genre_id = Column("genreId", Integer, ForeignKey("Genres.id"), nullable=False)
    manga_id = Column("mangaId", Integer, ForeignKey("Mangas.id"), nullable=False)
    genre = relationship("Genre")
    manga = relationship("Manga", back_populates="genres")

# Tabulka RoomReservations
class RoomReservation(Base):
    __tablename__ = "RoomReservations"
    __table_args__ = {"schema": "MangaCoffee"}
    id = Column(Integer, primary_key=True)
    room_id = Column("roomId", Integer, ForeignKey("Rooms.id"), nullable=False)
    customer_id = Column("customerId", Integer, ForeignKey("Customers.id"), nullable=False)
    start_time = Column("startTime", DateTime, nullable=False)
    end_time = Column("endTime", DateTime, nullable=False)
    room = relationship("Room", back_populates="reservations")
    customer = relationship("Customer", back_populates="reservations")

# Tabulka Orders
class Order(Base):
    __tablename__ = "Orders"
    __table_args__ = {"schema": "MangaCoffee"}
    id = Column(Integer, primary_key=True)
    room_id = Column("roomId", Integer, ForeignKey("Rooms.id"), nullable=False)
    customer_id = Column("customerId", Integer, ForeignKey("Customers.id"), nullable=False)
    employee_id = Column("employeeId", Integer, ForeignKey("Employees.id"), nullable=False)
    order_date = Column("orderDate", DateTime, nullable=False)
    room = relationship("Room")
    customer = relationship("Customer", back_populates="orders")
    employee = relationship("Employee", back_populates="orders")

# Tabulka OrderItems
class OrderItem(Base):
    __tablename__ = "OrderItems"
    __table_args__ = {"schema": "MangaCoffee"}
    id = Column(Integer, primary_key=True)
    order_id = Column("orderId", Integer, ForeignKey("Orders.id"), nullable=False)
    item_id = Column("itemId", Integer, ForeignKey("Items.id"), nullable=False)
    manga_id = Column("mangaId", Integer, ForeignKey("Mangas.id"))
    quantity = Column(Integer, nullable=False)
    order = relationship("Order")
    item = relationship("Item")
    manga = relationship("Manga")
Session = sessionmaker(bind=engine)
session = Session()

# Příklad vytvoření tabulek (pokud nejsou vytvořeny)
#Base.metadata.create_all(engine)


mangaaaa = session.query(OrderItem).all()
for order in mangaaaa:
    print(order.manga_id)
session.commit()

print('///////////////////////////////////////////')
roles = session.query(Type).all()
for role in roles:
    print(role.name)
session.commit()

print('///////////////////////////////////////////')
new_type = Type(name = 'test')
session.add(new_type)
session.commit()
print('///////////////////////////////////////////')


roles = session.query(Type).all()
for role in roles:
    print(role.name)
session.commit()
type_to_delete = session.query(Type).filter_by(name="test").first()
print('///////////////////////////////////////////')
if type_to_delete:
    session.delete(type_to_delete)
    session.commit()
    print("Záznam byl smazán.")
else:
    print("Záznam s názvem 'test' nenalezen.")
print('///////////////////////////////////////////')


roles = session.query(Type).all()
for role in roles:
    print(role.name)
session.commit()
print('///////////////////////////////////////////')



order_id = 1
try:
    
    with session.begin():

        stmt = text("SELECT * FROM \"OrderItems\" WHERE \"orderId\" = :order_id FOR UPDATE")
        session.execute(stmt, {'order_id': order_id})

        total_price = session.query(
            func.sum(OrderItem.quantity * Item.cost).label("total_price")
        ).join(Item, OrderItem.item_id == Item.id).filter(OrderItem.order_id == order_id).scalar()

        print(f"Celková cena objednávky {order_id}: {total_price}")

    session.commit()

except SQLAlchemyError as e:
    print(f"Chyba při provádění transakce: {e}")
    session.rollback()

finally:
    session.close()
print('///////////////////////////////////////////')