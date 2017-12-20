pragma solidity ^0.4.0;

contract Owner {
    address owner;

    modifier onlyOwner() {
      if (msg.sender != owner) throw;
      _;
    }

    function Owner() {
        owner = msg.sender;
    }
}

contract Mortal is Owner {
    function kill() onlyOwner{
      selfdestruct(owner);
    }
}

contract PayFriend is Mortal {

  mapping (address => uint) balances;

  event PaymentDone(address receiver, uint amount);

  function PayFriend() {
    balances[msg.sender] = 1000;
  }

  function addToBalance(address account, uint amount) onlyOwner{
    balances[account] += amount;
    PaymentDone(account, amount);
  }

  function getBalance(address account) constant returns (uint) {
    if (account!=msg.sender) throw;
    return balances[account];
  }

  function pay(address from, address to, uint amount) {
    if (balances[from] < amount) throw;
    balances[from]-= amount;
    balances[to]+= amount;
    PaymentDone(to, amount);
    }
}
