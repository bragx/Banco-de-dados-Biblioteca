CREATE DATABASE biblioteca;

USE biblioteca;

CREATE TABLE genero(
id INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(60) NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE livros(
id INT NOT NULL AUTO_INCREMENT,
titulo VARCHAR(60) NOT NULL,
data_lancamento DATE NOT NULL,
isbn VARCHAR(17) NOT NULL UNIQUE,
genero_id INT NOT NULL,
PRIMARY KEY(id),
FOREIGN KEY (genero_id) REFERENCES genero(id)
);

CREATE TABLE autores(
id INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(90) NOT NULL,
data_nasc DATE NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE livros_autores(
id INT NOT NULL AUTO_INCREMENT,
livros_id INT NOT NULL,
autores_id INT NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (livros_id) REFERENCES livros(id),
FOREIGN KEY (autores_id) REFERENCES autores(id)
);

CREATE TABLE leitores(
id INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(90) NOT NULL,
email VARCHAR(90) NOT NULL UNIQUE,
cpf VARCHAR(14) NOT NULL UNIQUE,
data_nasc DATE NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE livros_leitores(
id INT NOT NULL AUTO_INCREMENT,
livros_id INT NOT NULL,
leitores_id INT NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (livros_id) REFERENCES livros(id),
FOREIGN KEY (leitores_id) REFERENCES leitores(id)
);

USE biblioteca;

INSERT INTO genero (nome) VALUES
('Contos'),
('Romance'),
('Religioso'),
('Drama'),
('Infantil'),
('Gibi'),
('Biografia'),
('Ficção'),
('Fantasia'),
('Suspense');

SELECT * FROM genero;
SELECT * FROM genero WHERE LENGTH(nome) > 5; -- consultar os generos que tiverem mais de 5 letras

INSERT INTO autores (nome, data_nasc) VALUES
('Francis Scott Key Fitzgerald', '1896/09/24'),
('Markus Zusak', '1975/06/23'),
('Charlotte Brontë', '1816/04/21'),
('George Orwell', '1903/06/25'),
('Herman Melville', '1819/08/01'),
('Jerome David Salinger', '1919/01/01'),
('Gabriel García Márquez', '1927/03/06'),
('Miguel de Cervantes', '1547/09/29'),
('John Ronald Reuel Tolkien', '1892/01/03'),
('Jane Austen', '1775/12/16');

SELECT * FROM autores;
SELECT * FROM autores WHERE data_nasc BETWEEN '1900-01-01' AND '1999-12-31'; -- consultar autores que nasceram entre 1900 ate 1999

INSERT INTO livros (titulo, data_lancamento, isbn, genero_id) VALUES
('Orgulho e Preconceito', '1813/01/28', '978-3-16-148410-0', '2'),
('O Senhor dos Anéis: A Sociedade do Anel', '1954/07/29', '978-1-56619-909-4', '9'),
('Dom Quixote', '1605/01/16', '978-0-262-13472-9', '2'),
('Cem Anos de Solidão', '1967/05/30', '978-0-19-852663-6', '9'),
('O Apanhador no Campo de Centeio', '1951/07/16', '978-0-7432-7356-5', '8'),
('Moby Dick', '1851/10/18', '978-1-4028-9462-6', '2'),
('A Revolução dos Bichos', '1945/08/17', '978-0-596-52068-7', '8'),
('Jane Eyre', '1847/10/19', '978-0-451-52959-5', '4'),
('A Menina que Roubava Livros', '2005/09/01', '978-0-307-26354-6', '8'),
('O Grande Gatsby', '1925/04/10', '978-1-84023-742-2', '2');

SELECT * FROM livros;
SELECT * FROM livros WHERE genero_id = 2; -- consultar todos os livros que forem do genero de romance

INSERT INTO leitores (nome, email, cpf, data_nasc) VALUES
('Nickolas Braga', 'nickolasbraga7@gmail.com', '601.973.330.01', '2006/04/08'),
('João Lucas', 'jl@gmail.com', '675.350.280-71', '2000/12/01'),
('Lucia Maria', 'lucimari@gmail.com', '659.200.740-00', '1980/03/08'),
('Pedro Borba', 'pborba@gmail.com', '374.227.320-59', '2004/08/04'),
('Danielle Soares', 'danisoares@gmail.com', '036.396.560-24', '2007/02/21'),
('Bruno da Silva', 'bruno@gmail.com', '694.270.890-91', '1984/03/08'),
('Leonardo Kissel', 'leokissel@gmail.com', '903.414.790-80', '2001/10/09'),
('Francielle dos Santos', 'fransantos@gmail.com', '113.933.900-13', '1987/09/03'),
('Julia Matos', 'juju@gmail.com', '926.390.110-49', '1990/07/10'),
('Raissa Mendes', 'raimendes@gmail.com', '323.597.020-76', '2003/06/19');

SELECT * FROM leitores;
SELECT * FROM leitores WHERE data_nasc < '2000-01-01'; -- consultar leitores que nasceram antes de 2000

INSERT INTO livros_autores (livros_id, autores_id) VALUES
('1', '10'),
('2', '9'),
('3', '8'),
('4', '7'),
('5', '6'),
('6', '5'),
('7', '4'),
('8', '3'),
('9', '2'),
('10', '1');

SELECT * FROM livros_autores;
SELECT * FROM livros_autores WHERE autores_id = 8; -- consultar o autor "Miguel de Cervantes"

INSERT INTO livros_leitores (livros_id, leitores_id) VALUES
('6', '1'),
('8', '2'),
('1', '3'),
('3', '4'),
('10', '5'),
('9', '6'),
('5', '7'),
('1', '8'),
('2', '9'),
('1', '10');

SELECT * FROM livros_leitores;
SELECT * FROM livros_leitores WHERE livros_id = 1; -- consultar leitores que escolheram o livro "Orgulho e Preconceito"


UPDATE leitores SET email = 'nickolasbraga@gmail.com' WHERE id = 1; -- trocando o email do leitor "Nickolas Braga"


DELETE FROM genero WHERE id = 6; -- excluindo o genero "Gibi"
SELECT * FROM genero;
