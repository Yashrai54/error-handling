// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.17 and less than 0.9.0
pragma solidity ^0.8.26;

contract LinkedIN{
    
    string skills;
    uint experience;
    string projects;
    uint demand;

    mapping(address=>bool) selection;

    function skillset(string memory _skills,uint _experience,string memory _projects,uint _demand ) public payable {
          if(bytes(skills).length>0 && bytes(projects).length>0){
            revert("Skillset cannot be empty");
          }
          skills=_skills;
          experience=_experience;
          projects=_projects;
          demand=_demand;
    }
    
    
    function joboffer(string memory _skillset,uint salary,uint exp) public {

        assert(salary>0);
         
        for (uint i=0; i<bytes(skills).length; i++) 
         {
           if(bytes(skills)[i]==bytes(_skillset)[i] && demand<=salary && exp<=experience){
              selection[msg.sender]=true;
           }
           else{
              selection[msg.sender]=false;
           }
         }
    }
    function accepted(address a)public view returns(string memory){
      require(selection[a]==true,"Sorry you were rejected");
      string memory accept="Congrats! You are selected";
      return accept;
    }
}