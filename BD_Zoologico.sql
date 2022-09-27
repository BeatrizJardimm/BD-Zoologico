CREATE DATABASE Zoologico;
USE Zoologico;

CREATE TABLE Animal(
	id_animal INT,
    id_especie INT,
    peso FLOAT,
    tamanho FLOAT, 
    genero CHAR(1),
    data_nasc DATETIME,
    is_doente BOOL,
    PRIMARY KEY (id_animal)
);
INSERT INTO Animal VALUES (1, 101, 75.5, 1.30, "F", "2001-04-22", false);
INSERT INTO Animal VALUES (2, 201, 5.13, 0.49, "M", "2020-09-14", false);
INSERT INTO Animal VALUES (3, 202, 1.15, 0.17, "F", "2017-11-05", false);
INSERT INTO Animal VALUES (4, 101, 40.4, 0.82, "M", "2022-03-23", true);
INSERT INTO Animal VALUES (5, 201, 6.5, 0.54, "M", "2021-04-12", false);
INSERT INTO Animal VALUES (6, 202, 1.27, 0.23, "M", "2016-09-19", false);
INSERT INTO Animal VALUES (7, 202, 0.80, 0.13, "M", "2022-05-22", true);
INSERT INTO Animal VALUES (8, 102, 142.03, 01.25, "F", "2009-11-27", false);
INSERT INTO Animal VALUES (9, 102, 184.45, 1.86, "M", "2007-03-15", false);
INSERT INTO Animal VALUES (10, 102, 79.29, 0.89, "M", "2015-04-23", true);
INSERT INTO Animal VALUES (11, 102, 98.47, 1.05, "F", "2011-07-02", true);
INSERT INTO Animal VALUES (12, 103, 1.26, 1.78, "F", "2013-06-19", false);
INSERT INTO Animal VALUES (13, 103, 1.14, 1.58, "F", "2017-02-28", false);

CREATE TABLE Especie(
	id_especie INT,
    nome_cient VARCHAR(30),
    is_venenosa BOOL,
    dieta CHAR(1),
    PRIMARY KEY (id_especie)
);
-- a id_especie dos animais terrestres começa sempre com 1 e a dos animais aquaticos começa com 2 --
INSERT INTO Especie VALUES (101, "Tremarctos ornatus", false, "H");
INSERT INTO Especie VALUES (201, "Synanceia verrucosa", true, "C");
INSERT INTO Especie VALUES (202, "Trachemys scripta", false, "R");
INSERT INTO Especie VALUES (102, "Panthera leo", false, "C");
INSERT INTO Especie VALUES (103, "Crotalus durissus", true, "C");

CREATE TABLE NomeEspecie(
	nome_cient VARCHAR(30),
    nome_pop VARCHAR(30),
    PRIMARY KEY (nome_cient)
);
INSERT INTO NomeEspecie VALUES ("Tremarctos ornatus", "Urso-de-Óculos");
INSERT INTO NomeEspecie VALUES ("Synanceia verrucosa", "Peixe-Pedra");
INSERT INTO NomeEspecie VALUES ("Trachemys scripta", "Tartaruga da Orelha Amarela");
INSERT INTO NomeEspecie VALUES ("Panthera leo", "Leão Africano");
INSERT INTO NomeEspecie VALUES ("Crotalus durissus", "Cobra Cascavel");

CREATE TABLE Aquaticos(
	id_especie INT,
    tipo_agua CHAR(1),
    re_origem VARCHAR(20),
    PRIMARY KEY (id_especie),
    FOREIGN KEY (id_especie) REFERENCES Especie(id_especie)
);
INSERT INTO Aquaticos VALUES (201, "S", "Austrália");
INSERT INTO Aquaticos VALUES (202, "D", "América do Norte");

CREATE TABLE Terrestres(
	id_especie INT,
    bioma VARCHAR(20),
    re_origem VARCHAR(20),
    PRIMARY KEY (id_especie),
    FOREIGN KEY (id_especie) REFERENCES Especie(id_especie)
);
INSERT INTO Terrestres VALUES (101, "Floresta Amazônica", "América do Sul");
INSERT INTO Terrestres VALUES (102, "Savanas", "África");
INSERT INTO Terrestres VALUES (103, "Campos de cerrado", "América do Sul");

