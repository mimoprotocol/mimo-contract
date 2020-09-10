pragma solidity ^0.5.12;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/ERC20.sol";
import "../contracts/MimoFactory.sol";
import "../contracts/MimoExchange.sol";

contract TestMimoExchange {

  function testSetup() public {
    MimoExchange exchange = MimoExchange(DeployedAddresses.MimoExchange());
    exchange.setup(DeployedAddresses.ERC20());
    Assert.equal(exchange.name(), "mimo", "exchange name wrong");
    Assert.equal(exchange.symbol(), "MIM", "exchange symbol wrong");
    Assert.equal(exchange.decimals(), 18, "exchange decimals wrong");
  }

}
