// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Todo {
    // structre taks
    struct Task {
        string task_name;
        bool is_completed;
        bool is_created;
    }
    // store all taks for address -> id -> taks
    mapping(address => mapping(uint => Task)) tasks;

    // create task
    function create_task(string memory _task_name, uint _task_id) public {
        tasks[msg.sender][_task_id] = Task(_task_name,false,true);
    }

    // show task
    function show_task(uint _task_id) public view returns(Task memory){
        require(tasks[msg.sender][_task_id].is_created == true, "No task created with this id");
        return tasks[msg.sender][_task_id];
    }

    // mark as complete a task
    function mark_complete(uint _task_id) public {
        require(tasks[msg.sender][_task_id].is_created == true, "No task created with this id");
        require(tasks[msg.sender][_task_id].is_completed == false, "Already completed");
        tasks[msg.sender][_task_id].is_completed = true;
    }
}