CREATE TABLE EstoqueMensalC(
	mes VARCHAR(15),
    carne_comp FLOAT,
    carne_disp FLOAT,
    PRIMARY KEY (mes)
);
INSERT INTO EstoqueMensalC VALUES ("abril-2022", 65.5, 48.2);
INSERT INTO EstoqueMensalC VALUES ("maio-2022", 21.5, 14.2);

CREATE TABLE EstoqueMensalF(
	mes VARCHAR(15),
    folha_comp FLOAT,
    folha_disp FLOAT,
    PRIMARY KEY (mes)
);
INSERT INTO EstoqueMensalF VALUES ("abril-2022", 73.5, 61.6);

CREATE TABLE EstoqueMensalR(
	mes VARCHAR(15),
    racao_comp FLOAT,
    racao_disp FLOAT,
    PRIMARY KEY (mes)
);
INSERT INTO EstoqueMensalR VALUES ("abril-2022", 58.9, 0.63);

CREATE TABLE Funcionarios(
	cpf CHAR(14),
    cargo VARCHAR(15),
    full_name VARCHAR(30),
    data_nasc DATETIME,
    telefone VARCHAR(15),
    email VARCHAR(20),
    endereco VARCHAR(50),
    data_admissao DATETIME,
    sexo CHAR(1),    
    PRIMARY KEY (cpf)
);
INSERT INTO Funcionarios VALUES ("123.456.789-10", "Gerente", "Mariana da Silva", "1986-10-26", "(41) 99851-5146",
									"marianasilva@zoo.com", "Rua das Palmeiras, 223", "2022-04-22", "F");
INSERT INTO Funcionarios VALUES ("098.765.432-10", "Zelador", "Gustavo Patrício", "1991-12-14", "(41) 99726-5486",
									"gupatricio@zoo.com", "Rua Papagaio, 155", "2022-04-22", "M");
INSERT INTO Funcionarios VALUES ("489.602.358-43", "Bilheteiro", "Leopoldo Guimaraes", "1989-07-30", "(41) 99695-2471",
									"leopoldoguim@zoo.com", "Avenida das Flores, 784", "2022-04-22", "M");
INSERT INTO Funcionarios VALUES ("160.584.102-14", "Biologo", "Thais Ramos", "1996-03-23", "(41) 99045-4863",
									"thaisramos@zoo.com", "Rua Amarela, 564", "2022-04-22", "F");										
INSERT INTO Funcionarios VALUES ("874.351.638-4", "Enf. Vet.", "Leticia Pontes", "1975-08-27", "(41) 99785-5641",
									"letpontes@zoo.com", "Avenida das Tortas, 168", "2022-04-22", "F");
INSERT INTO Funcionarios VALUES ("682.843.610-14", "Trat. Animais", "Ezequiel Filho", "1996-11-14", "(41) 99684-0574",
									"ezeqfilho@zoo.com", "Avenida Quebrada, 743", "2022-04-22", "M");
INSERT INTO Funcionarios VALUES ("893.873.136-85", "Biologo", "Roberta Diniz", "1997-09-04", "(41) 99489-6984",
									"robertadiniz@zoo.com", "Rua das Estatuas, 658", "2022-04-22", "F");

CREATE TABLE Salarios(
	cargo VARCHAR(15),
    salario float,
    PRIMARY KEY (cargo)
);
INSERT INTO Salarios VALUES ("Gerente", 3600.50);
INSERT INTO Salarios VALUES ("Zelador", 1965.00);
INSERT INTO Salarios VALUES ("Trat. Animais", 2070.50);
INSERT INTO Salarios VALUES ("Bilheteiro", 1560.75);
INSERT INTO Salarios VALUES ("Biologo", 4820.50);
INSERT INTO Salarios VALUES ("Enf. Vet.", 3265.20);
INSERT INTO Salarios VALUES ("Designer", 2874.00);
INSERT INTO Salarios VALUES ("RH", 3640.20);

