DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;
CREATE TABLE SpotifyClone.plano(
    plano_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_plano VARCHAR(45) NOT NULL UNIQUE,
    valor_plano DOUBLE NOT NULL
) engine = InnoDB;
CREATE TABLE SpotifyClone.artista(
    artista_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_artista VARCHAR(45) NOT NULL UNIQUE
) engine = InnoDB;
CREATE TABLE SpotifyClone.pessoas_usuarias(
    pessoa_usuaria_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_pessoa_usuaria VARCHAR(45) NOT NULL UNIQUE,
    idade INT NOT NULL,
    plano_id INT NOT NULL,
    data_assinatura DATETIME NOT NULL,
    FOREIGN KEY (plano_id) REFERENCES plano (plano_id)
) engine = InnoDB;
CREATE TABLE SpotifyClone.album(
    album_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_album VARCHAR(45) NOT NULL UNIQUE,
    artista_id INT NOT NULL,
    ano_lancamento INT NOT NULL,
    FOREIGN KEY (artista_id) REFERENCES artista (artista_id)
) engine = InnoDB;
CREATE TABLE SpotifyClone.cancoes(
    cancoes_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_cancao VARCHAR(45) NOT NULL UNIQUE,
    artista_id INT NOT NULL,
    album_id INT NOT NULL,
    duracao_segundos INT NOT NULL,
    FOREIGN KEY (artista_id) REFERENCES artista (artista_id),
    FOREIGN KEY (album_id) REFERENCES album (album_id)
) engine = InnoDB;
CREATE TABLE SpotifyClone.historico_rep(
    cancoes_id INT NOT NULL,
    data_reproducao DATETIME NOT NULL,
    pessoa_usuaria_id INT NOT NULL,
	CONSTRAINT PRIMARY KEY(cancoes_id, pessoa_usuaria_id),
    FOREIGN KEY (cancoes_id) REFERENCES cancoes (cancoes_id),
    FOREIGN KEY (pessoa_usuaria_id) REFERENCES pessoas_usuarias (pessoa_usuaria_id)
) engine = InnoDB;
CREATE TABLE SpotifyClone.seguindo_artistas(
    pessoa_usuaria_id INT NOT NULL,
    artista_id INT,
    CONSTRAINT PRIMARY KEY(pessoa_usuaria_id, artista_id),
    FOREIGN KEY (pessoa_usuaria_id) REFERENCES pessoas_usuarias (pessoa_usuaria_id),
    FOREIGN KEY (artista_id) REFERENCES artista (artista_id)
) engine = InnoDB;
CREATE TABLE SpotifyClone.cancoes_favoritas (
    pessoa_usuaria_id INT NOT NULL,
    cancoes_id INT,
    CONSTRAINT PRIMARY KEY (pessoa_usuaria_id , cancoes_id),
    FOREIGN KEY (pessoa_usuaria_id)
        REFERENCES pessoas_usuarias (pessoa_usuaria_id),
    FOREIGN KEY (cancoes_id)
        REFERENCES cancoes (cancoes_id)
)  ENGINE=INNODB;
INSERT INTO SpotifyClone.plano (nome_plano, valor_plano)
VALUES
  ('gratuito', 0),
  ('universitário', 5.99),
  ('pessoal', 6.99),
  ('familiar', 7.99);
INSERT INTO SpotifyClone.artista (nome_artista)
VALUES
  ('Baco Exu do Blues'),
  ('Beyoncé'),
  ('Blind Guardian'),
  ('Elis Regina'),
  ('Queen'),
  ('Nina Simone');
INSERT INTO SpotifyClone.pessoas_usuarias (nome_pessoa_usuaria, idade, plano_id, data_assinatura)
VALUES
  ('Barbara Liskov', 82, 1, '2019-10-20'),
  ('Robert Cecil Martin', 58, 1, '2017-01-06'),
  ('Ada Lovelace', 37, 4, '2017-12-30'),
  ('Martin Fowler',	46, 4, '2017-01-17'),
  ('Sandi Metz', 58, 4, '2018-04-29'),
  ('Paulo Freire', 19, 2, '2018-02-14'),
  ('Bell Hooks', 26, 2, '2018-01-05'),
  ('Christopher Alexander',	85, 3, '2019-06-05'),
  ('Judith Butler', 45, 3, '2020-05-13'),
  ('Jorge Amado', 58, 3, '2017-02-17');
INSERT INTO SpotifyClone.album (nome_album, artista_id, ano_lancamento)
VALUES
  ('Renaissance', 2, 2022),
  ('Jazz', 5,	1978),
  ('Hot Space',	5, 1982),
  ('Falso Brilhante', 4, 1998),
  ('Vento de Maio', 4, 2001),
  ('QVVJFA?', 1, 2003),
  ('Somewhere Far Beyond', 3,	2007),
  ('I Put A Spell On You', 6, 2012);
INSERT INTO SpotifyClone.cancoes (nome_cancao, artista_id, album_id, duracao_segundos)
VALUES
  ('Samba em Paris', 1, 6,	267),
  ('Break my Soul', 2, 1,	279),
  ("Virgo's Groove", 2, 1,  369),
  ('Alien Superstar', 2, 1,  116),
  ("The Bard's Song", 3, 7,  244),
  ('Como nossos pais', 4, 4, 105),
  ('O Medo de Amar é o Medo de Ser Livre', 4, 5, 207),
  ('Feeling Good', 6, 8, 100),
  ("Don't Stop Me Now", 5, 2, 203),
  ('Under Pressure', 5, 3, 152);
INSERT INTO SpotifyClone.historico_rep (cancoes_id, data_reproducao, pessoa_usuaria_id)
VALUES
  (9, '2011-12-15 22:30:49', 7),
  (9, '2012-03-17 14:56:41', 8),
  (4, '2015-12-13 08:30:22', 10),
  (7, '2017-01-24 00:31:17', 6),
  (2, '2017-10-12 12:35:20', 6),
  (7, '2020-01-02 07:40:33', 2),
  (8, '2020-03-06 11:22:33', 1),
  (3, '2020-05-02 05:30:35', 1),
  (10, '2020-08-06 15:23:43',	5),
  (8, '2020-11-13 16:55:13',	3),
  (3,	'2020-12-05 18:38:30', 3),
  (1,	'2021-08-15 17:10:10', 4),
  (1,	'2022-01-09 01:44:33',	5),
  (5,	'2022-02-24 21:14:22',	9),
  (1, '2022-02-28 10:45:55',	1),
  (8, '2022-08-05 08:05:17',	2);
INSERT INTO SpotifyClone.seguindo_artistas (pessoa_usuaria_id, artista_id)
VALUES
  (1, 2),
  (1, 5),
  (1, 4),
  (2, 2),
  (2, 4),
  (3, 5),
  (4, 1),
  (5, 3),
  (5, 6), 
  (6, 2),
  (6, 6),
  (7, 6),
  (9, 4),
  (10, 5);
INSERT INTO SpotifyClone.cancoes_favoritas (pessoa_usuaria_id, cancoes_id)
VALUES
  (1, 4),
  (1, 6),
  (1, 8),
  (2, 9),
  (3, 2),
  (3, 4),
  (4, 7),
  (4, 9),
  (5, 8), 
  (5, 3),
  (8, 9),
  (9, 7),
  (10, 4);
