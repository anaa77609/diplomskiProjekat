USE PetShop;
GO
SELECT KupacID, GradID
FROM Kupac
WHERE KupacID IN
    (SELECT KupacID
     FROM Kupac
     WHERE GradID = 1);
GO


SELECT pp.Kvantitet, p.PorezNaPromet
FROM PredmetProdaje pp
INNER JOIN Prodaja p
ON p.ProdajaID = pp.ProdajaID
AND pp.Kvantitet = 5;
GO


SELECT Kategorija
FROM Rasa
WHERE ZivotinjaId NOT IN
    (SELECT ZivotinjaId
     FROM Zivotinja
     WHERE Ime = 'Luna' 
        OR Ime = 'Maks');
        
GO

UPDATE PredmetProdaje
SET ProdajnaCena = ProdajnaCena * 2
FROM PredmetProdaje AS pp
INNER JOIN Prodaja AS p
    ON p.ProdajaID = pp.ProdajaID ;
GO 
SELECT * FROM PredmetProdaje

SELECT Opis
FROM Roba
WHERE Cenovnik >
    (SELECT AVG (Cenovnik)
     FROM Roba);
GO

SELECT Opis
FROM Roba
WHERE Cenovnik >= ANY
    (SELECT MAX (Cenovnik)
     FROM Roba
     GROUP BY PredmetID);
GO

SELECT DobavljacID
FROM Dobavljac
WHERE GradID <> ANY
    (SELECT GradID
     FROM Grad);
GO

SELECT Ime 
FROM Zaposleni
WHERE EXISTS
(
	SELECT * FROM Grad
	WHERE Grad.GradID = Zaposleni.GradID
	AND Ime='Petar'
);
GO

SELECT Ime 
FROM Zaposleni
WHERE NOt EXISTS
(
	SELECT * FROM Grad
	WHERE Grad.GradID = Zaposleni.GradID
	AND Ime='Petar'
);
GO