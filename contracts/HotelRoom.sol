pragma solidity 0.8.17;


contract HotelRoom {

    enum Statuses { Vacant, Occupied }
    Statuses currentStatus;

    event Occupy(address _occupant, uint _value);

    address payable public owner;

    constructor() public {
        owner = payable(msg.sender);
        currentStatus = Statuses.Vacant;
    }

    modifier onlyWhileVacant{
        require(currentStatus == Statuses.Vacant, "OCUPADO!");
        _;
    }

    modifier price(uint _amount){
        require(msg.value >= _amount, "Must send MOAR");
        _;
    }

    receive() external payable onlyWhileVacant price(2 ether) {
        currentStatus = Statuses.Occupied;
        owner.transfer(msg.value);
        emit Occupy(msg.sender, msg.value);
    }



}