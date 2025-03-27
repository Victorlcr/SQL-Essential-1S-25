-- DDL

CREATE DATABASE Escola

USE Escola

CREATE TABLE Curso (
	CodCurso INT IDENTITY(1,1) PRIMARY KEY,
	NomeCurso VARCHAR(50) NOT NULL,
	Ativo BIT NOT NULL
);

SELECT * FROM Curso

CREATE TABLE Aluno (
	CodAluno INT IDENTITY(1,1) PRIMARY KEY,
	Nome VARCHAR(50) NOT NULL,
	Sobrenome VARCHAR(50) NOT NULL,
	CodCurso INT NOT NULL,
	DataNasc DATE,
	CONSTRAINT fk_aluno_curso FOREIGN KEY (CodCurso) REFERENCES Curso(CodCurso)
);

SELECT * FROM Aluno

-- DML

INSERT INTO Curso (NomeCurso, Ativo)
VALUES('ADS', 1)

INSERT INTO Curso (NomeCurso, Ativo)
VALUES('CD', 1)

INSERT INTO Curso (NomeCurso, Ativo)
VALUES('GTA', 1)

INSERT INTO Aluno (Nome, Sobrenome, CodCurso, DataNasc)
VALUES('Tobias', 'Almeida', 1, '2005-08-10')

INSERT INTO Aluno (Nome, Sobrenome, CodCurso, DataNasc)
VALUES('Olivia', 'Silva', 2, '2005-08-11')

UPDATE Curso
SET NomeCurso = 'GTI'

UPDATE Curso
SET NomeCurso = 'CD'
WHERE CodCurso = 2

DELETE FROM Curso
WHERE CodCurso = 3
