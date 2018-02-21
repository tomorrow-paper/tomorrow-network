pragma solidity ^0.4.8;

contract Tomorrow {

    struct People {
        bytes32 firstname;
        bytes32 lastname;
        uint birthday;
        address[] relatives;
    }
    
    mapping(address => People) public storedPeoples;
    address owner;
    
    function Tomorrow() public {
        owner = msg.sender;
    }
    
    function createSelf(bytes32 firstname, bytes32 lastname, uint birthday) public {
        People storage people = storedPeoples[msg.sender];
        assert(people.firstname != 0);
        
        people.firstname = firstname;
        people.lastname = lastname;
        people.birthday = birthday;
    }
    
    function addRelative(address relative) public {
        People storage people = storedPeoples[msg.sender];
        assert(people.firstname != 0);
        people.relatives.push(relative);
    }
}