CREATE DATABASE bd_Graficos;

USE bd_Graficos;

CREATE TABLE Venta(
idVenta int primary key,
numeroVenta varchar(40),
documentoCliente varchar(15),
nombreCliente varchar(40),
subTotal decimal(10,2),
impuestoTotal decimal(10,2),
total decimal(10,2),
fechaRegistro datetime default getdate()
);
 
CREATE TABLE DetalleVenta(
idDetalleVenta int primary key identity(1,1),
idVenta int references Venta(idVenta),
nombreProducto varchar(50),
cantidad int,
precio decimal(10,2),
total decimal(10,2)
); 

INSERT INTO Venta(idVenta, numeroVenta, documentoCliente, nombreCliente, subTotal, impuestoTotal, total, fechaRegistro) VALUES
(1,'000001','5435','Thalia','677.97','122.03','800.00',DATEADD(DAY,-5,GETDATE())),
(2,'000002','8989','Juan','3728.81','671.19','4400.00',DATEADD(DAY,-5,GETDATE())),
(3,'000003','898989','Oscar','805.08','144.92','950.00',DATEADD(DAY,-5,GETDATE())),
(4,'000004','8963','Jhon','677.97','122.03','800.00',DATEADD(DAY,-4,GETDATE())),
(5,'000005','909090','Marisol','1355.93','244.07','1600.00',DATEADD(DAY,-3,GETDATE())),
(6,'000006','77678','Marisol','2457.63','442.37','2900.00',DATEADD(DAY,-3,GETDATE())),
(7,'000007','7888','Kumiko','169.49','30.51','200.00',DATEADD(DAY,-2,GETDATE())),
(8,'000008','887866','Amelie','1186.44','213.56','1400.00',DATEADD(DAY,-2,GETDATE())),
(9,'000009','757578','Hiroko','889.83','160.17','1050.00',DATEADD(DAY,-2,GETDATE())),
(10,'000010','1112223','Sheyla','169.49','30.51','200.00',DATEADD(DAY,-2,GETDATE())),
(11,'000011','87856','Jose','1779.66','320.34','2100.00',DATEADD(DAY,-1,GETDATE())),
(12,'000012','3453434','Maria','1864.41','335.59','2200.00',DATEADD(DAY,-1,GETDATE())),
(13,'000013','44388','Sara','1144.07','205.93','1350.00',DATEADD(DAY,-1,GETDATE())),
(14,'000014','78789990','Jhon Smith','1313.56','236.44','1550.00',DATEADD(DAY,0,GETDATE())),
(15,'000015','89877788','Perla','169.49','30.51','200.00',DATEADD(DAY,0,GETDATE()))


INSERT INTO DetalleVenta(idVenta,nombreProducto,cantidad,precio,total) VALUES
(1,'teclado seisen gamer',1,'800.00','800.00'),
(2,'laptop lenovo idea pad',2,'2200.00','4400.00'),
(3,'auricular redragon rgb',1,'950.00','950.00'),
(4,'teclado seisen gamer',1,'800.00','800.00'),
(5,'teclado seisen gamer',2,'800.00','1600.00'),
(6,'ventilador cooler master',2,'200.00','400.00'),
(6,'laptop samsung book pro',1,'2500.00','2500.00'),
(7,'ventilador cooler master',1,'200.00','200.00'),
(8,'monitor samsung curvo',1,'1400.00','1400.00'),
(9,'monitor teros gaming te-2',1,'1050.00','1050.00'),
(10,'mini ventilador lenono',1,'200.00','200.00'),
(11,'laptop asus zenbook duo',1,'2100.00','2100.00'),
(12,'laptop lenovo idea pad',1,'2200.00','2200.00'),
(13,'monitor huawei gamer',1,'1350.00','1350.00'),
(14,'mini ventilador lenono',1,'200.00','200.00'),
(14,'monitor huawei gamer',1,'1350.00','1350.00'),
(15,'memoria kingston rgb',1,'200.00','200.00')

SELECT * FROM DetalleVenta;