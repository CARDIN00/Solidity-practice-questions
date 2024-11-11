// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
// a struct representing a "Product" ( name, price, and stock).
// Use a mapping to store each product by its unique ID (uint). 
//add new products, update their stock, and retrieve product information.

contract ProductsInfo{

    struct Info{
        string name;
        uint price;
        uint stock;
    }
    mapping(uint => Info) public productDetail;

    function add(uint num, string memory _name, uint _price, uint _stock) public {
        require(bytes(productDetail[num].name).length == 0 ," the product does not exist");
        productDetail[num] = Info({name :_name, price : _price, stock : _stock});
    }

    function update(uint num, string memory _name, uint _price, uint _stock) public{
        require(bytes(productDetail[num].name).length !=0,"the product already exists");
        productDetail[num].name = _name;
        productDetail[num].price =_price;
        productDetail[num].stock =_stock;
    }

    function retrieve(uint num) public view returns(Info memory){
        return productDetail[num];
    }
}    