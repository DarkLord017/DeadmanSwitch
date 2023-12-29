pragma solidity ^0.8.0;

contract DeadmanSwitch {
    address payable public owner;
    address payable public presetAddress;
    uint public BlockNumberchecked;
    uint public trno = 10;

    constructor(address payable _presetAddress) payable  {
        owner = payable(msg.sender);
        presetAddress = _presetAddress;
        BlockNumberchecked = block.number;
    }

    function still_alive() public {
        require(msg.sender == owner, "Only the owner can call this function.");
        BlockNumberchecked = block.number;
    }

    function not_alive() public {
        require (block.number - BlockNumberchecked > trno) ;
            selfdestruct(presetAddress);
        
    }
}
