CREATE DATABASE exercicio;
USE exercicio;

CREATE TABLE Empregado (
nome_empregado 	VARCHAR(30) NOT NULL,
rua				VARCHAR(30),
cidade			VARCHAR(30),
CONSTRAINT PK_Empregado PRIMARY KEY (nome_empregado));

CREATE TABLE Companhia (
nome_companhia	VARCHAR(30) NOT NULL,
cidade			VARCHAR(30),
CONSTRAINT PK_Companhia PRIMARY KEY (nome_companhia));

CREATE TABLE Trabalha (
nome_empregado	VARCHAR(30),
nome_companhia	VARCHAR(30),
salario			DECIMAL(7,2),
CONSTRAINT fk_TrabalhaEmpregado FOREIGN KEY (nome_empregado)
	REFERENCES Empregado(nome_empregado),
CONSTRAINT fk_TrabalhaCompanhia FOREIGN KEY (nome_companhia)
	REFERENCES Companhia(nome_companhia));
    

INSERT INTO Empregado VALUES ("Matheus Barreto", "Rua 1", "Jaboatão");
INSERT INTO Empregado VALUES ("Mariana", "Rua 2", "Piedade");
INSERT INTO Empregado VALUES ("Iago Benone", "Rua 3", "Prazeres");
INSERT INTO Empregado VALUES ("Jamilly", "Rua 5", "Jaboatão Velho");
INSERT INTO Empregado VALUES ("Lucas Veras", "Rua 1", "Piedade");
INSERT INTo Empregado VALUES ("Elianai", "Rua 12", "Recife");

INSERT INTO Companhia VALUES ("First Bank Corporation", "Piedade");
INSERT INTO Companhia VALUES ("UNIFG", "Jaboatão");

INSERT INTO Trabalha VALUES ("Jamilly", "First Bank Corporation", 998.00);
INSERT INTO Trabalha VALUES ("Iago Benone", "First Bank Corporation", 998.00);
INSERT INTO Trabalha VALUES ("Matheus Barreto", "First Bank Corporation", 11000.00);
INSERT INTO Trabalha VALUES ("Mariana", "First Bank Corporation", 11000.00);
INSERT INTO Trabalha VALUES ("Elianai", "UNIFG", 998.00);
INSERT INTO Trabalha VALUES ("Lucas Veras", "UNIFG", 998.00);

SELECT nome_empregado FROM Trabalha WHERE nome_companhia = "First Bank Corporation";
SELECT Empregado.cidade FROM Empregado INNER JOIN Trabalha
	ON Empregado.nome_empregado = Trabalha.nome_empregado
    WHERE Trabalha.nome_companhia = "First Bank Corporation";

SELECT Empregado.nome_empregado, Empregado.rua, Empregado.cidade FROM Empregado INNER JOIN Trabalha
	ON Empregado.nome_empregado = Trabalha.nome_empregado
    WHERE Trabalha.nome_companhia = "First Bank Corporation"
		AND Trabalha.salario > 1000.00 ;

SELECT Empregado.nome_empregado FROM Empregado INNER JOIN Trabalha
	ON Trabalha.nome_empregado = Empregado.nome_empregado INNER JOIN Companhia
    ON Trabalha.nome_companhia = Companhia.nome_companhia
    WHERE Empregado.cidade = Companhia.cidade AND Trabalha.nome_companhia = Companhia.nome_companhia;

SELECT Empregado.nome_empregado FROm Empregado INNER JOIN Trabalha
	ON Trabalha.nome_empregado = Empregado.nome_empregado
    WHERE Empregado.cidade = (SELECT cidade FROM Companhia WHERE nome_companhia = "First Bank Corporation")
    AND Trabalha.nome_companhia = "First Bank Corporation";

SELECT nome_empregado FROM Trabalha WHERE nome_companhia <> "First Bank Corporation";
