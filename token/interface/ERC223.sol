pragma solidity ^0.4.10;

import 'ERC20.sol';

contract ERC223 is ERC20 {
    function transfer(address to, uint value, bytes data);
    event Transfer(address indexed from, address indexed to, uint value, bytes indexed data);
}
