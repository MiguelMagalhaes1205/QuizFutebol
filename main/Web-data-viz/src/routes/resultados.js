var express = require("express");
var router = express.Router();

var resultadosController = require("../controllers/resultadosController");

router.post('/registrar', resultadosController.registrar);

module.exports = router;