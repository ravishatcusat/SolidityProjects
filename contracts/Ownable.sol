// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
// import "hardhat/console.sol";

contract Ownable {
    address public owner;

    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner{
        require(msg.sender == owner, "Only Owner can do this!!");
        _;
    }

    function setOwner(address _newOwner) external onlyOwner{
        require( _newOwner != address(0), "Invalid new ");
        owner =  _newOwner;
    }

    function onlyOwnerCanCallThis() public onlyOwner{
        //{Some Implementation}
    }

    function anyOneCanCallThis() public{
        //{Some Implementation}
    }
}