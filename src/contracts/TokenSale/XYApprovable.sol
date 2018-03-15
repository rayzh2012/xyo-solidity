pragma solidity ^0.4.19;

import "./XYKillable.sol";

contract XYApprovable is XYKillable {

    mapping (address => bool) public approvers;

    function XYApprovable () public {
      approvers[msg.sender] = true;
    }

    function setApprover(address _approver, bool _enabled) public onlyOwner notKilled {
      approvers[_approver] = _enabled;
    }

    modifier onlyApprovers() {
        require(approvers[msg.sender]);
        _;
    }

}
