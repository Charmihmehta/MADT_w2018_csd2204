MariaDB [(none)]> create database we2018;
ERROR 1007 (HY000): Can't create database 'we2018'; database exists
MariaDB [(none)]> CREATE DATABASE we2018;
ERROR 1007 (HY000): Can't create database 'we2018'; database exists
MariaDB [(none)]> use we2018;
Database changed
MariaDB [we2018]> CREATE TABLE Manufacturers ( Code INTEGER, Name VARCHAR(255),);CREATE TABLE Products ( Code INTEGER, Name VARCHAR(255), Price DECIMAL, Manufacturer INTEGER )[6:26 PM]INSERT INTO Manufacturers(Code,Name) VALUES(1,'Sony');INSERT INTO Manufacturers(Code,Name) VALUES(2,'Creative Labs');INSERT INTO Manufacturers(Code,Name) VALUES(3,'Hewlett-Packard');INSERT INTO Manufacturers(Code,Name) VALUES(4,'Iomega');INSERT INTO Manufacturers(Code,Name) VALUES(5,'Fujitsu');INSERT INTO Manufacturers(Code,Name) VALUES(6,'Winchester');
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ')' at line 1
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '[6:26 PM]INSERT INTO Manufacturers(Code,Name) VALUES(1,'Sony')' at line 1
ERROR 1146 (42S02): Table 'we2018.manufacturers' doesn't exist
ERROR 1146 (42S02): Table 'we2018.manufacturers' doesn't exist
ERROR 1146 (42S02): Table 'we2018.manufacturers' doesn't exist
ERROR 1146 (42S02): Table 'we2018.manufacturers' doesn't exist
ERROR 1146 (42S02): Table 'we2018.manufacturers' doesn't exist
MariaDB [we2018]> CREATE TABLE Manufacturers ( Code INTEGER, Name VARCHAR(255),);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ')' at line 1
MariaDB [we2018]> CREATE TABLE Manufacturers ( Code INTEGER, Name VARCHAR(255));
Query OK, 0 rows affected (0.23 sec)

MariaDB [we2018]> CREATE TABLE Products ( Code INTEGER, Name VARCHAR(255), Price DECIMAL, Manufacturer INTEGER );
ERROR 1050 (42S01): Table 'products' already exists
MariaDB [we2018]> INSERT INTO Manufacturers(Code,Name) VALUES(1,'Sony');INSERT INTO Manufacturers(Code,Name) VALUES(2,'Creative Labs');INSERT INTO Manufacturers(Code,Name) VALUES(3,'Hewlett-Packard');INSERT INTO Manufacturers(Code,Name) VALUES(4,'Iomega');INSERT INTO Manufacturers(Code,Name) VALUES(5,'Fujitsu');INSERT INTO Manufacturers(Code,Name) VALUES(6,'Winchester');
Query OK, 1 row affected (0.03 sec)

Query OK, 1 row affected (0.03 sec)

Query OK, 1 row affected (0.08 sec)

Query OK, 1 row affected (0.03 sec)

Query OK, 1 row affected (0.03 sec)

Query OK, 1 row affected (0.03 sec)



MariaDB [we2018]> CREATE TABLE Products ( Code INTEGER, Name VARCHAR(255), Price DECIMAL, Manufacturer INTEGER );
Query OK, 0 rows affected (0.25 sec)

MariaDB [we2018]> INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(1,'Hard drive',240,5);INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(2,'Memory',120,6);INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(3,'ZIP drive',150,4);INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(4,'Floppy disk',5,6);INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(5,'Monitor',240,1);INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(6,'DVD drive',180,2);INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(7,'CD drive',90,2);INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(8,'Printer',270,3);INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(9,'Toner cartridge',66,3);INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(10,'DVD burner',180,2);
Query OK, 1 row affected (0.05 sec)

Query OK, 1 row affected (0.04 sec)

Query OK, 1 row affected (0.08 sec)

Query OK, 1 row affected (0.03 sec)

Query OK, 1 row affected (0.03 sec)

Query OK, 1 row affected (0.03 sec)

Query OK, 1 row affected (0.02 sec)

Query OK, 1 row affected (0.03 sec)

Query OK, 1 row affected (0.03 sec)

Query OK, 1 row affected (0.03 sec)

