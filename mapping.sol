pragma solidity >=0.4.22 <0.7.0;

/**
 * @title Storage
 * @dev Store & retreive value in a variable
 */
contract Storage {
    
struct Tsal{
    uint256 p1_sal;
    uint256 p2_sal;
    uint256 p3_sal;
    uint256 p4_sal;
    uint256 Total;
    string name;
    string role;
}Tsal Ts;
mapping (string => Tsal) employee_list;
     function details(string memory _name,string memory _role,string memory _id,uint256 nu_1,uint256 nu_2,uint256 nu_3,uint256 nu_4) public {
    Ts.name=_name;
    Ts.role=_role;
    Ts.p1_sal=nu_1;
    Ts.p2_sal=nu_2;
    Ts.p3_sal=nu_3;
    Ts.p4_sal=nu_4;
    Ts.Total=(Ts.p1_sal+Ts.p2_sal+Ts.p3_sal+Ts.p4_sal);
    employee_list[_id]=Ts;
    
        
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
    function retreive(string memory _id) public view returns (uint256,string memory,string memory){
    Tsal memory Ts = employee_list[_id];
        return (Ts.Total,Ts.name,Ts.role);
        //return name;
    }
}
