var database = require("../database/config");

function registrar(fkUsuario, fkQuizzes, quantidadeAcertos){

    var instrucaoSql = `
     insert into resultados (fkUsuario, fkQuizzes, quantidadeAcertos)
     values (${fkUsuario}, ${fkQuizzes}, ${quantidadeAcertos})
     `;

     return database.executar(instrucaoSql);

}

function listarPorUsuario(fkUsuario){
    var instrucaoSql = `
    select
        q.nome as NomeQuiz,
        r.quantidadeAcertos,
        q.total_perguntas,
        round((r.quantidadeAcertos / q.total_perguntas) * 100 / 2) as porcentagem
    from resultados r
    join quizzes q on r.fkQuizzes = q.idQuizzes
    where fkUsuario = ${fkUsuario}`

    return database.executar(instrucaoSql);
}

module.exports = {
    registrar,
    listarPorUsuario
};