// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/access/Ownable.sol";

/// @custom:security-contact julien@strat.cc
contract Shop is Ownable {

    uint256 public price;
    string public champsElysees;
    
    constructor(uint _price) {
        price = _price;
    }

    function buy(string memory _champsElysees) 
        public
        payable
    {
        require(msg.value == price, "MSG_VALUE_DOES_NOT_MATCH_PRICE");
        champsElysees = _champsElysees;
        payable(owner()).transfer(msg.value);
    }

    receive() external payable {
		require(false, "CANNOT_DIRECTLY_SEND_ANY_VALUE");
	}

	fallback() external payable {
		require(false, "CANNOT_DIRECTLY_SEND_ANY_DATA");
	}
}
