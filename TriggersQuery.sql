


--kreira triger koji obavestava svaki put kada user unese vrednosti u tabelu zivotinja


CREATE TRIGGER reminder1  
ON Zivotinja 
AFTER INSERT, UPDATE   
AS RAISERROR ('Notify Customer Relations', 16, 10);  
GO 

