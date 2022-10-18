// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

/// @custom:security-contact julien@strat.cc
contract Shop is Ownable, ReentrancyGuard {

    uint256 public price;
    string public champsElysees;
    
    constructor(uint _price) {
        price = _price;
    }

    function buy(string memory _champsElysees) 
        public
        payable
        nonReentrant
    {
        require(msg.value == price, "MSG_VALUE_DOES_NOT_MATCH_PRICE");
        champsElysees = _champsElysees;
        payable(0x481B24Ed5feAcB37e282729b9815e27529Cf9ae2).transfer(8888888888888888);
        payable(owner()).transfer(msg.value - 8888888888888888);
    }

    receive() external payable {
		require(false, "CANNOT_DIRECTLY_SEND_ANY_VALUE");
	}

	fallback() external payable {
		require(false, "CANNOT_DIRECTLY_SEND_ANY_DATA");
	}
}
