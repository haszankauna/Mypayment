// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Payment{
    //send payment to address
    function sendPayment(address receiver) public payable{
        require(msg.value > 0, "Insufficient Ether provided");
        (bool success, ) = payable(receiver).call{value: msg.value}("");
        require(success, "Failed to send money");
    }
    //send payment to the contract
    function sendToContract() public payable{
        require(msg.value>0, "Insufficient Ether provided");
        (bool success, ) = payable(address(this)).call{value:msg.value}("");
        require(success, "Failed to send money");
    }
    receive()external payable{}
    //get the contract balance
    function getBalance() public view returns (uint256){
        return address(this).balance;
    
    }   
}