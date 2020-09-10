pragma solidity ^0.5.12;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/ERC20.sol";
import "../contracts/MimoFactory.sol";
import "../contracts/MimoExchange.sol";

contract TestMimoFactory {

  function testCreateExchange() public {
    MimoFactory factory = MimoFactory(DeployedAddresses.MimoFactory());
    factory.initializeFactory(DeployedAddresses.MimoExchange());

    address exchange = factory.createExchange(DeployedAddresses.ERC20());
    Assert.equal(factory.getExchange(DeployedAddresses.ERC20()),
      exchange, "getExchange returns wrong");

    Assert.equal(factory.getToken(exchange),
      DeployedAddresses.ERC20(), "getToken returns wrong");

    Assert.equal(factory.getTokenWithId(1),
      DeployedAddresses.ERC20(), "getTokenWithId returns wrong");
  }
}
