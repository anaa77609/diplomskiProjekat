USE PetShop
GO
 
CREATE FUNCTION getFormattedDate(@DateValue AS DATETIME)
RETURNS VARCHAR(MAX)
AS
BEGIN
	RETURN
	  DATENAME(DW, @DateValue)+ ', '+
	  DATENAME(DAY, @DateValue)+ ' '+
	  DATENAME(MONTH, @DateValue) +', '+
	  DATENAME(YEAR, @DateValue)
 END
go
---SELECT dbo.getFormattedDate('1.1.2001');
--skalarne funkcije 

GO
CREATE Function dbo.ufnCustomerGetAddress(@ID int)
returns varchar(100)
as
begin
declare @address varchar(100)
SELECT @address = Adresa from Kupac
WHERE KupacID=@ID
return @address
END
go

Select dbo.ufnCustomerGetAddress(1)
--Select dbo.ufnCustomerGetAddress(100)

GO
CREATE Function dbo.ufnCityGetGrad(@ID int)
returns varchar(100)
as
begin
declare @grad varchar(100)
SELECT @grad = Grad  FROM  dbo.Grad
WHERE GradID=@ID
return @grad
END
go

Select dbo.ufnCityGetGrad(2)

GO
CREATE Function dbo.ufnDobavljacDohvatiKontaktIme(@ID int)
returns varchar(60)
as
begin
declare @kontaktIme varchar(60)
SELECT @kontaktIme = KontaktIme FROM Dobavljac
WHERE DobavljacID=@ID
return @kontaktIme
END
go

Select dbo.ufnDobavljacDohvatiKontaktIme(2)

--table-valued functions
GO
CREATE Function fn_AnimalsGender (@Gender nvarchar(10))
RETURNS TABLE
AS
RETURN (Select ZivotinjaId, Ime,Kategorija, Pol
FROM Zivotinja
WHERE Pol = @Gender)
GO

--Select * from fn_AnimalsGender('M');
Select * from fn_AnimalsGender('Z');