MariaDB [we2018]> select * from products where manufacturer= any(select code from manufacturers where name like s%);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '%)' at line 1
MariaDB [we2018]> select * from products where manufacturer= any(select code from manufacturers where name like 's%');
+------+---------+-------+--------------+
| Code | Name    | Price | Manufacturer |
+------+---------+-------+--------------+
|    5 | Monitor |   240 |            1 |
+------+---------+-------+--------------+
1 row in set (0.00 sec)

MariaDB [we2018]> select * from products where manufacturer= (select code from manufacturers where name= 'sony');
+------+---------+-------+--------------+
| Code | Name    | Price | Manufacturer |
+------+---------+-------+--------------+
|    5 | Monitor |   240 |            1 |
+------+---------+-------+--------------+
1 row in set (0.00 sec)

MariaDB [we2018]> select *, @mname from products where manufacturer= (select code, @mname:= from manufacturers where name= 'sony');
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'from manufacturers where name= 'sony')' at line 1
MariaDB [we2018]> SELECT code,name from products, manufacturers where manufacturer=code;
ERROR 1052 (23000): Column 'code' in field list is ambiguous
MariaDB [we2018]> SELECT * FROM products, manufacturers;
+------+-----------------+-------+--------------+------+-----------------+
| Code | Name            | Price | Manufacturer | Code | Name            |
+------+-----------------+-------+--------------+------+-----------------+
|    1 | Hard drive      |   240 |            5 |    1 | Sony            |
|    1 | Hard drive      |   240 |            5 |    2 | Creative Labs   |
|    1 | Hard drive      |   240 |            5 |    3 | Hewlett-Packard |
|    1 | Hard drive      |   240 |            5 |    4 | Iomega          |
|    1 | Hard drive      |   240 |            5 |    5 | Fujitsu         |
|    1 | Hard drive      |   240 |            5 |    6 | Winchester      |
|    2 | Memory          |   120 |            6 |    1 | Sony            |
|    2 | Memory          |   120 |            6 |    2 | Creative Labs   |
|    2 | Memory          |   120 |            6 |    3 | Hewlett-Packard |
|    2 | Memory          |   120 |            6 |    4 | Iomega          |
|    2 | Memory          |   120 |            6 |    5 | Fujitsu         |
|    2 | Memory          |   120 |            6 |    6 | Winchester      |
|    3 | ZIP drive       |   150 |            4 |    1 | Sony            |
|    3 | ZIP drive       |   150 |            4 |    2 | Creative Labs   |
|    3 | ZIP drive       |   150 |            4 |    3 | Hewlett-Packard |
|    3 | ZIP drive       |   150 |            4 |    4 | Iomega          |
|    3 | ZIP drive       |   150 |            4 |    5 | Fujitsu         |
|    3 | ZIP drive       |   150 |            4 |    6 | Winchester      |
|    4 | Floppy disk     |     5 |            6 |    1 | Sony            |
|    4 | Floppy disk     |     5 |            6 |    2 | Creative Labs   |
|    4 | Floppy disk     |     5 |            6 |    3 | Hewlett-Packard |
|    4 | Floppy disk     |     5 |            6 |    4 | Iomega          |
|    4 | Floppy disk     |     5 |            6 |    5 | Fujitsu         |
|    4 | Floppy disk     |     5 |            6 |    6 | Winchester      |
|    5 | Monitor         |   240 |            1 |    1 | Sony            |
|    5 | Monitor         |   240 |            1 |    2 | Creative Labs   |
|    5 | Monitor         |   240 |            1 |    3 | Hewlett-Packard |
|    5 | Monitor         |   240 |            1 |    4 | Iomega          |
|    5 | Monitor         |   240 |            1 |    5 | Fujitsu         |
|    5 | Monitor         |   240 |            1 |    6 | Winchester      |
|    6 | DVD drive       |   180 |            2 |    1 | Sony            |
|    6 | DVD drive       |   180 |            2 |    2 | Creative Labs   |
|    6 | DVD drive       |   180 |            2 |    3 | Hewlett-Packard |
|    6 | DVD drive       |   180 |            2 |    4 | Iomega          |
|    6 | DVD drive       |   180 |            2 |    5 | Fujitsu         |
|    6 | DVD drive       |   180 |            2 |    6 | Winchester      |
|    7 | CD drive        |    90 |            2 |    1 | Sony            |
|    7 | CD drive        |    90 |            2 |    2 | Creative Labs   |
|    7 | CD drive        |    90 |            2 |    3 | Hewlett-Packard |
|    7 | CD drive        |    90 |            2 |    4 | Iomega          |
|    7 | CD drive        |    90 |            2 |    5 | Fujitsu         |
|    7 | CD drive        |    90 |            2 |    6 | Winchester      |
|    8 | Printer         |   270 |            3 |    1 | Sony            |
|    8 | Printer         |   270 |            3 |    2 | Creative Labs   |
|    8 | Printer         |   270 |            3 |    3 | Hewlett-Packard |
|    8 | Printer         |   270 |            3 |    4 | Iomega          |
|    8 | Printer         |   270 |            3 |    5 | Fujitsu         |
|    8 | Printer         |   270 |            3 |    6 | Winchester      |
|    9 | Toner cartridge |    66 |            3 |    1 | Sony            |
|    9 | Toner cartridge |    66 |            3 |    2 | Creative Labs   |
|    9 | Toner cartridge |    66 |            3 |    3 | Hewlett-Packard |
|    9 | Toner cartridge |    66 |            3 |    4 | Iomega          |
|    9 | Toner cartridge |    66 |            3 |    5 | Fujitsu         |
|    9 | Toner cartridge |    66 |            3 |    6 | Winchester      |
|   10 | DVD burner      |   180 |            2 |    1 | Sony            |
|   10 | DVD burner      |   180 |            2 |    2 | Creative Labs   |
|   10 | DVD burner      |   180 |            2 |    3 | Hewlett-Packard |
|   10 | DVD burner      |   180 |            2 |    4 | Iomega          |
|   10 | DVD burner      |   180 |            2 |    5 | Fujitsu         |
|   10 | DVD burner      |   180 |            2 |    6 | Winchester      |
+------+-----------------+-------+--------------+------+-----------------+
60 rows in set (0.00 sec)

