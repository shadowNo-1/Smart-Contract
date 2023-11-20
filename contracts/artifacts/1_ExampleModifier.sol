// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract ExampleModifier{
    address public owner;
    uint256 public account;

    constructor(){
        owner = msg.sender;
        account = 0;
    }

    modifier onlyOwner(uint256 _account){       //创建只有创建者可以调用该合约的方法
        require(msg.sender == owner ,"Only Owner"); //校验
        require(_account > 100, "Valid 100");  /*可合并为一个方法*/
        _;
    }

    /*modifier valid100(uint256 _account){
        require(_account > 100, "Valid 100");   //account值必须大于100
        _;
    }*/

    // function updateAccount(uint256 _account) public onlyOwner /*在此处调用onlyOwner方法*/ valid100(_account) /*在此处调用valid100方法*/{
    //     /*if(msg.sender == owner){    //只有创建者可以调用该合约的判断
    //         account = _account;
    //     }*/
    //     account = _account;
    // }

    function updateAccount(uint256 _account) public onlyOwner(_account){
       
        account = _account;
    }

    
}