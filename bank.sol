
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract BankContract
{
    mapping(address => uint256) private balance;

    event Deposit(address indexed customer, uint256 amt);
    event Withdrawal(address indexed customer, uint256 amt);


    function deposit() public payable {
        require(msg.value > 0, "Amount must be grater than 0");
        balance[msg.sender] += msg.value;

        emit Deposit(msg.sender, msg.value);
    }

    function withdraw(uint256 amt) public payable {
        require(amt > 0, "Amount must be grater than 0");
        require(balance[msg.sender] >= amt, "Insufficient balance !");

        balance[msg.sender] -= amt;

        (bool confirm,) = payable(msg.sender).call{value: amt}("");

        require(confirm, "Transaction failed");

        emit Withdrawal(msg.sender, amt);
    }

    function check_balance() public view returns (uint256) {
        return balance[msg.sender];
    }
}