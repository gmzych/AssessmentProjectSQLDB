USE DBTEST10
GO

CREATE TABLE Lekarze(
lekarz_id INT PRIMARY KEY,
imie_lekarza VARCHAR(32) NOT NULL,
nazwisko_lekarza VARCHAR(32) NOT NULL,
);

CREATE TABLE Pacjenci(
pesel_pacjenta CHAR(11) PRIMARY KEY,
imie_pacjenta VARCHAR(32) NOT NULL,
nazwisko_pacjenta VARCHAR(32) NOT NULL,
ulica VARCHAR(32) NOT NULL,
kod_pocztowy CHAR(6) NOT NULL,
miejscowosc VARCHAR(32) NOT NULL,
);

CREATE TABLE Leki(
nr_leku BIGINT IDENTITY(1,1) PRIMARY KEY,
grupa VARCHAR(32) NOT NULL,
nazwa_leku VARCHAR(32) NOT NULL,
);

CREATE TABLE Diagnozy(
nr_diagnozy BIGINT IDENTITY(1,1) PRIMARY KEY,
opis_diagnozy VARCHAR(120) NOT NULL,
);

CREATE TABLE Zabiegi(
nr_zabiegu BIGINT IDENTITY(1,1) PRIMARY KEY,
nazwa_zabiegu VARCHAR(45) NOT NULL,
opis_zabiegu VARCHAR(120) NOT NULL,
);

CREATE TABLE Wizyty(
nr_wizyty BIGINT IDENTITY(1,1) PRIMARY KEY,
data_wizyty DATETIME NOT NULL default getdate(),
lekarz_id INT NOT NULL,
pesel_pacjenta CHAR(11) NOT NULL,
nr_zabiegu BIGINT NOT NULL,
nr_leku BIGINT NOT NULL,
nr_diagnozy BIGINT NOT NULL,
);

CREATE TABLE Wizyty_leki(
nr_wizyty BIGINT NOT NULL,
nr_leku BIGINT NOT NULL,
constraint pkwizytyleki PRIMARY KEY(nr_wizyty,nr_leku),
);

CREATE TABLE Wizyty_diagnozy(
nr_wizyty BIGINT NOT NULL,
nr_diagnozy BIGINT NOT NULL,
constraint pkwizytydiagnozy PRIMARY KEY(nr_wizyty,nr_diagnozy),
);

CREATE TABLE Wizyty_zabiegi(
nr_wizyty BIGINT NOT NULL,
nr_zabiegu BIGINT NOT NULL,
constraint pkwizytyzabiegi PRIMARY KEY(nr_wizyty,nr_zabiegu),
);

CREATE TABLE Grupy(
grupa VARCHAR(32) PRIMARY KEY,
);