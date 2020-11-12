CREATE DATABASE PetShop;

USE PetShop;
if OBJECT_ID('tempdb..Rasa') is not null
 drop table Rasa
CREATE TABLE Rasa 
(
	Kategorija varchar(50),
	Rasa varchar(50),
	ZivotinjaID int,
	UsvajanjeID1 int

);


INSERT INTO Rasa VALUES ('psi za čuvanje zaštitu i pratnju', 'Rotvajler',1,1);
INSERT INTO Rasa VALUES('Hrtovi','Hrt', 2,2);
INSERT INTO Rasa VALUES('psi za čuvanje zaštitu i pratnju','Snaucer',3,3)
INSERT INTO Rasa VALUES('Ovcari','Nemacki ovcar', 4,4);
INSERT INTO Rasa VALUES('psi za čuvanje zaštitu i pratnju','Patuljasti pinc', 5,5);
DELETE FROM Rasa WHERE ZivotinjaID =4;
SELECT * FROM Rasa

if OBJECT_ID('tempdb..Zivotinja') is not null
 drop table Zivotinja
CREATE TABLE Zivotinja
(
	ZivotinjaId int not null,
	Ime varchar(4000),
	Kategorija varchar(50) not null,
	Rasa varchar(50) not null,
	DatumRodjenja date,
	Pol varchar(15),
	Registrovan char(1) not null,
	Boja varchar(20),
	UsvajanjeID int not null,
	ProdajaID int not null,


);
INSERT INTO Zivotinja VALUES(1,'Luna', 'Psi za drustvo', 'Mesanac', '1.8.2015','z', 'f', 'braon',1,1);
INSERT INTO Zivotinja VALUES(2,'Maks', 'Psi za drustvo', 'Labrador','3.22.2012','m', 'f', 'zuta',2,2);
INSERT INTO Zivotinja VALUES(3,'Miroslav', 'Psi za drustvo', 'Labrador','4.22.2012','m', 'f', 'zuta',3,3);
INSERT INTO Zivotinja VALUES(4,'Hektor', 'Ovcar', 'Nemacki ovcar','4.24.2014','m', 'f', 'braon',4,4);
INSERT INTO Zivotinja VALUES(5,'Leo', 'Psi za drustvo', 'Mesanac','4.26.2014','m', 'f', 'braon',5,5);
SELECT * FROM Zivotinja

if OBJECT_ID('tempdb..Prodaja') is not null
 drop table Prodaja
CREATE TABLE Prodaja
(
	ProdajaID int not null unique,
	ProdajaDatum date not null,
	ZaposleniID int not null,
	KupacID int not null,
	PorezNaPromet float

);

INSERT INTO Prodaja VALUES(1,'5.5.2020',1,1,450.5);
INSERT INTO Prodaja VALUES(2,'6.5.2020',2,2,550.5);
INSERT INTO Prodaja VALUES(3,'7.5.2020',3,3,250.5);
INSERT INTO Prodaja VALUES(4,'8.5.2020',4,4,250.5);
INSERT INTO Prodaja VALUES(5,'10.5.2020',5,5,350.5);
SELECT * FROM Prodaja
if OBJECT_ID('tempdb..Kupac') is not null
 drop table Kupac
CREATE TABLE Kupac
(
	KupacID int PRIMARY KEY IDENTITY (1,1),
	BrojTelefona bigint not null,
	Ime varchar(50) not null,
	Prezime varchar(50) not null,
	Adresa varchar(50),
	PostanskiBroj numeric(17),
	GradID int not null

);
INSERT INTO Kupac VALUES(3324555, 'Pera', 'Peric', 'Vizeljska 14', 11211, 1);
INSERT INTO Kupac VALUES(3324552, 'Milos', 'Peric', 'Kombinatova 12', 11211, 1);
INSERT INTO Kupac VALUES(3324533, 'Milan', 'Nikolic', 'Kombinatova 18', 11211, 1);
INSERT INTO Kupac VALUES(3324512, 'Milutin', 'Nikolic', 'Kombinatova 18', 11211, 1);
INSERT INTO Kupac VALUES(3324444, 'Nikola', 'Petrovic', 'Drinske divizije', 11211, 1);
SELECT * FROM Kupac

if OBJECT_ID('tempdb..PredmetProdaje') is not null
 drop table PredmetProdaje
