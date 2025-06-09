var database = require("../database/config");

function buscarPorcentagemTotal(idUsuario) {

    var instrucaoSql = `SELECT 
                        u.nome AS nome_usuario,
                        SUM(r.quantidadeAcertos) AS total_acertos,
                        SUM(q.total_perguntas) AS total_perguntas,
                        ROUND((SUM(r.quantidadeAcertos) / SUM(q.total_perguntas)) * 100, 2) AS porcentagem_geral
                        FROM resultados r
                        JOIN usuario u ON r.fkUsuario = u.idUsuario
                        JOIN quizzes q ON r.fkQuizzes = q.idQuizzes
                        WHERE u.idUsuario = ${idUsuario}
                        GROUP BY u.idUsuario;`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarPorcentagemPorCategoria(idUsuario) {

    var instrucaoSql = `SELECT 
                        c.nome AS categoria,
                        ROUND(AVG(r.quantidadeAcertos / q.total_perguntas * 100), 2) AS porcentagem_categoria
                        FROM categorias c
                        LEFT JOIN quizzes q ON q.fkCategoria = c.idCategoria
                        LEFT JOIN resultados r ON r.fkQuizzes = q.idQuizzes AND r.fkUsuario = ${idUsuario}
                        GROUP BY c.idCategoria, c.nome;`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function ultimosResultadosQuiz(idUsuario) {

    var instrucaoSql = `SELECT 
                        q.nome AS nome_quiz,
                        r.quantidadeAcertos
                        FROM resultados r
                        JOIN quizzes q ON r.fkQuizzes = q.idQuizzes
                        WHERE r.fkUsuario = ${idUsuario}
                        ORDER BY r.idResultado DESC
                        LIMIT 8;`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    buscarPorcentagemTotal,
    buscarPorcentagemPorCategoria,
    ultimosResultadosQuiz
}
