const contrato = artifacts.require("nomeContrato");

module.exports = function(deployer) {
    // deployment steps
    deployer.deploy(contrato);
  };