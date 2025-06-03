create database QuizFutebol;

use QuizFutebol;

create table usuario(
	idUsuario int primary key auto_increment,
    nome varchar(200) not null,
	email varchar(200) not null,
    senha varchar(50) not null,
    timefavorito varchar(40) not null
);

create table quizzes(
	idQuizzes int primary key auto_increment,
	nome varchar(200),
    total_perguntas int
);

create table resultados(
	idResultado int primary key auto_increment,
    fkUsuario int not null,
    fkQuizzes int not null,
    quantidadeAcertos int,
    foreign key (fkUsuario) references usuario(idUsuario),
    foreign key (fkQuizzes) references quizzes(idQuizzes)
);

INSERT INTO quizzes (nome, total_perguntas) VALUES 
('Quiz sobre o Brasileirão', 10),
('Quiz sobre a Copa do Brasil', 10),
('Quiz sobre o Corinthians', 10),
('Quiz sobre o Flamengo', 10),
('Quiz sobre o São Paulo', 10),
('Quiz sobre o Palmeiras', 10),
('Quiz sobre o Santos', 10),
('Quiz sobre o Vasco', 10),
('Quiz sobre o Botafogo', 10),
('Quiz sobre o Fluminense', 10),
('Quiz sobre o Atlético-MG', 10),
('Quiz sobre o Cruzeiro', 10),
('Quiz sobre o Internacional', 10),
('Quiz sobre o Grêmio', 10),
('Quiz sobre o Athletico Paranaense', 10),
('Quiz sobre o Coritiba', 10),
('Quiz sobre a Libertadores', 10),
('Quiz sobre a Copa Sul-Americana', 10),
('Quiz sobre o Campeonato Argentino', 10),
('Quiz sobre o Campeonato Chileno', 10),
('Quiz sobre o Campeonato Colombiano', 10),
('Quiz sobre o Campeonato Uruguaio', 10),
('Quiz sobre a Champions League', 10),
('Quiz sobre a Europa League', 10),
('Quiz sobre a Conference League', 10),
('Quiz sobre a Premier League', 10),
('Quiz sobre a FA Cup', 10),
('Quiz sobre o Liverpool', 10),
('Quiz sobre o Manchester United', 10),
('Quiz sobre o Chelsea', 10),
('Quiz sobre o Arsenal', 10),
('Quiz sobre o Manchester City', 10),
('Quiz sobre o Tottenham', 10),
('Quiz sobre a LaLiga', 10),
('Quiz sobre a Copa Del Rey', 10),
('Quiz sobre o Barcelona', 10),
('Quiz sobre o Real Madrid', 10),
('Quiz sobre o Atlético de Madrid', 10),
('Quiz sobre a Serie A Italiana', 10),
('Quiz sobre a Coppa Italia', 10),
('Quiz sobre a Juventus', 10),
('Quiz sobre a Internazionale', 10),
('Quiz sobre o Milan', 10),
('Quiz sobre o Napoli', 10),
('Quiz sobre a Roma', 10),
('Quiz sobre a Lazio', 10),
('Quiz sobre a Bundesliga', 10),
('Quiz sobre a DFB-Pokal', 10),
('Quiz sobre o Bayern de Munique', 10),
('Quiz sobre o Borussia Dortmund', 10),
('Quiz sobre a Ligue One', 10),
('Quiz sobre a Coupe de France', 10),
('Quiz sobre o PSG', 10),
('Quiz sobre o Olympique de Marseille', 10);

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
    u.nome,
    q.nome AS quiz,
    r.quantidadeAcertos,
    q.total_perguntas,
    ROUND((r.quantidadeAcertos / q.total_perguntas) * 100, 2) AS porcentagem
FROM resultados r
JOIN usuario u ON r.fkUsuario = u.idUsuario
JOIN quizzes q ON r.fkQuizzes = q.idQuizzes
WHERE u.nome = 'Mariana Alves';