pragma solidity >=0.4.22 <0.7.0;

 

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";

 


contract retailar is ERC721 {
    
     
    address owner; // varaible declaration for storing address of the owner
    uint256 productId;// varaible declaration for storing  file id 
    uint randNonce = 3000000000; // varaible declaration for randNonce
    uint Token; // varaible declaration for token storing
    
    struct consumer_details{ //structure declaration for producers
         string food_type; // varaible declaration for foodtype
         string food_name; // varaible declaration for foodname
         string food_place; // varaible declaration for food produced place
         string food_pesticides; // varaible declaration for food food_pesticides used
         string producers_name;// varaible declaration for food producers
         string retailar_name;
         string consumer_name;
    }consumer_details sm;
 mapping (uint256 => consumer_details) files; //mapping producers_details
 
 
 // constructor for the contract with token name and symbol
 constructor() ERC721("AMRITA-FILE-STORAGE","AFM") public {
        owner=msg.sender;
        
    }   
    
    
    //modifier declaration
    modifier isOwner() {
        require(msg.sender == owner, "Access is not allowed");
        _;
    }
    
     function namedecl() public view  returns (string memory) {
         //calling the Built-in function in ERC721
        return name();
    }
    
    
    /**
     * @dev Function to display symbol of the token 
    */
     function symboldecl() public view  returns (string memory) {
         //calling the Built-in function in ERC721
        return symbol();
    }
    
     /**
     * @dev Function to display total count of the token 
    */
    
     function totalSupplycount() public view  returns (uint256) {
         //calling the Built-in function in ERC721
        return totalSupply();
     }
    
        //function Calling for minting
     function mintMyToken(uint256 fileId) public  returns (uint256)   {
        //Fl.fileowner=msg.sender;
        //Calling the Built-in function in ERC721
        _mint(msg.sender,fileId);
        return(fileId);
        
        
    }
    //function Calling for burning
      function burnMyToken(uint256 fileId) public {
          if((ownerOf(fileId)== msg.sender||msg.sender == owner))
         {
         //Calling the Built-in function in ERC721
        _burn(fileId);
         }
        
    }
    
//function Calling for getting fileid
    function getProductId()public view returns(uint){
        return Token;
    }
   
 //function Calling for sending product details
 function addProductDetails(uint productid,string memory foodtype,string memory foodname,string memory foodplace,string memory foodpesticides,string memory producersname,string memory retailarname,string memory consumername) public {
   sm.food_type = foodtype;
   sm.food_name=foodname;
   sm.food_place=foodplace;
   sm.food_pesticides=foodpesticides;
   sm.retailar_name=retailarname;
   sm.producers_name=producersname;
   sm.consumer_name=consumername;
   Token=mintMyToken(productid);
   files[Token]=sm;
   
 }
//function Calling for geting product details
 function getProductDetails(uint256 productId) public view returns (string memory,string memory,string memory,string memory,string memory,string memory,string memory) {
     if(_exists(productId)&&(ownerOf(productId)== msg.sender||msg.sender == owner)){
     
     consumer_details storage sm = files[productId];
        return (sm.food_type,sm.food_name,sm.food_place,sm.food_pesticides, sm.producers_name,sm.retailar_name,sm.consumer_name);
     }
     else
     {
            string memory foodtype='No-Data';
            string memory foodname='No-Data';
            string memory foodplace='No-Data';
            string memory foodpesticides='No-Data';
            string memory producersname='No-Data';
            string memory retailarname='No-Data';
            string memory consumername='No-Data';
            
            
            
            
            return(foodtype,foodname,foodplace,foodpesticides,producersname,retailarname,consumername);
     }
   
 }

 
  

    
}