CREATE TABLE Visitantes(
	id_visitante int,
    full_name VARCHAR(30),
    data_nasc DATETIME,
    email VARCHAR(50),
    PRIMARY KEY (id_visitante)
);
INSERT INTO Visitantes VALUES (1, "Taylor Swift", "1989-12-13", "taylorswift@gmail.com");
INSERT INTO Visitantes VALUES (2, "Niall Horan", "1993-09-13", "niallhoran@gmail.com");
INSERT INTO Visitantes VALUES (3, "Zayn Malik", "1993-01-12", "zaynmalik@gmail.com");
INSERT INTO Visitantes VALUES (4, "Liam Payne", "1993-08-29", "liampayne@gmail.com");
INSERT INTO Visitantes VALUES (5, "Harry Styles", "1994-02-01", "harrystyles@gmail.com");
INSERT INTO Visitantes VALUES (6, "Louis Tomlinson", "1991-12-24", "louistomlinson@gmail.com");

CREATE TABLE Visitas(
	id_visita int,
	id_visitante int,
    data_visita DATETIME,
    ini_visita TIME,
    fim_visita TIME,
    nota int,
    PRIMARY KEY (id_visita)
);
INSERT INTO Visitas VALUES (1, 1, "2022-04-23", "14:30:00", "16:15:00", 4);
INSERT INTO Visitas VALUES (2, 2, "2022-04-29", "15:10:00", "17:45:00", 5);
INSERT INTO Visitas VALUES (3, 3, "2022-04-25", "09:50:00", "11:30:00", 2);
INSERT INTO Visitas VALUES (4, 4, "2022-04-29", "14:30:00", "17:25:00", 5);
INSERT INTO Visitas VALUES (5, 5, "2022-04-30", "13:45:00", "15:15:00", 3);
INSERT INTO Visitas VALUES (6, 6, "2022-05-01", "15:30:00", "16:40:00", 1);
INSERT INTO Visitas VALUES (7, 1, "2022-04-29", "15:15:00", "16:45:00", 5);
INSERT INTO Visitas VALUES (8, 1, "2022-05-01", "16:10:00", "17:30:00", 4);
INSERT INTO Visitas VALUES (9, 2, "2022-05-02", "15:40:00", "16:25:00", 4);
INSERT INTO Visitas VALUES (10, 2, "2022-05-03", "15:40:00", "16:25:00", 4);

CREATE TABLE Dia(
	data_visita DATETIME,
    dia_semana VARCHAR(13),
    PRIMARY KEY (data_visita)
);
INSERT INTO Dia VALUES ("2022-04-34", "Sabado");
INSERT INTO Dia VALUES ("2022-04-25", "Segunda-Feira");
INSERT INTO Dia VALUES ("2022-04-29", "Sexta-Feira");
INSERT INTO Dia VALUES ("2022-04-30", "Sabado");
INSERT INTO Dia VALUES ("2022-05-01", "Domingo");
INSERT INTO Dia VALUES ("2022-05-02", "Segunda-Feira");

/* INFORMAÇÕES A SEREM EXTRAÍDAS */

/*1- Média da idade dos visitantes */

SELECT SUM(DATE_FORMAT(FROM_DAYS(DATEDIFF(now(), data_nasc)), '%Y'))/COUNT(id_visitante) AS media
FROM Visitantes;

/*2- Moda da idade dos visitantes */

SELECT DATE_FORMAT(FROM_DAYS(DATEDIFF(now(), data_nasc)), '%Y') AS idades
FROM Visitantes
GROUP BY idades
HAVING count(*) > 1
ORDER BY idades DESC;

/*3- Quantidade de visitantes em determinada hora */
## Para fazer o select, vou usar como exemplo o horario 15:00

SELECT COUNT(id_visita) AS quantidade
FROM Visitas
WHERE '15:00:00' >= ini_visita AND '15:00:00' <= fim_visita;

/*4- Dia da semana com mais visitantes */

SELECT dia_semana AS dias
FROM Dia
GROUP BY dias
HAVING count(*) > 1
ORDER BY dia_semana DESC;

/*5- Tempo médio de visita por visitante */

SELECT SUM(TIMESTAMPDIFF(MINUTE, ini_visita, fim_visita))/COUNT(id_visita) AS tempo_media
FROM Visitas;

