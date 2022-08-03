// SPDX-License-Identifier: GPL-3.0

 pragma solidity  ^0.8.0;

 import  "@openzeppelin/contracts/token/ERC20/ERC20.sol";

 contract DevToken is ERC20{
   constructor() ERC20("DevToken", "DVT"){owner = msg.sender; // setting the owner the contract deployer
       _mint(msg.sender,1000*10**18);
   }
   address owner; // varible that will contain the address of the cont
    
   

    modifier onlyOwner() {
        require(msg.sender == owner, "Ownable:  caller is not the owner" );
        _;
}
mapping (address => bool) whitelistedAddresses;          
function addUser(address _addressToWhitelist) public onlyOwner {
    whitelistedAddresses[_addressToWhitelist] = true;
}
function verifyUser(address _whitelistedAddress) public view returns(bool) {
    bool userIsWhitelisted = whitelistedAddresses[_whitelistedAddress];
    return userIsWhitelisted;
}
modifier isWhitelisted(address _address) {
    require(whitelistedAddresses[_address], "You need to be whitelisted");_;
  }
  
  function exampleFunction() public view isWhitelisted(msg.sender) returns(bool){
     return (true);
  }
 }
