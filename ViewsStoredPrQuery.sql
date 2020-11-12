

USE PetShop
GO

CREATE VIEW vw_Rasa 
AS 
SELECT Kategorija,Rasa FROM Rasa
GO
SELECT * FROM vw_Rasa;
GO

CREATE VIEW vw_ImeZivotinja
AS 
SELECT Ime,Kategorija FROM Zivotinja;
GO

SELECT * FROM vw_ImeZivotinja
GO

CREATE VIEW vw_Prodaja
AS
SELECT ProdajaDatum, PorezNaPromet FROM Prodaja
GO


SELECT * FROM vw_Prodaja
GO

CREATE VIEW vw_Kupac
AS 
SELECT BrojTelefona,Ime,Prezime,Adresa FROM Kupac
GO

SELECT * FROM vw_Kupac
GO

CREATE VIEW vw_PredmetProdaje
AS 
SELECT Kvantitet,ProdajnaCena FROM PredmetProdaje
GO

SELECT * FROM vw_PredmetProdaje
GO

CREATE VIEW vw_Dobavljac 
AS
SELECT Ime,Telefon,Adresa FROM Dobavljac
GO

SELECT * FROM vw_Dobavljac
GO

CREATE PROCEDURE pr_PredmetProdaje @VarPrice money  
   AS  
   BEGIN  
        
      PRINT 'Products less than ' + CAST(@VarPrice AS varchar(10));  
      
      SELECT Kvantitet,ProdajnaCena FROM vw_PredmetProdaje
            WHERE ProdajnaCena < @varPrice;  
   END  
GO

EXECUTE pr_PredmetProdaje 10.00;  
GO  
EXECUTE pr_PredmetProdaje 1000.00;  
GO  

CREATE PROCEDURE pr_Prodaja @VarPorez money  
   AS  
   BEGIN  
      
      PRINT 'Porez manji od ' + CAST(@VarPorez AS varchar(10));  
      
      SELECT ProdajaDatum,PorezNaPromet FROM vw_Prodaja
            WHERE PorezNaPromet < @varPorez;  
   END  
GO
EXECUTE pr_Prodaja 500.00;  
GO  


