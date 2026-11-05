
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.34;
contract StudentData {

    struct Student {
        uint roll;
        string name;
        string course;
        uint age;
    }

    Student[] public students;

    function add_student(uint roll, string memory name, string memory course, uint age) public {

        students.push(
            Student(roll, name, course, age)
        );
    }

    function get_student(uint id) public view returns (string memory, string memory, uint)
    {
        require(id < students.length, "Enter correct student id");

        Student memory s = students[id];

        return (s.name, s.course, s.age);
    }

    function get_no_of_students() public view returns (uint) {
        return students.length;
    }
}