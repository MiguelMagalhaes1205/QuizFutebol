create database QuizFutebol;

use QuizFutebol;

create table usuario(
	idUsuario int primary key auto_increment,
    nome varchar(200) not null,
	email varchar(200) not null,
    senha varchar(50) not null,
    timefavorito varchar(40) not null
);

CREATE TABLE categorias (
    idCategoria INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL
);

create table quizzes(
	idQuizzes int primary key auto_increment,
	nome varchar(200),
    total_perguntas int,
    fkCategoria int not null,
    foreign key (fkCategoria) references categorias(idCategoria)
);

create table resultados(
	idResultado int primary key auto_increment,
    fkUsuario int not null,
    fkQuizzes int not null,
    quantidadeAcertos int,
    foreign key (fkUsuario) references usuario(idUsuario),
    foreign key (fkQuizzes) references quizzes(idQuizzes)
);

INSERT INTO categorias (nome)
values ('Brasil'),
		('América do Sul'),
        ('Europa'),
        ('Inglaterra'),
        ('Espanha'),
        ('Itália'),
        ('Alemanha'),
        ('Franca');

INSERT INTO quizzes (nome, total_perguntas, fkCategoria) VALUES
('Quiz sobre o Brasileirão', 10, 1),
('Quiz sobre a Copa do Brasil', 10, 1),
('Quiz sobre o Corinthians', 10, 1),
('Quiz sobre o Flamengo', 10, 1),
('Quiz sobre o São Paulo', 10, 1),
('Quiz sobre o Palmeiras', 10, 1),
('Quiz sobre o Santos', 10, 1),
('Quiz sobre o Vasco', 10, 1),
('Quiz sobre o Botafogo', 10, 1),
('Quiz sobre o Fluminense', 10, 1),
('Quiz sobre o Atlético-MG', 10, 1),
('Quiz sobre o Cruzeiro', 10, 1),
('Quiz sobre o Internacional', 10, 1),
('Quiz sobre o Grêmio', 10, 1),
('Quiz sobre o Athletico Paranaense', 10, 1),
('Quiz sobre o Coritiba', 10, 1),
('Quiz sobre a Libertadores', 10, 2),
('Quiz sobre a Copa Sul-Americana', 10, 2),
('Quiz sobre o Campeonato Argentino', 10, 2),
('Quiz sobre o Campeonato Chileno', 10, 2),
('Quiz sobre o Campeonato Colombiano', 10, 2),
('Quiz sobre o Campeonato Uruguaio', 10, 2),
('Quiz sobre a Champions League', 10, 3),
('Quiz sobre a Europa League', 10, 3),
('Quiz sobre a Conference League', 10, 3),
('Quiz sobre a Premier League', 10, 4),
('Quiz sobre a FA Cup', 10, 4),
('Quiz sobre o Liverpool', 10, 4),
('Quiz sobre o Manchester United', 10, 4),
('Quiz sobre o Chelsea', 10, 4),
('Quiz sobre o Arsenal', 10, 4),
('Quiz sobre o Manchester City', 10, 4),
('Quiz sobre o Tottenham', 10, 4),
('Quiz sobre a LaLiga', 10, 5),
('Quiz sobre a Copa Del Rey', 10, 5),
('Quiz sobre o Barcelona', 10, 5),
('Quiz sobre o Real Madrid', 10, 5),
('Quiz sobre o Atlético de Madrid', 10, 5),
('Quiz sobre a Serie A Italiana', 10, 6),
('Quiz sobre a Coppa Italia', 10, 6),
('Quiz sobre a Juventus', 10, 6),
('Quiz sobre a Internazionale', 10, 6),
('Quiz sobre o Milan', 10, 6),
('Quiz sobre o Napoli', 10, 6),
('Quiz sobre a Roma', 10, 6),
('Quiz sobre a Lazio', 10, 6),
('Quiz sobre a Bundesliga', 10, 7),
('Quiz sobre a DFB-Pokal', 10, 7),
('Quiz sobre o Bayern de Munique', 10, 7),
('Quiz sobre o Borussia Dortmund', 10, 7),
('Quiz sobre a Ligue One', 10, 8),
('Quiz sobre a Coupe de France', 10, 8),
('Quiz sobre o PSG', 10, 8),
('Quiz sobre o Olympique de Marseille', 10, 8);


SELECT * FROM usuario;
SELECT * FROM quizzes;
SELECT * FROM resultados;
	
SELECT 
    u.nome AS nome_usuario,
    q.nome AS nome_quiz,
    r.quantidadeAcertos,
    q.total_perguntas,
    ROUND((r.quantidadeAcertos / q.total_perguntas) * 100, 2) AS porcentagem_acertos
FROM resultados r
JOIN usuario u ON r.fkUsuario = u.idUsuario
JOIN quizzes q ON r.fkQuizzes = q.idQuizzes;

SELECT 
    c.nome AS categoria,
    ROUND(SUM(r.quantidadeAcertos / q.total_perguntas * 100), 2) AS porcentagem_categoria
FROM categorias c
LEFT JOIN quizzes q ON q.fkCategoria = c.idCategoria
LEFT JOIN resultados r ON r.fkQuizzes = q.idQuizzes AND r.fkUsuario = 1
GROUP BY c.idCategoria, c.nome;

SELECT 
q.nome AS nome_quiz,
r.quantidadeAcertos
FROM resultados r
JOIN quizzes q ON r.fkQuizzes = q.idQuizzes
WHERE r.fkUsuario = 1
ORDER BY r.idResultado DESC
LIMIT 10;
