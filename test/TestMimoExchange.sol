pragma solidity ^0.5.12;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/ERC20.sol";
import "../contracts/MimoFactory.sol";
import "../contracts/MimoExchange.sol";
import "../test/util/StandardToken.sol";

contract TestMimoExchange {

  function testSetup() public {
    MimoExchange exchange = MimoExchange(DeployedAddresses.MimoExchange());
    StandardToken abctoken = new StandardToken("ABC Token", "ABC");
    exchange.setup(address(abctoken));
    Assert.equal(exchange.name(), "Mimo LP Token: ABC IOTX", "exchange name wrong");
    Assert.equal(exchange.symbol(), "MLP:ABC_IOTX", "exchange symbol wrong");
    Assert.equal(exchange.decimals(), 18, "exchange decimals wrong");
  }

}
