pragma solidity ^0.6.11;

import "@openzeppelin/contracts-ethereum-package/contracts/Initializable.sol";
import "@openzeppelin/contracts-ethereum-package/contracts/math/SafeMath.sol";

contract GuildFactory is Initializable {
  using SafeMath for uint256;

  uint internal constant ON_CHAIN_PRECISION = 1e18;
  uint internal constant DECIMAL_PRECISION = 1e7;
  address internal constant NULL_ADDRESS = address(0);

  
}
