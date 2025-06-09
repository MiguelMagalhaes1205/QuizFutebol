var database = require("../database/config");

function registrar(fkUsuario, fkQuizzes, quantidadeAcertos){

    var instrucaoSql = `
     insert into resultados (fkUsuario, fkQuizzes, quantidadeAcertos)
     values (${fkUsuario}, ${fkQuizzes}, ${quantidadeAcertos})
     `;

     return database.executar(instrucaoSql);

}

module.exports = {
    registrar
};