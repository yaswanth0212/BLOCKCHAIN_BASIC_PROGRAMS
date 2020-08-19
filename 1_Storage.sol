pragma solidity >=0.4.22 <0.7.0;

/**
 * @title Storage
 * @dev Store & retreive value in a variable
 */
 /**Asume the employee getting salary for every quater of the year and the total is calculate in the given contract and stored**/
contract Storage {

    uint256 p1_sal;
    uint256 p2_sal;
    uint256 p3_sal;
    uint256 p4_sal;
    uint256 Total;
    
    string name;
    string role;
    string employeeid;
    function details(string memory _name,string memory _role,string memory _id,uint256 nu_1,uint256 nu_2,uint256 nu_3,uint256 nu_4) public {
    name=_name;
    role=_role;
    employeeid=_id;
    p1_sal=nu_1;
    p2_sal=nu_2;
    p3_sal=nu_3;
    p4_sal=nu_4;
    Total=(p1_sal+p2_sal+p3_sal+p4_sal);
    
        
    }
   /** function store(uint256 nu_1,uint256 nu_2,uint256 nu_3,uint256 nu_4) public {
    p1_sal=nu_1;
    p2_sal=nu_2;
    p3_sal=nu_3;
    p4_sal=nu_4;
    Total=(p1_sal+p2_sal+p3_sal+p4_sal);
        
    }**/

    /**
     * @dev Return value 
     * @return value of 'number'
     */
    function retreive() public view returns (uint256,string memory,string memory,string memory){

        return (Total,name,role,employeeid);
        //return name;
    }
}
