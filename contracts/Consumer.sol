//SPDX-License-Identifier: MIT

import "./IOracle.sol";

pragma solidity ^0.8.0;

contract Consumer {
    IOracle public oracle;

    constructor(address _oracle){
        oracle = IOracle(_oracle);
    }

    function foo() external{
        bytes32 key = keccak256(abi.encodePacked("BTC/USD"));

        (bool result, uint timestamp, uint data) = oracle.getData(key);
        require(result, "Couldn't get the prices");
        require(timestamp >= block.timestamp - 2 minutes, 'prices too old');
        //do somethingwith the price
    }
}