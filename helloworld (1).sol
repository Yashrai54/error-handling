// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.17 and less than 0.9.0
pragma solidity ^0.8.17;

contract agechecker{
    function vote(uint age)public pure{
        require(age>18,"Not eligible");
    }
    function reverting(uint age)public pure{
         if(age<18){
            revert("Not eligible");
         }
    }
    function asserting(uint age)public pure{
      assert(age<=18);
    }
}