MariaDB [we2018]> SELECT products.code, products.name, manufacturer, manufacturers.name from products, manufacturers where manufacturer= manufacturers.code;
+------+-----------------+--------------+-----------------+
| code | name            | manufacturer | name            |
+------+-----------------+--------------+-----------------+
|    1 | Hard drive      |            5 | Fujitsu         |
|    2 | Memory          |            6 | Winchester      |
|    3 | ZIP drive       |            4 | Iomega          |
|    4 | Floppy disk     |            6 | Winchester      |
|    5 | Monitor         |            1 | Sony            |
|    6 | DVD drive       |            2 | Creative Labs   |
|    7 | CD drive        |            2 | Creative Labs   |
|    8 | Printer         |            3 | Hewlett-Packard |
|    9 | Toner cartridge |            3 | Hewlett-Packard |
|   10 | DVD burner      |            2 | Creative Labs   |
+------+-----------------+--------------+-----------------+
10 rows in set (0.00 sec)

MariaDB [we2018]> SELECT P.CODE, P.NAME, MANUFACTURER, M.NAME FROM PRODUCTS AS P, MANUFACTURERS AS M WHERE MANUFACTURER=M.CODE;
+------+-----------------+--------------+-----------------+
| CODE | NAME            | MANUFACTURER | NAME            |
+------+-----------------+--------------+-----------------+
|    1 | Hard drive      |            5 | Fujitsu         |
|    2 | Memory          |            6 | Winchester      |
|    3 | ZIP drive       |            4 | Iomega          |
|    4 | Floppy disk     |            6 | Winchester      |
|    5 | Monitor         |            1 | Sony            |
|    6 | DVD drive       |            2 | Creative Labs   |
|    7 | CD drive        |            2 | Creative Labs   |
|    8 | Printer         |            3 | Hewlett-Packard |
|    9 | Toner cartridge |            3 | Hewlett-Packard |
|   10 | DVD burner      |            2 | Creative Labs   |
+------+-----------------+--------------+-----------------+
10 rows in set (0.00 sec)

