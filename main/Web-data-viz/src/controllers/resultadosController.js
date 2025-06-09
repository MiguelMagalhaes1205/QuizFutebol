var resultadosModel = require("../models/resutadosModel");

function registrar(req, res){
    var fkUsuario = req.body.fkUsuario;
    var fkQuizzes = req.body.fkQuizzes;
    var quantidadeAcertos = req.body.quantidadeAcertos;

    if (fkUsuario == undefined || fkQuizzes == undefined || quantidadeAcertos == undefined){
        res.status(400).send("Faltam parametros!") 
    } else {
        resultadosModel.registrar(fkUsuario, fkQuizzes, quantidadeAcertos)
        .then(() => {
            res.status(201).json({ mensagem: "Resultado registrado com sucesso!" });
        })
        .catch((erro) => {
            console.log(erro);
            res.status(500).json(erro.sqlMessage)
        });
    }
}

module.exports = {
    registrar
}