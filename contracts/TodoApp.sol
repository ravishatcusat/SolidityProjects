// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
// import "hardhat/console.sol";

contract TodoApp {
    struct Todo{ 
        string task;
        bool status;
    }

    Todo[] public todos;

    function create (string calldata _task) external{
        todos.push(Todo({
            task: _task,
            status: false
        }));
    }

    function update (uint _index, string calldata _task) external {
        todos[_index].task = _task;
    }

    function get(uint _index) external view returns (string memory task, bool status){
        return (todos[_index].task, todos[_index].status);
    }

    function toggleStatus(uint _index) external{
        todos[_index].status = !todos[_index].status;
    }

    function deleteTask(uint _index) external{
        require(_index<= todos.length, "Index out of Bound");
        todos[_index].status = todos[todos.length - 1].status;
        todos[_index].task = todos[todos.length - 1].task;
    }
}