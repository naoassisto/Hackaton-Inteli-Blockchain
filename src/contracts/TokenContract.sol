// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MeuToken is ERC20, Ownable {
    constructor(uint256 initialSupply) ERC20("GreeToken", "GTK") {
        _mint(msg.sender, initialSupply);
    }

    // A função 'transfer' permite que o proprietário dos tokens transfira uma quantidade específica de tokens para outro endereço.
    // O endereço 'to' é o destinatário dos tokens e o 'value' é a quantidade de tokens a serem transferidos.
    function transfer(address to, uint256 value) public override returns (bool) {
        return super.transfer(to, value);
    }

    // A função 'approve' permite que o proprietário dos tokens autorize um terceiro (endereço 'spender') a gastar até um limite específico.
    function approve(address spender, uint256 value) public override returns (bool) {
        return super.approve(spender, value);
    }

    // A função 'transferFrom' permite que um terceiro, que foi previamente autorizado pelo proprietário dos tokens, transfira tokens em nome do proprietário.
    function transferFrom(address from, address to, uint256 value) public override returns (bool) {
        return super.transferFrom(from, to, value);
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function burn(address from, uint256 amount) public onlyOwner {
        _burn(from, amount);
    }
}