/* 6- Média de satisfação dos visitantes */

SELECT SUM(nota)/COUNT(id_visita) AS satisfacao
FROM Visitas;

/* 7- Média da idade dos funcionários */

SELECT SUM(DATE_FORMAT(FROM_DAYS(DATEDIFF(now(), data_nasc)), '%Y'))/COUNT(cpf) AS idades
FROM Funcionarios;

/* 8- Sexo predominante entre os funcionários */

SELECT sexo, COUNT(sexo) AS predominante
FROM Funcionarios
GROUP BY sexo
ORDER BY predominante DESC;

/* 9- Quantidade de funcionários por cargo */

SELECT cargo, COUNT(cpf) AS quantidade
FROM funcionarios
GROUP BY cargo;

/* 10- Porcentagem das espécies que são venenosas */

SELECT ((SELECT COUNT(is_venenosa) FROM Especie WHERE is_venenosa = TRUE) * 100)/COUNT(id_especie) AS porcentagem
FROM Especie;

/* 11- Porcentagem de espécies aquáticas e terrestres */
#Exercício feito com base no cálculo da porcentagem de animais aquáticos

SELECT (SELECT COUNT(id_especie) FROM aquaticos)/COUNT(id_especie) AS porcentagemA
FROM Especie;

/* 12- Porcentagem de animais aquáticos vindos de uma certa região */

SELECT re_origem, COUNT(id_especie) AS especies
FROM aquaticos
GROUP BY re_origem;

/* 13- Porcentagem de animais terrestres vindos de uma certa região */

SELECT re_origem, COUNT(id_especie) AS especies
FROM terrestres
GROUP BY re_origem;

/* 14- Quantidade de animais de uma espécie */

SELECT id_especie, COUNT(id_animal) AS total
FROM Animal
GROUP BY id_especie;

/* 15- Média da idade dos animais de uma espécie */

SELECT id_especie, SUM(DATE_FORMAT(FROM_DAYS(DATEDIFF(now(), data_nasc)), '%Y'))/COUNT(id_especie) AS idades
FROM Animal
GROUP BY id_especie;

/* 16- Quantidade de fêmeas e machos em determinada espécie */
#Calculo com base na quantidade de Femeas

SELECT id_especie, COUNT(id_animal) AS femeas
FROM animal
WHERE genero = "F" 
GROUP BY id_especie;

/* 17- Quantidade de animais doentes (por espécie) */

SELECT id_especie, COUNT(id_animal) AS doentes
FROM animal
WHERE is_doente = TRUE
GROUP BY id_especie;

/* 18- Quantidade de espécies carnívoras, herbívoras e onívoras */

SELECT dieta, COUNT(id_especie)
FROM especie
GROUP BY dieta; 

/* 19- Média do peso dos animais de cada espécie */

SELECT SUM(peso)/COUNT(id_animal) AS pesoMedio
FROM Animal
GROUP BY id_especie;

/* 20- Quantidade de alimento consumida por categoria (carne, folhas e ração) */

SELECT (estoqueMensalC.carne_comp - estoqueMensalC.carne_disp) AS carne,
	   (estoqueMensalF.folha_comp - estoqueMensalF.folha_disp) AS folhas,
       (estoqueMensalR.racao_comp - estoqueMensalR.racao_disp) AS racao
FROM estoqueMensalC, estoqueMensalF, estoqueMensalR;

/* 21- Encontrar o nome científico de todos os animais. */

### Produto cartesiano ###
SELECT animal.id_animal, nomeespecie.nome_Cient, nomeespecie.nome_pop
FROM animal, especie, nomeespecie
WHERE animal.id_especie = especie.id_especie AND especie.nome_cient = nomeespecie.nome_cient;

### Junção ###
SELECT animal.id_animal, nomeespecie.nome_Cient, nomeespecie.nome_pop FROM animal
JOIN especie ON animal.id_especie = especie.id_especie
JOIN nomeespecie ON especie.nome_cient = nomeespecie.nome_cient;

/* 22- Encontrar quais cargos estão disponíveis */

SELECT cargo FROM Salarios
WHERE cargo NOT IN (SELECT cargo FROM Funcionarios);