MariaDB [we2018]> SELECT P.CODE, P.NAME, MANUFACTURER, M.NAME FROM PRODUCTS AS P, MANUFACTURERS AS M WHERE MANUFACTURER=M.CODE AND M.NAME='Creative Labs';
+------+------------+--------------+---------------+
| CODE | NAME       | MANUFACTURER | NAME          |
+------+------------+--------------+---------------+
|    6 | DVD drive  |            2 | Creative Labs |
|    7 | CD drive   |            2 | Creative Labs |
|   10 | DVD burner |            2 | Creative Labs |
+------+------------+--------------+---------------+
3 rows in set (0.00 sec)

MariaDB [we2018]> SELECT P.CODE, P.NAME, MANUFACTURER, M.NAME FROM PRODUCTS AS P, MANUFACTURERS AS M WHERE MANUFACTURER=M.CODE and manufacturers.name='Creative Labs';
ERROR 1054 (42S22): Unknown column 'manufacturers.name' in 'where clause'
MariaDB [we2018]> SELECT P.CODE, P.NAME, MANUFACTURER, M.NAME FROM PRODUCTS AS P, MANUFACTURERS AS M WHERE MANUFACTURER=M.CODE and manufacturer.name='Creative Labs';;
ERROR 1054 (42S22): Unknown column 'manufacturer.name' in 'where clause'
ERROR: No query specified

MariaDB [we2018]> INSERT INTO manufacturers values(7,'abc');
Query OK, 1 row affected (0.16 sec)

MariaDB [we2018]> SELECT P.CODE, P.NAME, MANUFACTURER, M.NAME FROM PRODUCTS AS P, MANUFACTURERS AS M WHERE MANUFACTURER=M.CODE;
+------+-----------------+--------------+-----------------+
| CODE | NAME            | MANUFACTURER | NAME            |
+------+-----------------+--------------+-----------------+
|    1 | Hard drive      |            5 | Fujitsu         |
|    2 | Memory          |            6 | Winchester      |
|    3 | ZIP drive       |            4 | Iomega          |
|    4 | Floppy disk     |            6 | Winchester      |
|    5 | Monitor         |            1 | Sony            |
|    6 | DVD drive       |            2 | Creative Labs   |
|    7 | CD drive        |            2 | Creative Labs   |
|    8 | Printer         |            3 | Hewlett-Packard |
|    9 | Toner cartridge |            3 | Hewlett-Packard |
|   10 | DVD burner      |            2 | Creative Labs   |
+------+-----------------+--------------+-----------------+
10 rows in set (0.00 sec)

MariaDB [we2018]> SELECT products.code, products.name, manufacturer, manufacturers.name from products INNER JOIN manufacturers ON manufacturer= manufacturers.code;
+------+-----------------+--------------+-----------------+
| code | name            | manufacturer | name            |
+------+-----------------+--------------+-----------------+
|    1 | Hard drive      |            5 | Fujitsu         |
|    2 | Memory          |            6 | Winchester      |
|    3 | ZIP drive       |            4 | Iomega          |
|    4 | Floppy disk     |            6 | Winchester      |
|    5 | Monitor         |            1 | Sony            |
|    6 | DVD drive       |            2 | Creative Labs   |
|    7 | CD drive        |            2 | Creative Labs   |
|    8 | Printer         |            3 | Hewlett-Packard |
|    9 | Toner cartridge |            3 | Hewlett-Packard |
|   10 | DVD burner      |            2 | Creative Labs   |
+------+-----------------+--------------+-----------------+
10 rows in set (0.00 sec)

MariaDB [we2018]> SELECT products.code, products.name, manufacturer, manufacturers.name from products OUTER JOIN manufacturers ON manufacturer= manufacturers.code;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'OUTER JOIN manufacturers ON manufacturer= manufacturers.code' at line 1
MariaDB [we2018]> SELECT products.code, products.name, manufacturer, manufacturers.name from products LEFT OUTER JOIN manufacturers ON manufacturer= manufacturers.code;
+------+-----------------+--------------+-----------------+
| code | name            | manufacturer | name            |
+------+-----------------+--------------+-----------------+
|    5 | Monitor         |            1 | Sony            |
|    6 | DVD drive       |            2 | Creative Labs   |
|    7 | CD drive        |            2 | Creative Labs   |
|   10 | DVD burner      |            2 | Creative Labs   |
|    8 | Printer         |            3 | Hewlett-Packard |
|    9 | Toner cartridge |            3 | Hewlett-Packard |
|    3 | ZIP drive       |            4 | Iomega          |
|    1 | Hard drive      |            5 | Fujitsu         |
|    2 | Memory          |            6 | Winchester      |
|    4 | Floppy disk     |            6 | Winchester      |
+------+-----------------+--------------+-----------------+
10 rows in set (0.00 sec)

