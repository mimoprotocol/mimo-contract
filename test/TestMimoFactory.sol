pragma solidity ^0.5.12;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/ERC20.sol";
import "../contracts/MimoFactory.sol";
import "../contracts/MimoExchange.sol";
import "../test/util/StandardToken.sol";

contract TestMimoFactory {
  // Truffle will send the TestMimoFactory 10 IOTX after deploying the contract.
  uint public initialBalance = 10 ether;

  address exchange;
  StandardToken abctoken;

  function beforeAll() public {
    MimoFactory factory = MimoFactory(DeployedAddresses.MimoFactory());
    abctoken = new StandardToken("ABC Token", "ABC");
    exchange = factory.createExchange(address(abctoken));
  }

  function testCreateExchange() public {
    address payable pexchange = address(uint160(exchange));
    MimoExchange mimoex = MimoExchange(pexchange);
    Assert.equal(mimoex.factoryAddress(), DeployedAddresses.MimoFactory(), "exchange address wrong");

    MimoFactory factory = MimoFactory(DeployedAddresses.MimoFactory());
    Assert.equal(factory.getExchange(address(abctoken)), exchange, "getExchange returns wrong");
    Assert.equal(factory.getToken(exchange), address(abctoken), "getToken returns wrong");
    Assert.equal(factory.getTokenWithId(1), address(abctoken), "getTokenWithId returns wrong");
  }

}