CREATE TABLE PredmetProdaje
(
	ProdajaID int not null,
	PredmetID int not null,
	Kvantitet int not null,
	ProdajnaCena float
);
INSERT INTO PredmetProdaje VALUES (1,1,1,3334.44);
INSERT INTO PredmetProdaje VALUES (2,2,5,4334.4);
INSERT INTO PredmetProdaje VALUES (3,3,5,9.4);
INSERT INTO PredmetProdaje VALUES (4,4,7,900.4);
INSERT INTO PredmetProdaje VALUES (5,5,10,1400.4);
--DELETE FROM PredmetProdaje WHERE ProdajnaCena=9.4;
SELECT * FROM PredmetProdaje;
GO

SELECT Kvantitet, ProdajnaCena * 1.07 AS CustomerPays  
    FROM dbo.PredmetProdaje
GO 
if OBJECT_ID('tempdb..Dobavljac') is not null
 drop table Dobavljac
CREATE TABLE Dobavljac
(
	DobavljacID int PRIMARY KEY IDENTITY(1,1),
	Ime varchar(50) not null,
	KontaktIme varchar(60),
	Telefon bigint not null,
	Adresa varchar(60),
	PostanskiKod numeric(17),
	GradID int not null
);
INSERT INTO Dobavljac VALUES('Milos','Misa', 3322456, 'Kosovska 12', 11000, 1);
INSERT INTO Dobavljac VALUES('Petar','Perica', 3322454, 'Kosovska 18', 11000, 1);
INSERT INTO Dobavljac VALUES('Milica','Milica', 3211432, 'Cvijiceva 14', 11000,1);
INSERT INTO Dobavljac VALUES('Nikola','Nikola', 3322453, 'Bulevar Despota Stefana 54', 11000, 1);
INSERT INTO Dobavljac VALUES('Milan','Milan', 3322452, 'Bulevar Despota Stefana 50', 11000, 1);
SELECT * FROM Dobavljac
DELETE FROM Dobavljac WHERE DobavljacID=3;

SELECT DobavljacID, Ime, KontaktIme, Telefon
    FROM dbo.Dobavljac 
    WHERE DobavljacID < 2  
GO  
if OBJECT_ID('tempdb..Roba') is not null
 drop table Roba
CREATE TABLE Roba
(
	PredmetID int PRIMARY KEY IDENTITY(1,1),
	Opis varchar(100),
	Kolicina int not null,
	Cenovnik float(5) not null,
	Kategorija varchar(40),

);
INSERT INTO Roba VALUES('Ovo je roba1', 55, 5000.0,'Hrana');
INSERT INTO Roba VALUES('Ovo je roba2', 65, 6000.0,'Hrana');
INSERT INTO Roba VALUES('Ovo je roba3', 35, 3000.0,'Igracke');
INSERT INTO Roba VALUES('Ovo je roba4', 25, 2000.0,'Igracke');
INSERT INTO Roba VALUES('Ovo je roba5', 15, 1000.0,'Oprema');
SELECT * FROM Roba
SELECT PredmetID, Opis, Cenovnik, Kolicina 
    FROM dbo.Roba 
    WHERE PredmetID < 2  
GO  

if OBJECT_ID('tempdb..PredmetPorudzbine') is not null
 drop table PredmetPorudzbine
CREATE TABLE PredmetPorudzbine
(
	POBroj int not null,
	PredmetID int not null,
	Kvantitet int not null,
	Cena float
);
INSERT INTO PredmetPorudzbine VALUES(12, 2,54, NULL );
INSERT INTO PredmetPorudzbine VALUES(13, 3,53, 500 );
INSERT INTO PredmetPorudzbine VALUES(14, 4,52, 400 );
INSERT INTO PredmetPorudzbine VALUES(15, 5,51, 300 );
INSERT INTO PredmetPorudzbine VALUES(16, 6,33, 300 );
SELECT * FROM PredmetPorudzbine

if OBJECT_ID('tempdb..PorudzbinaRobe') is not null
 drop table PorudzbinaRobe
CREATE TABLE PorudzbinaRobe
(
	POBroj int PRIMARY KEY IDENTITY(1,1),
	DatumPorudzbine DATE,
	DatumPrimanja DATE,
	DobavljacID int not null,
	ZaposleniID int not null,
	Postarina float
);
INSERT INTO PorudzbinaRobe VALUES('10.12.2019','10.1.2020',1,1,50.4);
INSERT INTO PorudzbinaRobe VALUES('12.15.2019','1.15.2020',2,2,50.4);
INSERT INTO PorudzbinaRobe VALUES('11.15.2019','1.14.2020',3,3,50.4);
INSERT INTO PorudzbinaRobe VALUES('11.15.2019','1.14.2020',4,4,50.4);
INSERT INTO PorudzbinaRobe VALUES('12.15.2019','1.12.2020',5,5,50.4);
SELECT * FROM PorudzbinaRobe

