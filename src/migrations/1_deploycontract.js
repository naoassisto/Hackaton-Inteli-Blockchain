const contrato = artifacts.require("Token");

module.exports = function(deployer) {
    // deployment steps
    deployer.deploy(contrato);
  };