MariaDB [we2018]> SELECT products.code, products.name, manufacturer, manufacturers.name from products RIGHT OUTER JOIN manufacturers ON manufacturer= manufacturers.code;
+------+-----------------+--------------+-----------------+
| code | name            | manufacturer | name            |
+------+-----------------+--------------+-----------------+
|    1 | Hard drive      |            5 | Fujitsu         |
|    2 | Memory          |            6 | Winchester      |
|    3 | ZIP drive       |            4 | Iomega          |
|    4 | Floppy disk     |            6 | Winchester      |
|    5 | Monitor         |            1 | Sony            |
|    6 | DVD drive       |            2 | Creative Labs   |
|    7 | CD drive        |            2 | Creative Labs   |
|    8 | Printer         |            3 | Hewlett-Packard |
|    9 | Toner cartridge |            3 | Hewlett-Packard |
|   10 | DVD burner      |            2 | Creative Labs   |
| NULL | NULL            |         NULL | abc             |
+------+-----------------+--------------+-----------------+
11 rows in set (0.00 sec)

MariaDB [we2018]> INSERT INTO products values(11,'xyz',400,);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ')' at line 1
MariaDB [we2018]> INSERT INTO products values(11,'xyz',400,null);
Query OK, 1 row affected (0.06 sec)

MariaDB [we2018]> SELECT products.code, products.name, manufacturer, manufacturers.name from products LEFT OUTER JOIN manufacturers ON manufacturer= manufacturers.code;
+------+-----------------+--------------+-----------------+
| code | name            | manufacturer | name            |
+------+-----------------+--------------+-----------------+
|    5 | Monitor         |            1 | Sony            |
|    6 | DVD drive       |            2 | Creative Labs   |
|    7 | CD drive        |            2 | Creative Labs   |
|   10 | DVD burner      |            2 | Creative Labs   |
|    8 | Printer         |            3 | Hewlett-Packard |
|    9 | Toner cartridge |            3 | Hewlett-Packard |
|    3 | ZIP drive       |            4 | Iomega          |
|    1 | Hard drive      |            5 | Fujitsu         |
|    2 | Memory          |            6 | Winchester      |
|    4 | Floppy disk     |            6 | Winchester      |
|   11 | xyz             |         NULL | NULL            |
+------+-----------------+--------------+-----------------+
11 rows in set (0.00 sec)

MariaDB [we2018]> SELECT products.code, products.name, manufacturer, manufacturers.name from products  OUTER JOIN manufacturers ON manufacturer= manufacturers.code;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'OUTER JOIN manufacturers ON manufacturer= manufacturers.code' at line 1
MariaDB [we2018]> SELECT products.code, products.name, manufacturer, manufacturers.name from products RIGHT OUTER JOIN manufacturers ON manufacturer= manufacturers.code;
+------+-----------------+--------------+-----------------+
| code | name            | manufacturer | name            |
+------+-----------------+--------------+-----------------+
|    1 | Hard drive      |            5 | Fujitsu         |
|    2 | Memory          |            6 | Winchester      |
|    3 | ZIP drive       |            4 | Iomega          |
|    4 | Floppy disk     |            6 | Winchester      |
|    5 | Monitor         |            1 | Sony            |
|    6 | DVD drive       |            2 | Creative Labs   |
|    7 | CD drive        |            2 | Creative Labs   |
|    8 | Printer         |            3 | Hewlett-Packard |
|    9 | Toner cartridge |            3 | Hewlett-Packard |
|   10 | DVD burner      |            2 | Creative Labs   |
| NULL | NULL            |         NULL | abc             |
+------+-----------------+--------------+-----------------+
11 rows in set (0.00 sec)

