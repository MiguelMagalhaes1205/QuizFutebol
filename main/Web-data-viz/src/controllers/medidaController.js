var medidaModel = require("../models/medidaModel");

function buscarPorcentagemTotal(req, res) {

    var idUsuario = req.params.idUsuario;

    medidaModel.buscarPorcentagemTotal(idUsuario).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar a Porcentagem.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}


function buscarPorcentagemPorCategoria(req, res) {

    var idUsuario = req.params.idUsuario;

    console.log(`Recuperando medidas em tempo real`);

    medidaModel.buscarPorcentagemPorCategoria(idUsuario).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as porcentagens.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function ultimosResultadosQuiz(req, res) {

    var idUsuario = req.params.idUsuario;

    console.log(`Recuperando medidas em tempo real`);

    medidaModel.ultimosResultadosQuiz(idUsuario).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar os resultados", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

module.exports = {
    buscarPorcentagemTotal,
    buscarPorcentagemPorCategoria,
    ultimosResultadosQuiz
}