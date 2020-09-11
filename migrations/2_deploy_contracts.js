const ERC20 = artifacts.require("ERC20");
const MimoFactory = artifacts.require("MimoFactory");
const MimoExchange = artifacts.require("MimoExchange");

module.exports = function(deployer) {
  deployer.deploy(MimoExchange);
  deployer.link(MimoExchange, MimoFactory);
  deployer.deploy(MimoFactory);
};
