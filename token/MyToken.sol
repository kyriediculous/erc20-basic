pragma solidity ^0.4.0;

import './interface/ERC20.sol';

contract MyToken is StandardToken {
    string public name = "MyToken";
    string public symbol = "MYT";
    uint public decimals = 8;
    uint public INITIAL_SUPPLY = 1000000;

    function MyToken() {
        totalSupply = INITIAL_SUPPLY;
        balances[msg.sender] = totalSupply;
    }
}
