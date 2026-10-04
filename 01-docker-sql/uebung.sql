CREATE DATABASE Firma;
GO
USE Firma;
CREATE TABLE Kunden (
  KundenID INT PRIMARY KEY IDENTITY,
  Name NVARCHAR(100) NOT NULL,
  Ort NVARCHAR(50)
);
CREATE TABLE Rechnungen (
  RechnungID INT PRIMARY KEY IDENTITY,
  KundenID INT FOREIGN KEY REFERENCES Kunden(KundenID),
  Datum DATE,
  Betrag DECIMAL(10,2)
);
INSERT INTO Kunden (Name, Ort) VALUES
  ('Müller GmbH', 'Bielefeld'), ('Schulz AG', 'Gütersloh'), ('Weber KG', 'Herford');
INSERT INTO Rechnungen (KundenID, Datum, Betrag) VALUES
  (1, '2026-09-01', 1200.00), (1, '2026-10-01', 850.50), (2, '2026-09-15', 3400.00);

-- Umsatz pro Kunde, auch Kunden ohne Rechnung
SELECT k.Name, COUNT(r.RechnungID) AS Anzahl, ISNULL(SUM(r.Betrag), 0) AS Umsatz
FROM Kunden k
JOIN Rechnungen r ON k.KundenID = r.KundenID
GROUP BY k.Name;

SELECT k.Name, r.RechnungID, r.Betrag
FROM Kunden k
JOIN Rechnungen r ON k.KundenID = r.KundenID
WHERE r.betrag > 1000

BACKUP DATABASE Firma TO DISK = '/var/opt/mssql/data/Firma.bak';

USE master;
DROP DATABASE Firma;
SELECT name FROM sys.databases;

ALTER DATABASE Firma SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

SELECT name FROM sys.databases;

RESTORE DATABASE Firma FROM DISK = '/var/opt/mssql/data/Firma.bak';
GO
USE Firma;
SELECT * FROM Rechnungen;

SELECT * FROM Rechnungen;