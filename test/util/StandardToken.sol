pragma solidity ^0.5.12;

import "../../contracts/ERC20.sol";

contract StandardToken is ERC20 {
  string public name = "ABC Token";
  string public symbol = "ABC";
  uint8 public constant decimals = 18;

  constructor(string memory name_, string memory symbol_) public {
      name = name_;
      symbol = symbol_;
  }

  function mint(address account, uint256 value) public {
    _mint(account, value);
  }

  function burn(address account, uint256 value) public {
    _burn(account, value);
  }
}