/*CREATE TABLE Dobavljac1
(
	DobavljacID int PRIMARY KEY IDENTITY(1,1),
	Ime varchar(50) not null,
	KontaktIme varchar(60),
	Telefon bigint not null,
	Adresa varchar(60),
	PostanskiKod numeric(17),
	GradID int not null
);
INSERT INTO Dobavljac1 VALUES('Mika','Miki',3324567,'Kneza Milosa 10', 11000, 1);
SELECT * FROM Dobavljac1;*/

if OBJECT_ID('tempdb..Grad') is not null
 drop table Grad
CREATE TABLE Grad
(
	GradID int PRIMARY KEY IDENTITY(1,1),
	PostanskiBroj bigint not null,
	Grad varchar(500),
	Opstina varchar(500),
	Regija varchar(500),
	Drzava varchar(500) not null
);
INSERT INTO Grad VALUES(11211, 'Beograd', 'Palilula', 'Centralna Srbija', 'Srbija');
INSERT INTO Grad VALUES(18000, 'Nis', 'null', 'Juzna Srbija', 'Srbija');
INSERT INTO Grad VALUES(21000, 'Novi Sad', 'null', 'Vojvodina', 'Srbija');
INSERT INTO Grad VALUES(34000, 'Kragujevac', 'null', 'Sumadijski okrug', 'Srbija');
INSERT INTO Grad VALUES(18300, 'Pirot', 'null', 'Juzna Srbija', 'Srbija');

SELECT * FROM Grad;

if OBJECT_ID('tempdb..Zaposleni') is not null
 drop table Zaposleni
CREATE TABLE Zaposleni
(
	ZaposleniID int PRIMARY KEY IDENTITY(1,1),
	Prezime varchar(50) not null,
	Ime varchar(50) not null,
	BrojTelefona bigint not null,
	GradID int not null,
	DatumZaposlenja date not null,
	DatumOtpustanja date not null,
	MenadzerID int not null,
	NivoZaposlenog varchar(50) not null,
	Naziv varchar(60) not null

);
INSERT INTO Zaposleni VALUES('Nikolic','Petar',3324678, 1, '3-3-2018', '4-4-2020', 1,'DrugiNivo','Prodavac');
INSERT INTO Zaposleni VALUES('Nikolic','Milos',3324678, 1, '3-2-2018', '4-6-2020', 2,'DrugiNivo','Prodavac');
INSERT INTO Zaposleni VALUES('Petrovic','Nikola',3324673, 1, '3-3-2016', '4-7-2020', 2,'DrugiNivo','Prodavac');
INSERT INTO Zaposleni VALUES('Milutinovic','Milena',332422, 1, '4-4-2018', '4-6-2019', 1,'DrugiNivo','Prodavac');
INSERT INTO Zaposleni VALUES('Peric','Vera',3324222, 1, '3-1-2017', '4-6-2020', 1,'DrugiNivo','Prodavac');
SELECT * FROM Zaposleni

if OBJECT_ID('tempdb..Kategorija') is not null
 drop table Kategorija
CREATE TABLE Kategorija
(
	Kategorija varchar(50) PRIMARY KEY,
	Registracija varchar(50) not null
);

INSERT INTO Kategorija VALUES('Ovcarski psi', '555');
INSERT INTO Kategorija VALUES('Psi za drustvo', '556');
INSERT INTO Kategorija VALUES('Hrtovi', '557');
INSERT INTO Kategorija VALUES('Lovacki psi', '558');
INSERT INTO Kategorija VALUES('Psi za čuvanje zaštitu i pratnju', '559');
SELECT * FROM Kategorija;

if OBJECT_ID('tempdb..GrupaZaUsvajanje') is not null
 drop table GrupaZaUsvajanje
CREATE TABLE GrupaZaUsvajanje
(
	UsvajanjeID  int PRIMARY KEY IDENTITY(1,1),
	LegloUsvajanja varchar(50) not null,
	KontaktIme varchar(50) not null,
	KontaktTelefon bigint not null
);

INSERT INTO GrupaZaUsvajanje VALUES
('Mesanci', 'Ana',3327878);
INSERT INTO GrupaZaUsvajanje VALUES
('Mesanci', 'Petar',3327874);
INSERT INTO GrupaZaUsvajanje VALUES
('Mesanci', 'Milica',3327872);
INSERT INTO GrupaZaUsvajanje VALUES
('Mesanci', 'Milos',3327871);
INSERT INTO GrupaZaUsvajanje VALUES
('Mesanci', 'Milena',3327833);
SELECT * FROM GrupaZaUsvajanje


INSERT INTO Zivotinja VALUES (6,'Hak', 'Psi za drustvo', 'Mesanac','4.26.2012','m', 'f', 'braon-bela',6,6);
