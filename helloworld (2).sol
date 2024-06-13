// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.17 and less than 0.9.0
pragma solidity ^0.8.17;

contract crowdfunding{
  uint amount;
  uint goal=30;
  address contributor;
  mapping (address=>uint)contributions;
  
  function deposit(address a,uint value)public {
        assert(value>0);
        contributions[a]+=value;
        amount+=value;
  }

  modifier check(address b){
    require(b==msg.sender,"Not registered");
    _;
  }
  function withdraw(address b,uint value) public check(b) returns(uint) {
      require(value<amount,"Your Contribution is not this much");
      require(amount==goal,"Please use refund functionality");
      contributions[b]-=value;
      amount-=value;
      return amount;
  }
  function refund(address b)public check(b){
      require(amount!=goal,"Please use withdraw Functionality");
      contributions[b]-=amount;
      bool success=true;
      if(!success){
        revert("Refund Failed");
      }
  }
}