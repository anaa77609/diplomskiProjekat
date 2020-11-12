SELECT MAX(PorezNaPromet) AS NajveciPorez
FROM dbo.Prodaja;  
GO     

SELECT MAX(Ime) AS NajduzeIme
FROM dbo.Zivotinja WHERE ZivotinjaId < 5;
GO

SELECT MIN(PorezNaPromet)  AS NajmanjiPorez
FROM dbo.Prodaja; 
GO  

SELECT MIN(Ime) AS NajkraceIme
FROM dbo.Zivotinja WHERE ZivotinjaId<5;
GO

SELECT DISTINCT MIN(ProdajnaCena)  AS NajmanjaProdajnaCena
FROM dbo.PredmetProdaje 
WHERE ProdajaID IN ('1', '2', '3');  

SELECT  SUM(Cena) AS UkupnaCena
FROM dbo.PredmetPorudzbine
WHERE Kvantitet IS NOT NULL   
    AND Cena != 0.00   


     
SELECT AVG(Cenovnik)AS 'Prosecna cena robe',   
     SUM(Kolicina) AS 'Ukupna kolicina robe'
FROM Roba 
WHERE Opis LIKE 'Ovo%'; 

SELECT COUNT(*)  BrojRedova
FROM dbo.Zivotinja;

SELECT Kategorija,   
       COUNT(Kolicina)AS Kolicina 
FROM dbo.Roba  
GROUP BY Kategorija 
HAVING COUNT(Kolicina) > 1;  


