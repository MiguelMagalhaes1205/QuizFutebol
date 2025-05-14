create database QuizFutebol;

use QuizFutebol;

create table usuario(
	idUsuario int primary key auto_increment,
    nome varchar(200),
	email varchar(200),
    senha varchar(50)
);

create table quizzes(
	idQuizzes int primary key auto_increment,
	nome varchar(200),
	dificuldade varchar(20),
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

INSERT INTO usuario (nome, email, senha) VALUES
('Lucas Souza', 'lucas@gmail.com', '123senha'),
('Mariana Alves', 'mariana@gmail.com', 'abc123'),
('Pedro Lima', 'pedro@gmail.com', 'senha321');

INSERT INTO quizzes (nome, dificuldade, total_perguntas) VALUES
('Quiz Corinthians 2023', 'fácil', 5),
('História do Futebol', 'médio', 10),
('Campeonatos Internacionais', 'difícil', 15);

-- Lucas fez o quiz do Corinthians e acertou 4 de 5
INSERT INTO resultados (fkUsuario, fkQuizzes, quantidadeAcertos) VALUES
(1, 1, 4);

-- Mariana fez o quiz de História e acertou 7 de 10
INSERT INTO resultados (fkUsuario, fkQuizzes, quantidadeAcertos) VALUES
(2, 2, 7);

-- Pedro fez o quiz internacional e acertou 10 de 15
INSERT INTO resultados (fkUsuario, fkQuizzes, quantidadeAcertos) VALUES
(3, 3, 10);

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