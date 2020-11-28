pragma solidity >=0.4.22 <0.7.0;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";


contract FileStorage is ERC721 {
    
    address owner; // varaible declaration for storing address of the owner
    uint256 fileId;// varaible declaration for storing  file id 
    uint randNonce = 3000000000; // varaible declaration for randNonce
    uint Token; // varaible declaration for token storing
    
    struct student_details{ //structure declaration for student
         string ipfsHash;  // varaible declaration for ipfsHash in structure
         string filetype; // varaible declaration for filetype
         string student_name; // varaible declaration for student name
         string student_course; // varaible declaration for course
         string student_branch; // varaible declaration for branch
         //string student_section; // varaible declaration for section
         string student_id; // varaible declaration for id
         string subject_name; // varaible declaration for subject name
    }student_details sm;
 mapping (uint256 => student_details) files; //mapping student_details
 
 struct teacher_details{ //structure declaration for teacher
         string ipfsHash; // varaible declaration for ipfsHash in structure
         string filetype;  // varaible declaration for filetype
         string teacher_name; // varaible declaration for teacher_name
         string course;    // varaible declaration for course
         string branch;    // varaible declaration for branch
         //string section;    // varaible declaration for section
         string subject_name;  // varaible declaration for subject_name
    }teacher_details tm;   
 mapping (uint256 => teacher_details) filet; //mapping teacher_details
 
 // constructor for the contract with token name and symbol
 constructor() ERC721("AMRITA-FILE-STORAGE","AFM") public {
        owner=msg.sender;
        
    }   
    
    
    //modifier declaration
    modifier isOwner() {
        require(msg.sender == owner, "Access is not allowed");
        _;
    }
    
    
     function randModulus()public view returns(uint)
    {
        	return uint(keccak256(abi.encodePacked(now,block.difficulty,msg.sender)))%randNonce;
    }
    
    //function Calling for namedecl
    function namedecl() public view  returns (string memory) {
        return name();
    }
    //function Calling for symboldecl
     function symboldecl() public view  returns (string memory) {
        return symbol();
    }
    //function Calling for totalSupplycount
     function totalSupplycount() public view  returns (uint256) {
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
    function getfileId()public view returns(uint){
        return Token;
    }
   
 //function Calling for sending student details
 function sendStudentDetails(string memory hash,string memory filetype,string memory name,string memory stdid,string memory course ,string memory branch,string memory subname) public {
   sm.ipfsHash = hash;
   sm.filetype=filetype;
   sm.student_name=name;
   sm.student_id=stdid;
   
   sm.student_course=course;
   sm.student_branch=branch;
   sm.subject_name=subname;
   fileId=randModulus();
   Token=mintMyToken(fileId);
   files[Token]=sm;
 }
//function Calling for geting student details
 function getStudentDetails(uint256 fileId) public view returns (string memory,string memory,string memory,string memory,string memory,string memory,string memory) {
     if(_exists(fileId)&&(ownerOf(fileId)== msg.sender||msg.sender == owner)){
     
     student_details storage sm = files[fileId];
        return (sm.ipfsHash,sm.filetype,sm.student_name,sm.student_id,sm.student_course,sm.student_branch,sm.subject_name);
     }
     else
     {
            string memory ipfsHash='No-Data';
            string memory filetype='No-Data';
            string memory student_name='No-Data';
            string memory student_id='No-Data';
            string memory student_course='No-Data';
            string memory student_branch='No-Data';
            string memory subject_name='No-Data';
            
            
            return(ipfsHash,filetype,student_name,student_id,student_course,student_branch,subject_name);
     }
   
 }
 //function Calling for sending teacher details
 
  function sendTeacherDetails(string memory hash,string memory filetype,string memory teacher,string memory course ,string memory branch,string memory subname) public {
        
        
        tm.ipfsHash = hash;
        tm.filetype=filetype;
        tm.teacher_name=teacher;
        
        tm.course=course;
        tm.branch=branch;
        tm.subject_name=subname;
        fileId=randModulus();
        Token=mintMyToken(fileId);
        filet[Token]=tm;
        
      
  }
  
  //function Calling for get teacher details
   function getTeacherDetails(uint256 fileId) public view returns (string memory,string memory,string memory,string memory,string memory,string memory) {
     if(_exists(fileId)&&(ownerOf(fileId)== msg.sender||msg.sender == owner)){
     
     teacher_details storage tm = filet[fileId];
        return (tm.ipfsHash,tm.filetype,tm.teacher_name,tm.course,tm.branch,tm.subject_name);
     }
     else
     {
            string memory ipfsHash='No-Data';
            string memory filetype='No-Data';
            string memory teacher_name='No-Data';
            string memory course='No-Data';
            string memory branch='No-Data';
            string memory subject_name='No-Data';
            
            
            return(ipfsHash,filetype,teacher_name,course,branch,subject_name);
     }
   
 }
  
  
  
}