MariaDB [we2018]> CREATE TABLE Pieces ( Code INTEGER PRIMARY KEY, Name VARCHAR(25) NOT NULL );CREATE TABLE Providers ( Code VARCHAR(40) PRIMARY KEY,   Name VARCHAR(25) NOT NULL  );CREATE TABLE Provides ( Code INTEGER AUTO_INCREMENT, Piece INTEGER,  FOREIGN KEY (Piece) REFERENCES Pieces(Code), Provider VARCHAR(40),  FOREIGN KEY (Provider) REFERENCES Providers(Code),   Price INTEGER NOT NULL, PRIMARY KEY(Code, Piece, Provider), CHECK (Price > 10) );
Query OK, 0 rows affected (0.23 sec)

Query OK, 0 rows affected (0.30 sec)

Query OK, 0 rows affected (0.45 sec)

MariaDB [we2018]> INSERT INTO Providers(Code, Name) VALUES('HAL','Clarke Enterprises');INSERT INTO Providers(Code, Name) VALUES('RBT','Susan Calvin Corp.');INSERT INTO Providers(Code, Name) VALUES('TNBC','Skellington Supplies');INSERT INTO Pieces(Code, Name) VALUES(1,'Sprocket');INSERT INTO Pieces(Code, Name) VALUES(2,'Screw');INSERT INTO Pieces(Code, Name) VALUES(3,'Nut');INSERT INTO Pieces(Code, Name) VALUES(4,'Bolt');INSERT INTO Provides(Piece, Provider, Price) VALUES(1,'HAL',10);INSERT INTO Provides(Piece, Provider, Price) VALUES(1,'RBT',15);INSERT INTO Provides(Piece, Provider, Price) VALUES(2,'HAL',20);INSERT INTO Provides(Piece, Provider, Price) VALUES(2,'RBT',15);INSERT INTO Provides(Piece, Provider, Price) VALUES(2,'TNBC',14);INSERT INTO Provides(Piece, Provider, Price) VALUES(3,'RBT',50);INSERT INTO Provides(Piece, Provider, Price) VALUES(3,'TNBC',45);INSERT INTO Provides(Piece, Provider, Price) VALUES(4,'HAL',5);INSERT INTO Provides(Piece, Provider, Price) VALUES(4,'RBT',7);
Query OK, 1 row affected (0.05 sec)

Query OK, 1 row affected (0.05 sec)

Query OK, 1 row affected (0.03 sec)

Query OK, 1 row affected (0.09 sec)

Query OK, 1 row affected (0.02 sec)

Query OK, 1 row affected (0.05 sec)

Query OK, 1 row affected (0.05 sec)

Query OK, 1 row affected (0.02 sec)

Query OK, 1 row affected (0.03 sec)

Query OK, 1 row affected (0.02 sec)

Query OK, 1 row affected (0.02 sec)

Query OK, 1 row affected (0.01 sec)

Query OK, 1 row affected (0.03 sec)

Query OK, 1 row affected (0.03 sec)

Query OK, 1 row affected (0.02 sec)

Query OK, 1 row affected (0.05 sec)

MariaDB [we2018]> show tables;
+------------------+
| Tables_in_we2018 |
+------------------+
| manufacturers    |
| manufactures     |
| pieces           |
| products         |
| providers        |
| provides         |
+------------------+
6 rows in set (0.00 sec)

MariaDB [we2018]> select 8 from pieces;
+---+
| 8 |
+---+
| 8 |
| 8 |
| 8 |
| 8 |
+---+
4 rows in set (0.00 sec)

MariaDB [we2018]> select * from pieces;
+------+----------+
| Code | Name     |
+------+----------+
|    1 | Sprocket |
|    2 | Screw    |
|    3 | Nut      |
|    4 | Bolt     |
+------+----------+
4 rows in set (0.02 sec)

MariaDB [we2018]> select * from providers;
+------+----------------------+
| Code | Name                 |
+------+----------------------+
| HAL  | Clarke Enterprises   |
| RBT  | Susan Calvin Corp.   |
| TNBC | Skellington Supplies |
+------+----------------------+
3 rows in set (0.00 sec)

MariaDB [we2018]> select * from provides;
+------+-------+----------+-------+
| Code | Piece | Provider | Price |
+------+-------+----------+-------+
|    1 |     1 | HAL      |    10 |
|    2 |     1 | RBT      |    15 |
|    3 |     2 | HAL      |    20 |
|    4 |     2 | RBT      |    15 |
|    5 |     2 | TNBC     |    14 |
|    6 |     3 | RBT      |    50 |
|    7 |     3 | TNBC     |    45 |
|    8 |     4 | HAL      |     5 |
|    9 |     4 | RBT      |     7 |
+------+-------+----------+-------+
9 rows in set (0.00 sec)

