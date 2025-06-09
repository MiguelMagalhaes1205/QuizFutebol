var express = require("express");
var router = express.Router();

var medidaController = require("../controllers/medidaController");

router.get("/porcentagem-total/:idUsuario", function (req, res) {
    medidaController.buscarPorcentagemTotal(req, res);
});

router.get("/porcentagem-categoria/:idUsuario", function (req, res) {
    medidaController.buscarPorcentagemPorCategoria(req, res);
})

router.get("/ultimos-resultados/:idUsuario", function (req, res) {
    medidaController.ultimosResultadosQuiz(req, res);
})

module.exports = router;