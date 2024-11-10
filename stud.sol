// SPDX-License-Identifier: UNLICENSED
pragma solidity >= 0.7.0;

contract Student_management{

	struct Student{
		int stud_id;
		string Name;
		string Department;
	}

	Student[] Students;

	function add_stud(int stud_id, string memory Name, string memory Department) public{
		Student memory stud = Student(stud_id, Name, Department);
		Students.push(stud);
	}

	function getStudent(int stud_id) public view returns(string memory, string memory){
		for(uint i = 0; i < Students.length; i++){
			Student memory stud = Students[i];
			if(stud.stud_id == stud_id){
				return(stud.Name, stud.Department);
			}
		}
        return("Name Not Found", "Department Not Found");
	}
	function getAllStudents() public view returns (int[] memory, string[] memory, string[] memory) {
        int[] memory ids = new int[](Students.length);
        string[] memory names = new string[](Students.length);
        string[] memory departments = new string[](Students.length);

        for (uint i = 0; i < Students.length; i++) {
            ids[i] = Students[i].stud_id;
            names[i] = Students[i].Name;
            departments[i] = Students[i].Department;
        }

        return (ids, names, departments);
    }

	// Fallback Function
	fallback() external payable{
		Students.push(Student(7, "XYZ", "Mechanical"));
	}

	// Receive Function
	receive() external payable {}
}