MariaDB [we2018]> select provider from provides where piece=1;
+----------+
| provider |
+----------+
| HAL      |
| RBT      |
+----------+
2 rows in set (0.00 sec)

MariaDB [we2018]> select name from providers where code IN(select provider from provides where piece=1); 
+--------------------+
| name               |
+--------------------+
| Clarke Enterprises |
| Susan Calvin Corp. |
+--------------------+
2 rows in set (0.00 sec)

MariaDB [we2018]> select providers.name from providers INNER JOIN provides ON PROVIDER=PROVIDERS.CODE;
+----------------------+
| name                 |
+----------------------+
| Clarke Enterprises   |
| Clarke Enterprises   |
| Clarke Enterprises   |
| Susan Calvin Corp.   |
| Susan Calvin Corp.   |
| Susan Calvin Corp.   |
| Susan Calvin Corp.   |
| Skellington Supplies |
| Skellington Supplies |
+----------------------+
9 rows in set (0.00 sec)

MariaDB [we2018]> select providers.name from providers INNER JOIN provides ON PROVIDERS.CODE=1;
Empty set, 3 warnings (0.00 sec)

MariaDB [we2018]> select providers.name from providers INNER JOIN provides ON PROVIDES.PIECE=1;
+----------------------+
| name                 |
+----------------------+
| Clarke Enterprises   |
| Clarke Enterprises   |
| Susan Calvin Corp.   |
| Susan Calvin Corp.   |
| Skellington Supplies |
| Skellington Supplies |
+----------------------+
6 rows in set (0.00 sec)

MariaDB [we2018]> select providers.name from providers INNER JOIN provides ON PIECE=1;
+----------------------+
| name                 |
+----------------------+
| Clarke Enterprises   |
| Clarke Enterprises   |
| Susan Calvin Corp.   |
| Susan Calvin Corp.   |
| Skellington Supplies |
| Skellington Supplies |
+----------------------+
6 rows in set (0.00 sec)

MariaDB [we2018]> select providers.name from providers INNER JOIN PROVIDERS.CODE=provides.PROVIDES ON PIECE=1;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '.PROVIDES ON PIECE=1' at line 1
MariaDB [we2018]> select providers.name from providers INNER JOIN PROVIDES PROVIDERS.CODE=provides.PROVIDES ON PIECE=1;
ERROR 1066 (42000): Not unique table/alias: 'PROVIDERS'
MariaDB [we2018]> select providers.name from providers INNER JOIN PROVIDES PROVIDERS.CODE=provides.PROVIDES ON PIECE=1;
ERROR 1066 (42000): Not unique table/alias: 'PROVIDERS'
MariaDB [we2018]> select p.name from providers p inner join provides pr on p.code=pr.provider where pr.piece=1;
+--------------------+
| name               |
+--------------------+
| Clarke Enterprises |
| Susan Calvin Corp. |
+--------------------+
2 rows in set (0.00 sec)

MariaDB [we2018]> SELECT PIECE FROM PROVIDES WHERE PROVIDER='hal';
+-------+
| PIECE |
+-------+
|     1 |
|     2 |
|     4 |
+-------+
3 rows in set (0.00 sec)

MariaDB [we2018]> SELECT NAME FROM PIECES WHERE CODE=(SELECT PIECE FROM PROVIDES WHERE PROVIDER='hal');
ERROR 1242 (21000): Subquery returns more than 1 row
MariaDB [we2018]> SELECT NAME FROM PIECES WHERE CODE IN(SELECT PIECE FROM PROVIDES WHERE PROVIDER='hal');
+----------+
| NAME     |
+----------+
| Sprocket |
| Screw    |
| Bolt     |
+----------+
3 rows in set (0.00 sec)

MariaDB [we2018]> SELECT PIECES.NAME FROM PIECES INNER JOIN PROVIDES ON PIECES.CODE=PROVIDES.PIECE WHERE PROVIDES.PROVIDER='HAL';
+----------+
| NAME     |
+----------+
| Sprocket |
| Screw    |
| Bolt     |
+----------+
3 rows in set (0.00 sec)

