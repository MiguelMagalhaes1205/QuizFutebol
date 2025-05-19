var empresaModel = require("../models/empresaModel");

function buscarPorId(req, res) {
  var id = req.params.id;

  empresaModel.buscarPorId(id).then((resultado) => {
    res.status(200).json(resultado);
  });
}


module.exports = {
 buscarPorId
};
