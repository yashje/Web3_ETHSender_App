// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Transactions {
    uint256 public transactionsCount;

    event Transfer(
        address from,
        address receiver,
        uint256 amount,
        string message,
        uint256 timestamp,
        string keyword
    );

    struct TransferStruct {
        address sender;
        address receiver;
        uint256 amount;
        string message;
        uint256 timestamp;
        string keyword;
    }

    TransferStruct[] public transactions;

    function addToBlockchain(
        address payable _receiver,
        uint256 _amount,
        string memory _message,
        string memory _keyword
    ) public {
        transactionsCount++;
        transactions.push(
            TransferStruct(
                msg.sender,
                _receiver,
                _amount,
                _message,
                block.timestamp,
                _keyword
            )
        );

        emit Transfer(
            msg.sender,
            _receiver,
            _amount,
            _message,
            block.timestamp,
            _keyword
        );
    }

    function getAllTransactions()
        public
        view
        returns (TransferStruct[] memory)
    {
        return transactions;
    }
}