MariaDB [we2018]> SELECT PIECES.NAME , PROVIDERS.NAME, PROVIDES.PRICE FROM PIECES INNER JOIN  PROVIDES  ON PIECES.CODE=PROVIDES.PIECE ; 
ERROR 1054 (42S22): Unknown column 'PROVIDERS.NAME' in 'field list'
MariaDB [we2018]> SELECT PIECES.NAME , PROVIDES.PRICE FROM PIECES INNER JOIN  PROVIDES  ON PIECES.CODE=PROVIDES.PIECE ; 
+----------+-------+
| NAME     | PRICE |
+----------+-------+
| Sprocket |    10 |
| Sprocket |    15 |
| Screw    |    20 |
| Screw    |    15 |
| Screw    |    14 |
| Nut      |    50 |
| Nut      |    45 |
| Bolt     |     5 |
| Bolt     |     7 |
+----------+-------+
9 rows in set (0.00 sec)

MariaDB [we2018]> SELECT PIECES.NAME ,PIECES.CODE, PROVIDERS.NAME, PROVIDES.PRICE FROM PIECES  JOIN  PROVIDES  ON PIECES.CODE=PROVIDES.PIECE JOIN PROVIDES ON PROVIDES.PROVIDER=PROVIDERS.CODE GROUP BY PIECES.CODE ; 
ERROR 1066 (42000): Not unique table/alias: 'PROVIDES'
MariaDB [we2018]> SELECT PIECES.NAME ,PIECES.CODE, PROVIDERS.NAME, PROVIDES.PRICE FROM PIECES  JOIN  PROVIDES  ON PIECES.CODE=PROVIDES.PIECE JOIN PROVIDES ON PROVIDES PROVIDER=PROVIDERS.CODE GROUP BY PIECES.CODE ; 
ERROR 1066 (42000): Not unique table/alias: 'PROVIDES'
MariaDB [we2018]> SELECT PIECES.NAME ,PIECES.CODE, PROVIDERS.NAME, PROVIDES.PRICE FROM PIECES  JOIN  PROVIDES  ON PIECES.CODE=PROVIDES.PIECE JOIN PROVIDERS ON PROVIDES.PROVIDER=PROVIDERS.CODE GROUP BY PIECES.CODE ; 
+----------+------+--------------------+-------+
| NAME     | CODE | NAME               | PRICE |
+----------+------+--------------------+-------+
| Sprocket |    1 | Clarke Enterprises |    10 |
| Screw    |    2 | Clarke Enterprises |    20 |
| Nut      |    3 | Susan Calvin Corp. |    50 |
| Bolt     |    4 | Clarke Enterprises |     5 |
+----------+------+--------------------+-------+
4 rows in set (0.00 sec)

MariaDB [we2018]> SELECT Pieces.Name, Providers.Name, Price FROM Pieces INNER JOIN Provides ON Pieces.Code = Piece             INNER JOIN Providers ON Providers.Code = Provider WHERE Price = (   SELECT MAX(Price) FROM Provides   WHERE Piece = Pieces.Code );
+----------+--------------------+-------+
| Name     | Name               | Price |
+----------+--------------------+-------+
| Sprocket | Susan Calvin Corp. |    15 |
| Screw    | Clarke Enterprises |    20 |
| Nut      | Susan Calvin Corp. |    50 |
| Bolt     | Susan Calvin Corp. |     7 |
+----------+--------------------+-------+
4 rows in set (0.00 sec)

MariaDB [we2018]>  SELECT Pieces.Name, Providers.Name, Price FROM Pieces INNER JOIN Provides ON Pieces.Code = Piece;
ERROR 1054 (42S22): Unknown column 'Providers.Name' in 'field list'
MariaDB [we2018]>  SELECT Pieces.Name, Price FROM Pieces INNER JOIN Provides ON Pieces.Code = Piece;
+----------+-------+
| Name     | Price |
+----------+-------+
| Sprocket |    10 |
| Sprocket |    15 |
| Screw    |    20 |
| Screw    |    15 |
| Screw    |    14 |
| Nut      |    50 |
| Nut      |    45 |
| Bolt     |     5 |
| Bolt     |     7 |
+----------+-------+
9 rows in set (0.00 sec)

